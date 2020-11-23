const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaHomePage={
  pageUrl: config.eaHomePageUrl,
  newConnectionPageUrl: config.eaNewConnectionPageUrl,
  campaignPageUrl: config.eaCampaignUrl,
  billUploaderUrl: config.eaBillUploaderUrl,
  savedQuoteURL: config.savedQuoteURL,
  elements: {
    selectedState: Selector("#navbar div[class*='state-value']"),
    residentialComparePlansButton: Selector('.icon-GasElectricity'),
    plansCardFee:Selector("div.hs-plan-fees__card"),
    businessLink:Selector("[class*='menu-item--collapsed'] a[href^='/business']"),
    menuBarCollapsed:Selector("button.navbar-toggle.collapsed"),
    businessMobileIcon:Selector("li.dropdown>a.icon-business.mobile-icon"),
    myAccountMobileIcon:Selector("a[href*='/myaccount/index.html']").nth(1),
    businessplansMenu:Selector("li.dropdown>a[href*='/business/electricity-and-gas/menu']"),
    smallBusinessLink:Selector("li.dropdown>a[href*='/business/electricity-and-gas/small-business']"),
    btnBusAccessQuoteTool:Selector("article[role='article'] a[href*='/business/electricity-and-gas/small-business/plans'][class*='ea-button']"),
    smallBusinessButton:Selector("a[class*='ea-button--primary'][href*='/small']"),
    ModalWindow: Selector('.tablet-desktop-only #hs-refine-modal-cta'),
    ModalWindowMobileOnly: Selector('.refine-toggle-bar__row.mobile-only #hs-refine-modal-cta'),
    creditCardDisclaimer: Selector('.hs-plan-card-fees'),
    modalVerifyAccountOption: Selector('#hs-verify-account-cta button'),
    modalBillUploadOption: Selector('#hs-bill-upload-cta a'),
    elecAccountNo:Selector('#electricity-account-number'),
    gasAccountNo:Selector('#gas-account-number'),
    postcodeVerifyAccount:Selector('#account-postcode'),
    businessInformation:Selector('#account-abnAcn'),
    nextAccountNumber:Selector('#refineModal .ea-modal__primary-action'),
    eaSpinner:Selector(".ea-spinner.ng-star-inserted"),
    backAccountNumber:Selector('#refineModal .ea-modal__secondary-action'),
    idTypeDropDownVerifyAccount: Selector('#identification-selector-active-option'),
    idTypeDOBVerifyAccount: Selector('#edit-identification-selector-dob'),
    idTypeDOBValueVerifyAccount: Selector('#identification-value-dob'),
    idTypeDlVerifyAccount: Selector('#edit-identification-selector-dl'),
    idTypeValueVerifyAccount: Selector('#identification-value'),
    idTypePinVerifyAccount: Selector('#edit-identification-selector-pin'),
    idTypeMedicareVerifyAccount: Selector('#edit-identification-selector-medicare'),
    idTypePassportVerifyAccount: Selector('#edit-identification-selector-passport'),
    usageData_ele: Selector('#hs-electricity-usage-description:first-of-type+div'),
    usageData_gas: Selector('#hs-gas-usage-description:first-of-type+div'),
    getCostEstimatesChangeButton: Selector('#modal-heading-wrapper-refineModal~div.ea-modal__footer>.ea-modal__primary-action'),
    familyViolenceMessage: Selector('.ea-message.error:last-of-type'),
    changeLinkVerifyAccount: Selector('.tablet-desktop-only .hs-refine-modal-cta__text>span'),
    basicPlan: Selector("[id*='plan-select-button-RSOT']"),
    basicPlanQLD: Selector("[id*='plan-select-button-GRT']"),
    noFrillsPlan: Selector("[id*='plan-select-button-RCPP']"),
    totalPlan: Selector("[id*='plan-select-button-TOPH']"),
    totalPlanEleDiscount:Selector("#plan-rate-summary-TOPH-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanGasDiscount:Selector("#plan-rate-summary-TOPH-1 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlus: Selector("[id*='plan-select-button-SWSR1']"),
    totalPlanPlusEleDiscount:Selector("#plan-rate-summary-SWSRH-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusGasDiscount:Selector("#plan-rate-summary-SWSRH-1 span.hs-plan-rate-summary__title-amount"),
    basicBusiness:Selector("[id*='plan-select-button-BSOT']"),
    basicBusinessQLD:Selector("[id*='plan-select-button-BGRT']"),
    noFrillBusiness:Selector("[id*='plan-select-button-BCPP']"),
    totalPlanBusiness:Selector("[id*='plan-select-button-TOPB']"),
    totalPlanBusinessEleDiscount:Selector("#plan-rate-summary-TOPB-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanBusinessGasDiscount:Selector("#plan-rate-summary-TOPB-1 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusBusiness:Selector("[id*='plan-select-button-SWSRB']"),
    totalPlanPlusBusinessEleDiscount:Selector("#plan-rate-summary-SWSRB-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusBusinessGasDiscount:Selector("#plan-rate-summary-SWSRB-1 span.hs-plan-rate-summary__title-amount"),
    fuelSelectorOption:Selector('#fuel-selector-active-option'),
    fuelSelectorOptionDual:Selector('#edit-fuel-selector-both'),
    fuelSelectorOptionEle:Selector('#edit-fuel-selector-ele'),
    fuelSelectorOptionGas:Selector('#edit-fuel-selector-gas'),
    linkMoveHouse:Selector(".icon-moving"),
    postcodeOnCampaignPage:Selector("#campaign-postcode-input"),
    txtOfferCode:Selector("#campaign-unique-code-input"),
    btnCampaignSearch:Selector("[id^='campaign-search-submit']"),
    selectCampaignPlans:Selector("#action__submit"),
    planEstimateValue:Selector('[id*=plan-estimate-TOP] div.hs-plan-estimate__value'),
    eleTotalPlanRateSummary:Selector("[id*='plan-rate-summary-title-TOPH-E']"),
    gasTotalPlanRateSummary:Selector("[id*='plan-rate-summary-title-TOPH-G']"),
    totalPlanRateSummary:Selector("[id*='plan-rate-summary-title-TOPH']"),
    eleTotalPlanDiscount:Selector("[id*=plan-rate-summary-TOPH-E] span.hs-plan-rate-summary__title-amount"),
    gasTotalPlanDiscount:Selector("[id*=plan-rate-summary-TOPH-G] span.hs-plan-rate-summary__title-amount"),
    planCostEstimate: Selector("[class*='hs-plan-estimate__value']"),
    eleDiscount: Selector("[id*='plan-rate-summary'][id*='-E'] [class*='title-amount']"),
    gasDiscount: Selector("[id*='plan-rate-summary'][id*='-G'] [class*='title-amount']"),
    safetyFlagMsgOnVAModal:Selector("#refineModal eui-message span"),
    btnBackOnVerifyAccountModal:Selector("div.ea-modal__footer button.ea-modal__secondary-action"),
    inputNMI:Selector("#refine-nmi-input"),
    inputMIRN:Selector("#refine-mirn-input"),
    inputPostcode:Selector("#refine-postcode-input"),
    txtStateNotServicedMsg:Selector("#plan-error-STATE_NOT_SERVICED"),
    txtPostcodeNotServicedMsg:Selector("#plan-error-POSTCODE_NOT_SERVICED"),
    txtBlockedNMIMsg:Selector("#plan-error-NMI_BLOCKED"),
    txtNMINotFoundMsg:Selector("#plan-error-NMI_NOT_FOUND"),
    txtMIRNNotFoundMsg:Selector("#plan-error-MIRN_NOT_FOUND"),
    txtInvalidCustomerTypeMsg:Selector("#plan-error-INVALID_CUSTOMER_TYPE"),
    txtCampaignNotServicedMsg:Selector("#plan-error-CAMPAIGN_NOT_SERVICED"),
    txtAddressNotServicedMsg:Selector("#plan-error-ADDRESS_NOT_SERVICED"),
    txtSystemErrorMsg:Selector("#plan-error-SYSTEM_ERROR"),
    txtLoyaltyPlanMsg: Selector('.hs-loyalty-message__disclaimer'),
    changeCustomerModal:Selector("#hs-change-customer-modal-message"),
    txtElectricityBasedOn:Selector("div.hs-plan-rates-heading__description p").nth(0),
    txtGasBasedOn:Selector("div.hs-plan-rates-heading__description p").nth(1),
    headingOnChangePlanSelectionModal:Selector("#modal-heading-CHANGE_PLAN_SELECTION_MODAL"),
    //basicResiPlanHeadingFuel:Selector("[id*='plan-heading-fuel-BASE_RSOT-']").nth(1),
    basicResiPlanHeadingFuel:Selector("[id*='plan-heading-fuel-BASE_RSOT-']"),
    //basicBsmePlanHeadingFuel:Selector("[id*='plan-heading-fuel-BASE_BSOT-']").nth(1),
    basicBsmePlanHeadingFuel:Selector("[id*='plan-heading-fuel-BASE_BSOT-']"),
    sliderRight:Selector("div.hs-plan-slider__button__bg-right"),
    basicResiPlanRatesTitle:Selector("#plan-rates-title-RSOT"),
    basicResiPlanFeatureTitle:Selector("#plan-feature-title-RSOT"),
    basicBsmePlanFeatureTitle:Selector("#plan-feature-title-BSOT"),
    basicBsmePlanRatesTitle:Selector("#plan-rates-title-BSOT"),
    basicHomeReferencePrice:Selector("[id*='plan-price-reference-RSOT'] span"),
    basicHomeReferencePrice_QLD:Selector("[id*='plan-price-reference-GRT'] span"),
    basicBusinessReferencePrice:Selector("[id*='plan-price-reference-BSOT'] span"),
    basicBusinessReferencePrice_QLD:Selector("[id*='plan-price-reference-BGRT'] span"),
    noFrillsComparisonStatement:Selector("[id*='plan-price-reference-RCPP'] span"),
    totalPlanComparisonStatement:Selector("[id*='plan-price-reference-TOPH'] span"),
    totalPlanPlusComparisonStatement:Selector("[id*='plan-price-reference-SWSR1'] span"),
    totalPlanBusinessComparisonStatement:Selector("[id*='plan-price-reference-TOPB'] span"),
    totalPlanPlusBusinessComparisonStatement:Selector("[id*='plan-price-reference-SWSRB'] span"),
    refinePeriod:Selector("#refine-period"),
    refinePeriodDropdown:Selector("#refine-period li"),
    refineEleUsage:Selector("#refine-ele-usage"),
    refineEleUsageDropdown:Selector("#refine-ele-usage li"),
    refineEleUsageActiveOption:Selector("#estimate-usage-ele-custom"),
    basicHomePlanEstimate:Selector("[id*='plan-estimate-BASE_RSOT-E'][class='hs-plan-estimate__value']"),
    basicHomePlanEstimate_QLD:Selector("[id*='plan-estimate-BASE_GRT-E'][class='hs-plan-estimate__value']"),
    noFrillsPlanEstimate:Selector("[id*='plan-estimate-BASE_RCPP-E'][class='hs-plan-estimate__value']"),
    totalPlanEstimate:Selector("[id*='plan-estimate-BASE_TOPH-E'][class='hs-plan-estimate__value']"),
    totalPlanPlusEstimate:Selector("[id*='plan-estimate-BASE_SWSR1-E'][class='hs-plan-estimate__value']"),
    basicBusinessPlanEstimate:Selector("[id*='plan-estimate-BASE_BSOT-E'][class='hs-plan-estimate__value']"),
    totalPlanBusinessEstimate:Selector("[id*='plan-estimate-BASE_TOPB-E'][class='hs-plan-estimate__value']"),
    totalPlanPlusBusinessEstimate:Selector("[id*='plan-estimate-BASE_SWSRB-E'][class='hs-plan-estimate__value']"),
    basicBusinessPlanEstimate_QLD:Selector("[id*='plan-estimate-BASE_BGRT-E'][class='hs-plan-estimate__value']"),
    disclaimer: {
      generalStateDisclaimerOld: Selector("#general-state-disclaimer"),
      generalStateDisclaimerP1: Selector("#general-state-disclaimer p").nth(0),
      generalStateDisclaimerP2: Selector("#general-state-disclaimer p").nth(1),
      generalStateDisclaimerP3: Selector("#general-state-disclaimer p").nth(2)
    },
    modalEnterUsageOption: Selector("div#hs-enter-usage-cta button"),
    modalNext: Selector("#refineModal .ea-modal__primary-action"),
    modalBack: Selector("#refineModal .ea-modal__secondary-action"),
    txtOfferCodeSeniorsCard: Selector("#campaign-theme-code-input")
  },
  campaignElements:{
    elePlanHeadingTitle:Selector("[id*='plan-heading-title'][id*='-E']"),
    gasPlanHeadingTitle:Selector("[id*='plan-heading-title'][id*='-G']"),
    elePlanHeadingFuel:Selector("[id*='plan-heading-fuel'][id*='-E']"),
    gasPlanHeadingFuel:Selector("[id*='plan-heading-fuel'][id*='-G']"),
    elePlanHeadingDescription:Selector("[id*='plan-heading-description'][id*='-E']"),
    gasPlanHeadingDescription:Selector("[id*='plan-heading-description'][id*='-G']"),
    eleCarbonNeutralTotalPlanFeatureTitle:Selector("[id*='plan-feature-TOPH-E'] div.hs-plan-feature__item-title").withText("Carbon"),
    isQLD: Selector("#condiDisclaimer").withText("QLD"),
    eleFeatureSectionTitle: Selector("[id*='plan-feature-title'][id*='-E']"),
    gasFeatureSectionTitle: Selector("[id*='plan-feature-title'][id*='-G']"),

    eleFeature50CreditTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Credit"),
    eleFeature50CreditDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Credit").sibling(),
    eleFeatureCNTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
    eleFeatureCNDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
    eleFeaturePeaceOfMindTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Peace of mind"),
    eleFeaturePeaceOfMindDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Peace of mind").sibling(),
    eleFeatureDiscountOffTotalBillTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText(/[D|d]iscount off/),
    eleFeatureDiscountOffTotalBillDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText(/[D|d]iscount off/).sibling(),
    eleFeatureNoStandardConnectionFeeTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("No standard"),
    eleFeatureNoStandardConnectionFeeDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("No standard").sibling(),
    eleFeatureDefaultOfferTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Default offer"),
    eleFeatureDefaultOfferDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("Default offer").sibling(),
    eleFeatureVipPriorityServiceTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("VIP Priority Service"),
    eleFeatureVipPriorityServiceDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("VIP Priority Service").sibling(),
    eleFeatureChanceToWinTitle: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("$2,000"),
    eleFeatureChanceToWinDescription: Selector("[id*='plan-feature'][id*='-E'] [class*='hs-plan-feature__item-title']").withText("$2,000").sibling(),
    gasFeature50CreditTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Credit"),
    gasFeature50CreditDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Credit").sibling(),
    gasFeatureCNTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
    gasFeatureCNDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
    gasFeaturePeaceOfMindTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Peace of mind"),
    gasFeaturePeaceOfMindDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("Peace of mind").sibling(),
    gasFeatureDiscountOffTotalBillTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText(/[D|d]iscount off/),
    gasFeatureDiscountOffTotalBillDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText(/[D|d]iscount off/).sibling(),
    gasFeatureVipPriorityServiceTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("VIP Priority Service"),
    gasFeatureVipPriorityServiceDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("VIP Priority Service").sibling(),
    gasFeatureChanceToWinTitle: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("$2,000"),
    gasFeatureChanceToWinDescription: Selector("[id*='plan-feature'][id*='-G'] [class*='hs-plan-feature__item-title']").withText("$2,000").sibling(),
  }
};

module.exports=eaHomePage;
