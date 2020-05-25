import {Selector } from 'testcafe';

const billUpload={
  elements: {
    btnUploadBill:Selector("#bill-upload-button"),
    billUploadInput:Selector(".upload-input"),
    eaSpinner:Selector(".ea-spinner.ng-star-inserted"),
    txtRecommendationDetails:Selector("[id^='recom-plan-heading']"),
    btnRecommendedPlanSelect:Selector("#recom-plan-select-plan-btn"),
  },
};

module.exports=billUpload;



