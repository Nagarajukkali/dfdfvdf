import {Selector } from 'testcafe';

const eaNewConnectionPage={
  elements: {
    txtConnectionDetails:Selector(".section>div>h2"),
    btnSelectEle:Selector("[for=edit-fuel-type-ele]"),
    btnSelectGas:Selector("[for=edit-fuel-type-gas]"),
    btnSelectCommercial:Selector("[for=edit-property-type-commercial]"),
    btnSelectResidential:Selector("[for=edit-property-type-residential]"),
    btnSelectSinglePremise:Selector("[for=edit-premise-type-single]"),
    btnSelectUnitDevpremise:Selector("[for=edit-premise-type-unit-development]"),
    txtUnitNo:Selector("#pa-unit-number"),
    txtLotNo:Selector("#pa-lot-number"),
    txtStreetNo:Selector("#pa-street-number"),
    txtStreetName:Selector("#pa-street-name"),
    textStreetSuffix:Selector("#pa-street-suffix"),
    txtSuburb:Selector("#pa-suburb"),
    listActiveState   :Selector("#pa-state-active-option"),
    selectStateFromDropdown:Selector("div.ea-dropdown__wrapper+ul>li"),
    txtPostcode:Selector("#pa-postcode"),
    txtSubDivisionNo:Selector("#pa-sub-division-number"),
    btnNext:Selector("#next"),
    inputInstallingPoleNo:Selector("[for=edit-temporary-builders-pole-option-no]"),
    inputInstallingPoleYes:Selector("[for=edit-temporary-builders-pole-option-yes]"),
    inputInstallingPoleUnknown:Selector("[for=edit-temporary-builders-pole-option-unknown]"),
    inputPeakLoadNo:Selector("[for=edit-off-peak-loads-option-no]"),
    inputPeakLoadYes:Selector("[for=edit-off-peak-loads-option-yes]"),
    offPeakLoadType:Selector("#off-peak-loads-types label"),
    inputPeakLoadUnknown:Selector("[for=edit-off-peak-loads-option-unknown]"),
    txtFirstname:Selector("#applicant-details-first-name"),
    txtLastname:Selector("#applicant-details-last-name"),
    txtMobileNo:Selector("#applicant-details-mobile-number"),
    txtEmail:Selector("#applicant-details-email"),
    txtPlumberFirstname:Selector("#plumber-details-first-name"),
    txtPlumberLastname:Selector("#plumber-details-last-name"),
    txtPlumberMobileNo:Selector("#plumber-details-mobile-number"),
    txtPlumberLandline:Selector("#plumber-details-land-line"),
    txtPlumberEmail:Selector("#plumber-details-email"),
    txtPlumberLicenseNumber:Selector("#plumber-details-licence-number"),
    txtPlumberComplianceNumber:Selector("#plumber-details-compliance-number-0"),
    txtPlumberESVNo:Selector("#plumber-details-esv-number"),
    inputSameAsApplicant:Selector("[for=edit-account-holder-type-same-as-applicants-details]"),
    txtDOB:Selector("#account-holder-dob"),
    applicantIdTypeActive: Selector("#identification-option-active-option"),
    idTypeDl:Selector("#edit-identification-option-drivers-licence"),
    idTypeMedicare:Selector("#edit-identification-option-medicare"),
    idTypePassport:Selector("#edit-identification-option-passport"),
    idType:Selector("#idType sui-select div.sui-dropdown>sui-option"),
    txtIdNo:Selector("#identification-number"),
    applicantIdStateActive:Selector("#identification-state-option-active-option"),
    idStateVIC:Selector("#edit-identification-state-option-vic"),
    idStateACT:Selector("#edit-identification-state-option-act"),
    idStateNSW:Selector("#edit-identification-state-option-nsw"),
    idStateSA:Selector("#edit-identification-state-option-sa"),
    idStateTAS:Selector("#edit-identification-state-option-tas"),
    idStateNT:Selector("#edit-identification-state-option-nt"),
    idStateQLD:Selector("#edit-identification-state-option-qld"),
    idStateWA:Selector("#edit-identification-state-option-wa"),
    idStateInternational:Selector("edit-identification-state-option-international"),
    inputSameAsSiteAddress:Selector("[for=edit-mailing-address-question-same-as-site-address]"),
    acceptTermsAndConds:Selector("[for=terms-and-conditions-field]"),
    submitForm:Selector("#next"),
    btnProceedToQuote:Selector("#success__proceed"),
    connectionType_MeterInstall:Selector("[for=edit-connection-type-meter-installation]"),
    connectionType_ServiceLineInstall:Selector("[for=edit-connection-type-service-line-installation]"),
    inputServicelineInstallYes:Selector("[for=edit-service-line-option-yes]"),
    inputServicelineInstallNo:Selector("[for=edit-service-line-option-no]"),
    inputSiteClearYes:Selector("[for=edit-site-clean-clear-option-yes]"),
    inputSiteClearNo:Selector("[for=edit-site-clean-clear-option-no]"),
    inputSiteMarkedYes:Selector("[for=edit-site-marked-option-yes"),
    inputSiteMarkedNo:Selector("[for=edit-site-marked-option-no"),
    btnProceedToStep4:Selector("#next-step-3"),
    inputBelowAMPS:Selector("[for=edit-amps-range-option-below-140-amps]"),
    inputAboveAMPS:Selector("[for=edit-amps-range-option-over-140-amps]"),
    plumberTitleActive:Selector("#plumber-details-title-active-option"),
    plumberTitle:Selector("#edit-plumber-details-title-mr"),
    applicantTitleActive:Selector("#applicant-details-title-active-option"),
    applicantTitle:Selector("#edit-applicant-details-title-mr"),
    connectionDetailSection:Selector("#connection-details"),
    hotWaterField:Selector("#appliance-qty-instHotWater"),
    errorModalHeader:Selector("#modal-heading-blockerModal"),
    txtErrorModal:Selector("#blockerModal .ea-modal__body"),
    goToButtonOnErrorModal:Selector("#ea-modal-primary-action-blockerModal"),
    feedbackForm:Selector("form.decline-inner"),
    plansTable:Selector("div.hs-plan-table-container__plans-wrapper"),
  },
};

module.exports=eaNewConnectionPage;
