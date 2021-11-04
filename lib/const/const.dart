enum CardVendor { HANA, SHINHAN, KB, NH, LOTTE, HYNUDAI, BC, SAMSUNG, WOORI }

const CardVendorAsset = {
  CardVendor.BC: "assets/cardLogo/bc.png",
  CardVendor.HANA: "assets/cardLogo/hana.png",
  CardVendor.HYNUDAI: "assets/cardLogo/hyundai.png",
  CardVendor.KB: "assets/cardLogo/kb.png",
  CardVendor.LOTTE: "assets/cardLogo/lotte.png",
  CardVendor.NH: "assets/cardLogo/nh.png",
  CardVendor.SAMSUNG: "assets/cardLogo/samsung.png",
  CardVendor.SHINHAN: "assets/cardLogo/shinhan.png",
  CardVendor.WOORI: "assets/cardLogo/w;oori.png"
};

const int MIN_REVIEW_LENGTH = 20;

const CardVendorMapper = {
  "신한카드": CardVendor.SHINHAN,
  "삼성카드": CardVendor.SAMSUNG,
  "현대카드": CardVendor.HYNUDAI,
  "BC카드": CardVendor.BC,
  "KB국민": CardVendor.KB
};
const List<String> RatingPharses = [
  "",
  "다시는 안사요",
  "많이 아쉬웠어요",
  "괜찮네요!",
  "좋아요! 정말 마음에 들어요!",
  "결혼할꺼에요!"
];

enum Period {
  ONE_MONTH,
  TWO_MONTH,
  THREE_MONTH,
  ONE_WEEK,
  TWO_WEEK,
  THREE_WEEK
}

const PeriodString = {
  Period.ONE_MONTH: "매달",
  Period.TWO_MONTH: "2달 마다",
  Period.THREE_MONTH: "3달 마다",
  Period.ONE_WEEK: "매주",
  Period.TWO_WEEK: "2주 마다",
  Period.THREE_WEEK: "3주 마다"
};

const PeriodInnerString = {
  Period.ONE_MONTH: "1M",
  Period.TWO_MONTH: "2M",
  Period.THREE_MONTH: "3M",
  Period.ONE_WEEK: "1W",
  Period.TWO_WEEK: "2W",
  Period.THREE_WEEK: "3W"
};

const PeriodMapper = {
  "1M": Period.ONE_MONTH,
  "2M": Period.TWO_MONTH,
  "3M": Period.THREE_MONTH,
  "1W": Period.ONE_WEEK,
  "2W": Period.TWO_WEEK,
  "3W": Period.THREE_WEEK
};

const WeekOfDayToString = {
  1: "월요일",
  2: "화요일",
  3: "수요일",
  4: "목요일",
  5: "금요일",
  6: "토요일",
  7: "일요일"
};
