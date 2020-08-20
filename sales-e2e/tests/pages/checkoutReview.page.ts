import {Selector } from 'testcafe';

const eaCheckoutReviewPage={
    elements: {
      lifeSupportHeader: Selector('div[class*=life-support] h4'),
      lifeSupportDisclaimer: Selector('[class*=life-support-disclaimer]'),
      lifeSupportQuestionSection: Selector('[class*=life-support__question-section]'),
      lifeSupportQuestion: Selector('[class$=life-support__question]'),
      lifeSupportQuestionYes: Selector('[for*=edit-life-support-required-yes]'),
      lifeSupportQuestionNo: Selector('[for*=edit-life-support-required-no]'),
      lifeSupportElec: Selector('#ele-life-support'),
      lifeSupportGas: Selector('#gas-life-support'),
      lifeSupportWhyWeCollect: Selector('#life-support-why-we-collect'),
      btnRegisterDeviceElec: Selector("[id*='ele-life-support-register'] button"),
      btnRegisterDeviceGas: Selector("[id*='gas-life-support-register'] button"),
      reviewYourOfferTxt:Selector('#checkout-progress-bar-subheading h3'),
      agreeAndConfirm: Selector('#reviewAgreeConfirmButton > span'),
      cbEleDevice_LSCNSPE: Selector("[for*='ELE-LSCNSPE']"),
      cbEleDevice_LSCPAPR: Selector("[for*='ELE-LSCPAPR']"),
      cbEleDevice_LSIPDM: Selector("[for*='ELE-LSIPDM']"),
      cbEleDevice_LSKDM: Selector("[for*='ELE-LSKDM']"),
      cbEleDevice_LSOC: Selector("[for*='ELE-LSOC']"),
      cbEleDevice_LSVFLS: Selector("[for*='ELE-LSVFLS']"),
      cbEleDevice_OTHER: Selector("[for*='ELE-OTHER']"),
      cbGasDevice_GLSMRHAC: Selector("[for*='GAS-GLSMRHAC']"),
      cbGasDevice_GLSMRHW: Selector("[for*='GAS-GLSMRHW']"),
      cbGasDevice_OTHER: Selector("[for*='GAS-OTHER']"),
      tfOtherEquipmentDetailsElec: Selector('#ele-otherEquipmentDetails'),
      tfOtherEquipmentDetailsGas: Selector('#gas-otherEquipmentDetails'),
      lblGenericError: Selector('div.generic-error'),
      lblElecOtherFieldError: Selector("[id='ele-life-support'] div.ea-field-errors"),
      lblGasOtherFieldError: Selector("[id='gas-life-support'] div.ea-field-errors"),
      btnCancelElec: Selector("div#ele-life-support-cancel button[aria-label*='cancel']"),
      btnCancelGas: Selector("div#gas-life-support-cancel button[aria-label*='cancel']"),
      existingEleLifeSupportSection:Selector("#record-ele-life-support"),
      existingGasLifeSupportSection:Selector("#record-gas-life-support"),
      eleTextOnLifeSupportSection:Selector("#record-ele-life-support-fuel-text"),
      gasTextOnLifeSupportSection:Selector("#record-gas-life-support-fuel-text"),
      eleLifesupportStatus:Selector("#record-ele-life-support-status-text"),
      gasLifesupportStatus:Selector("#record-gas-life-support-status-text"),
      imgReviewSectionEle:Selector("#reviewSectionEle button[id*='eui-accordion-header']>img"),
      imgReviewSectionGas:Selector("#reviewSectionGas button[id*='eui-accordion-header']>img"),
      txtPlanTitle: Selector("div.review-plan__plan-title--name"),
      txtEleDiscount:Selector("#reviewSectionEle div.review-plan__plan-rates div[id*='charge-before-discount']+div"),
      txtGasDiscount:Selector("#reviewSectionGas div.review-plan__plan-rates div[id*='charge-before-discount']+div"),
      txtElePlanName:Selector('#reviewSectionEle div.review-plan__plan-title--name'),
      txtGasPlanName:Selector('#reviewSectionGas div.review-plan__plan-title--name'),
      elePlanName: Selector("#reviewSectionEle div.review-plan__plan-title--name"),
      gasPlanName: Selector("#reviewSectionGas div.review-plan__plan-title--name"),
      eleDiscount: Selector("#reviewSectionEle div.review-plan__plan-rates div[id*='charge-before-discount']+div']"),
      gasDiscount: Selector("#reviewSectionGas div.review-plan__plan-rates div[id*='charge-before-discount']+div"),
      eleFeatures: Selector("#reviewSectionEle [id*='benefit-text']"),
      eleFeature50Credit: Selector("#reviewSectionEle [id*='benefit-text']").withText("$50"),
      eleFeatureCN: Selector("#reviewSectionEle [id*='benefit-text']").withText("Carbon neutral"),
      eleFeatureDiscountOffTotal: Selector("#reviewSectionEle [id*='benefit-text']").withText("off total energy"),
      eleFeaturePeaceOfMind: Selector("#reviewSectionEle [id*='benefit-text']").withText("Peace of mind"),
      eleFeatureNoStandardConnectionFee: Selector("#reviewSectionEle [id*='benefit-text']").withText("No standard connection fees"),
      gasFeatures: Selector("#reviewSectionGas [id*='benefit-text']"),
      gasFeature50Credit: Selector("#reviewSectionGas [id*='benefit-text']").withText("$50"),
      gasFeatureCN: Selector("#reviewSectionGas [id*='benefit-text']").withText("Carbon neutral"),
      gasFeatureDiscountOffTotal: Selector("#reviewSectionGas [id*='benefit-text']").withText("off total energy"),
      gasFeaturePeaceOfMind: Selector("#reviewSectionGas [id*='benefit-text']").withText("Peace of mind"),
      identificationPopup:Selector("[id*='rtca-confirm']"),
      identificationConfirmButton:Selector("[id*='reviewSubmitConfirm']"),
      idFirstName:Selector("#id_firstName"),
      idLastName:Selector("#id_lastName"),
      idDOBDay:Selector("#id_dateOfBirth-day"),
      idDOBMonth:Selector("#id_dateOfBirth-month"),
      idDOBYear:Selector("#id_dateOfBirth-year"),
      idnumberLicence:Selector("#id_number-licence"),
      connectionDetails: {
        main: Selector("#connectionInfo"),
        heading: Selector("#connectionInfo h4"),
        connectionAddress: {
          main: Selector("#connection-address"),
          heading: Selector("#connection-address h5"),
          data: Selector("#connection-address div")
        },
        connectionDate: {
          main: Selector("#connection-date"),
          heading: Selector("#connection-date h5"),
          data: Selector("#connection-date div")
        },
        distributor: {
          main: Selector("#electricity-distributor"),
          heading: Selector("#electricity-distributor h5"),
          data: Selector("#electricity-distributor div")
        },
        customerType: {
          main: Selector("#customer-type"),
          heading: Selector("#customer-type h5"),
          data: Selector("#customer-type div")
        }
      },
      accountHolders: {
        main: Selector("#primarySecondaryAH"),
        heading: Selector("#primarySecondaryAH h4"),
        primaryAccountHolder: {
          main: Selector("#primarySecondaryAH section"),
          heading: Selector("#primarySecondaryAH section h5"),
          data: Selector("#primarySecondaryAH section div")
        },
        additionalAccountHolder: {
          main: Selector("#secondaryAH"),
          heading: Selector("#secondaryAH h5"),
          data: Selector("#secondaryAH div")
        }
      },
      billingAndPaymentPref: {
        main: Selector("#billingPref"),
        heading: Selector("#billingPref h4"),
        billPaymentMethod_QT: {
          main: Selector("#billingPref div[id*='billingPrefDebitType']"),
          heading: Selector("#billingPref div[id*='billingPrefDebitType'] h4"),
          data: Selector("#billingPref div[id*='billingPrefDebitType'] div")
        },
        billPaymentMethod_MA: {
          main: Selector("#billingPaymentMethodFromMyAccount"),
          heading: Selector("#billingPaymentMethodFromMyAccount h4"),
          data: Selector("#billingPaymentMethodFromMyAccount div")
        },
        billsDeliveredTo: {
          main: Selector("#billDeliveryDetail"),
          heading: Selector("#billDeliveryDetail h4"),
          data: Selector("#billDeliveryDetail div")
        }
      },
      feesAndCharges: {
        main: Selector("div.fees-charges"),
        heading: Selector("div.fees-charges h4"),
        feeItems: Selector("div.fees-charges div.review-section"),
        disclaimer: Selector("#merchant-fees .fees-charges__disclaimer")
      },
      carbonNeutral: {
        main: Selector("div.carbon-neutral"),
        heading: Selector("div.carbon-neutral h4")
      },
      btnBack: Selector("#reviewAgreeConfirmButton-back"),
      btnAgreeAndConfirm: Selector("#reviewAgreeConfirmButton"),
      idTypeActiveOption:Selector("#id-type-active-option"),
      listIdType:Selector("#id-type-active-option").parent().nextSibling().child(),
      idTypeDriverLicence:Selector("#edit-id-type-dl"),
      idTypePassport:Selector("#edit-id-type-passport"),
      idTypeMedicare:Selector("#edit-id-type-medicare"),
      idValue:Selector("#identification-value"),
      titleActiveOption:Selector("#title-active-option"),
      listTitle:Selector("#title-active-option").parent().nextSibling().child(),
      inputFirstName:Selector("#first-name"),
      inputLastName:Selector("#last-name"),
      abn:Selector("#edit-business-identifier-type-abn__label"),
      acn:Selector("#edit-business-identifier-type-acn__label"),
      abnAcnValue:Selector("#business-identifier"),
      inputBusinessName:Selector("#business-name"),
      businessTypeActiveOption:Selector("#business-type-active-option"),
      listBusinessType:Selector("#business-type-active-option").parent().nextSibling().child(),
      anzsicCode:Selector("#anzsic-code-active-option"),
      listAnzsicCode:Selector("#anzsic-code-active-option").parent().nextSibling().child(),
    }
}

module.exports=eaCheckoutReviewPage;
