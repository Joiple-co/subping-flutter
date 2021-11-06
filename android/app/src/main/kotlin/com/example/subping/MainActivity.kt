package com.example.subping

import android.content.ContentResolver
import android.graphics.Bitmap
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
import android.util.Size
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.ByteArrayOutputStream
import java.util.*
import java.util.jar.Manifest
import kotlin.collections.ArrayList

class MainActivity: FlutterActivity() {

    companion object{
        const val METHOD_CHANNEL : String = "com.subping.SubpingmethodChannel"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.getDartExecutor()?.binaryMessenger , METHOD_CHANNEL).setMethodCallHandler{
            methodCall: MethodCall, result: MethodChannel.Result ->
            when(methodCall.method){
                "getGalleryItems" -> result.success(getGalleryItems())
                "getGalleryCount" -> result.success(getGalleryCount())
                else -> result.success(null);
            }
        }
    }

    private fun getGalleryCount() : Int {
        val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        val cursor = contentResolver.query(uri, null, null , null , null )
        return cursor?.count ?: 0
    }

    private fun imageToByte(contentUri : Uri , id : Long) : ByteArray {
        val stream = ByteArrayOutputStream()
        if (Build.VERSION.SDK_INT >= 29) {
            val thumbnail: Bitmap = applicationContext.contentResolver.loadThumbnail(
                    contentUri, Size(1280, 720), null)
            thumbnail.compress(Bitmap.CompressFormat.JPEG, 90, stream)
            val data = stream.toByteArray()
            return data
        }else{
            val bmp = MediaStore.Images.Thumbnails.getThumbnail(contentResolver, id.toLong(), MediaStore.Images.Thumbnails.MINI_KIND, null)
            val stream = ByteArrayOutputStream()
            bmp.compress(Bitmap.CompressFormat.JPEG, 90, stream)
            val data = stream.toByteArray()
            return data
        }
    }

    private fun getGalleryItems(): ArrayList<Any> {
        val imagesList = ArrayList<Any>()
        val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        val orderBy = MediaStore.Images.Media.DATE_TAKEN
        val cursor = contentResolver.query(uri, null, null , null , "$orderBy DESC")
        cursor?.moveToFirst()
        cursor?.use {
            val idColumn = cursor.getColumnIndexOrThrow(MediaStore.Images.Media._ID)
            var count = 0;
            while (count < 200){
                val id = cursor.getLong(idColumn)
                val contentUri = Uri.withAppendedPath(
                        MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                        id.toString())


                imagesList.add(mapOf<String,Any>(
                        "data" to imageToByte(contentUri,id),
                        "id" to id.toString(),
                ))
                if(!cursor.moveToNext()){
                    break;
                }
                count++
            }
        }
        return imagesList
    }
}   



