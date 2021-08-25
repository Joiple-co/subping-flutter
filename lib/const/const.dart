const ONBOARDING_EMAIL = "EMAIL";
const ONBOARDING_PASSWORD = "PASSWORD";

const IDENTITIY_POOL_ID = "ap-northeast-2:399e170b-7fa8-47d7-b5b8-1b4d1a8dd55e";
const USER_POOL_ID = "ap-northeast-2_VzCrSsELb";
const CLIENT_ID = "4p168n12vp9vraftlg9d29hlf2";

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
