import UIKit
import Flutter
import Photos


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  func getImagesCountFromGallery() -> [Any] {

  let manager = PHCachingImageManager()
  let fetchOptions = PHFetchOptions()
  fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
  let requestOptions = PHImageRequestOptions()
  requestOptions.deliveryMode = .fastFormat
  requestOptions.isSynchronous = true

  var allPhotos  = [Any]()
  let collection: PHFetchResult = PHAsset.fetchAssets(with: .image, options:fetchOptions)

  if(collection.count > 0){
    for i in 0..<collection.count{
      let asset = collection.object(at: i)
      let size = CGSize(width: 700, height: 700)

      manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { (image, _ ) in
            if let image = image {
              let data = image.jpegData(compressionQuality: 0.9)
              allPhotos.append([
                "data" : data ?? Data(),
                "id" : asset.localIdentifier,
                "created" : Int(asset.creationDate?.timeIntervalSince1970 ?? 0),
                "location" : "\(asset.location ?? CLLocation())"
              ])
            }else{
              print("error asset to image")
            }
          }
        }
    }
    return allPhotos
  }  


  func getGalleryImageCount() -> Int {
  let fetchOptions = PHFetchOptions()
  fetchOptions.includeHiddenAssets = true

  let collection: PHFetchResult = PHAsset.fetchAssets(with: fetchOptions)
  return collection.count
}


  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
    let METHOD_CHANNEL = FlutterMethodChannel(name : "com.subping.SubpingmethodChannel" , binaryMessenger : controller.binaryMessenger)

    METHOD_CHANNEL.setMethodCallHandler{ (call , result ) in 
      switch  (call.method){
        case "getGalleryCount": result(self.getGalleryImageCount())
        case "getGalleryItems" : result(self.getImagesCountFromGallery())
          
        default: result("Wrong Invoked Method")
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
