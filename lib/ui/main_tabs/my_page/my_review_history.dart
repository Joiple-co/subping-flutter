import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/appbar/title_appbar.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/my_page/my_review_item.dart';
import 'package:subping/ui/main_tabs/my_page/review/reviewable_item.dart';
import 'package:subping/viewmodel/local/review_manage/my_review_history_viewmodel.dart';

class MyReviewHistory extends StatelessWidget {
  const MyReviewHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewhistoryViewModel = Get.find<MyReviewHistoryViewModel>();
    reviewhistoryViewModel.getMyReviewHistory();
    reviewhistoryViewModel.getMySubscribeList();

    return Scaffold(
        appBar: const TitleAppBar(
          "리뷰 목록",
          hasBackButton: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      child: SubpingText(
                        "나의 리뷰",
                        color: SubpingColor.black80,
                        size: SubpingFontSize.title6,
                        fontWeight: SubpingFontWeight.bold,
                      ),
                    ),
                    Tab(
                      child: SubpingText(
                        "리뷰 관리",
                        color: SubpingColor.black80,
                        size: SubpingFontSize.title6,
                        fontWeight: SubpingFontWeight.bold,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    ListView.builder(
                        itemCount: reviewhistoryViewModel.reviewList.length,
                        itemBuilder: (context, index) {
                          return ReviewItem(
                            reviewModel:
                                reviewhistoryViewModel.reviewList[index],
                          );
                        }),
                    ListView.builder(
                        itemCount: reviewhistoryViewModel.subscribeList.length,
                        itemBuilder: (context, index) {
                          return ReviewableItem(
                              subscribeModel:
                                  reviewhistoryViewModel.subscribeList[index],
                              makeReview:
                                  reviewhistoryViewModel.makeReviewOnlyRating);
                        }),
                  ],
                ))
              ],
            )));
  }
}
