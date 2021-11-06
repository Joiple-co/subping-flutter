enum CardVendor { hana, shinhan, kb, nh, lotte, hyundai, bc, samsung, woori }

const cardVendorAsset = {
  CardVendor.bc: "assets/cardLogo/bc.png",
  CardVendor.hana: "assets/cardLogo/hana.png",
  CardVendor.hyundai: "assets/cardLogo/hyundai.png",
  CardVendor.kb: "assets/cardLogo/kb.png",
  CardVendor.lotte: "assets/cardLogo/lotte.png",
  CardVendor.nh: "assets/cardLogo/nh.png",
  CardVendor.samsung: "assets/cardLogo/samsung.png",
  CardVendor.shinhan: "assets/cardLogo/shinhan.png",
  CardVendor.woori: "assets/cardLogo/woori.png"
};

const int minReviewLength = 20;

const cardVendorMapper = {
  "신한카드": CardVendor.shinhan,
  "삼성카드": CardVendor.samsung,
  "현대카드": CardVendor.hyundai
};
const List<String> ratingPharses = [
  "",
  "다시는 안사요",
  "많이 아쉬웠어요",
  "괜찮네요!",
  "좋아요! 정말 마음에 들어요!",
  "결혼할꺼에요!"
];

enum Period { oneMonth, twoMonth, threeMonth, oneWeek, twoWeek, threeWeek }

const periodString = {
  Period.oneMonth: "매달",
  Period.twoMonth: "2달 마다",
  Period.threeMonth: "3달 마다",
  Period.oneWeek: "매주",
  Period.twoWeek: "2주 마다",
  Period.threeWeek: "3주 마다"
};

const periodInnerString = {
  Period.oneMonth: "1M",
  Period.twoMonth: "2M",
  Period.threeMonth: "3M",
  Period.oneWeek: "1W",
  Period.twoWeek: "2W",
  Period.threeWeek: "3W"
};

const periodMapper = {
  "1M": Period.oneMonth,
  "2M": Period.twoMonth,
  "3M": Period.threeMonth,
  "1W": Period.oneWeek,
  "2W": Period.twoWeek,
  "3W": Period.threeWeek
};

const weekOfDayToString = {
  1: "월요일",
  2: "화요일",
  3: "수요일",
  4: "목요일",
  5: "금요일",
  6: "토요일",
  7: "일요일"
};
