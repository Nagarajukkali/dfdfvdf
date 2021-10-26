import {Then, When} from 'cucumber';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction} from '../../global_methods/helper';
import {CustomerType} from '@ea/ea-commons-models';
import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {plansMethod} from '../methods/plansPage';
import {qualifierMethod} from "../methods/qualifierPage";
const { config }=require('../../resources/resource');
const validateAnalyticsEvent=config.validateAnalytics;
const eaCheckoutDetailsPage = require('../pages/checkOutDetails.page');

When(/^user provides all details for existing customer on checkout details page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t, data[0].customerType, data[0].firstName, data[0].lastName, data[0].customerStatus);
  let emailAddress = await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.getEmailWithScenario(t, emailAddress);
  await checkoutDetailsMethod.checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsMethod.accessRestriction(t, data[0].electricityAccess, data[0].gasAccess);
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});

When(/^user captures the browser url and provides the url for "([^"]*)"$/, async function (t,[review]) {
  const browserUrl = await testFunction.getPageURLCheckout();
  let sentences = browserUrl.split(/[?]/);
  console.log(sentences);
  console.log(sentences[0]);
  console.log(sentences[1]);
  let browserUrl1=sentences[0]+review+sentences[1];
  await t.navigateTo(browserUrl1);
});

When(/^user provides all details on checkout details page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let customerType = data[0].customerType;
  await testFunction.waitForLoadingIconToClose();
  await testFunction.waitForElementToBeDisappeared(t, eaCheckoutDetailsPage.elements.eaSpinner);
  await testFunction.takeScreenshot(t, 'checkout_details_page');//disabled UI Validation
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t, data[0].journey, data[0].firstName, data[0].lastName, data[0].customerStatus);
  let emailAddress = await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.getEmailWithScenario(t, emailAddress);
  if (customerType === CustomerType.RESIDENTIAL) {
    if (data[0].idType === "Medicare") {
      await checkoutDetailsMethod.checkoutIdentification(t, data[0].customerStatus, data[0].idType, data[0].medicareType);
    } else {
      await checkoutDetailsMethod.checkoutIdentification(t, data[0].customerStatus, data[0].idType, "");
    }
  }
  if (customerType === CustomerType.BUSINESS) {
    await checkoutDetailsMethod.provideBusinessDetails(t, data[0].businessType);
  }
});

When(/^user clicks on 'Review your order' button and navigates to review page$/, async function (t) {
  await testFunction.takeScreenshot(t, 'checkout_details_page_with_data');
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});
When(/^user clicks on 'Next' button and navigates to review page$/, async function (t) {
  await testFunction.takeScreenshot(t, 'checkout_details_page_with_data');
  await checkoutDetailsMethod.clickOnNextBtn(t);
});

When(/^user selects answer for property renovation question for '(.*)'$/, async function (t, [state]) {
  await checkoutDetailsMethod.propertyRenovationNo(t, state);
});
When(/^user chooses "([^"]*)" for disconnection$/, async function (t, [disconnectionOption]) {
  await checkoutDetailsMethod.disconnectionDetails(t, disconnectionOption);
});

When(/^user opts for AAH and DD$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let optAAHOption = data[0].optAAHOption;
  let optDDOption = data[0].optDDOption;
  if (optAAHOption === 'Yes') {
    await checkoutDetailsMethod.addAAHDetails(t);
  }
  if (optDDOption === 'Yes') {
    await checkoutDetailsMethod.addDirectDebit(t, data[0].directDebitType);
  }
});
When(/^user selects plans on checkout details page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.waitForElementToBeDisappeared(t, eaCheckoutDetailsPage.elements.eaSpinner);
  //await testFunction.click(t,eaCheckoutDetailsPage.elements.connectionAddress);
  await t.wait(2000);
  await checkoutDetailsMethod.selectPlan(t, data[0].fuelType, data[0].planName);
  console.log("Plan Selected successfully.");
});
When(/^user validates the nsw remote meter risk on checkout$/, async function (t, []) {
  await testFunction.waitForElementToBeDisappeared(t, eaCheckoutDetailsPage.elements.eaSpinner);
  //await testFunction.click(t,eaCheckoutDetailsPage.elements.connectionAddress);
  await t.wait(2000);
  await qualifierMethod.validateErrorMessageForNSWRemoteMeterRiskAccountsCheckouit(t);
});
When(/^user provides dob and id details$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await checkoutDetailsMethod.enterDOB(t);
  if (data[0].idType === "Medicare") {
    await checkoutDetailsMethod.checkoutIdentification(t, data[0].customerStatus, data[0].idType, data[0].medicareType);
  } else {
    await checkoutDetailsMethod.checkoutIdentification(t, data[0].customerStatus, data[0].idType, "");
  }
});
When(/^user provides business details$/, async function (t, [], dataTable) {
  await checkoutDetailsMethod.provideBusinessDetails(t, 'ABN');
});
When(/^user selects carbon neutral option$/, async function (t) {
  await checkoutDetailsMethod.selectCarbonNeutralOption(t);
});
When(/^user selects "([^"]*)" billing preference option$/, async function (t, [option]) {
  await checkoutDetailsMethod.selectBillingPreference(t, option, "");
});
When(/^user selects final bill option$/, async function (t, [], dataTable) {
  /*
  Example:
  And user selects final bill option
    |option         |otherAddress                                 |
    |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
   */
  let data = dataTable.hashes();
  const billingOption = data[0].option;
  await checkoutDetailsMethod.selectBillingPreference(t, billingOption, data[0].otherAddress, true);
});
When(/^user opts for concession card$/, async function (t) {
  await checkoutDetailsMethod.addConcessionCardDetails(t);
});
When(/^user opts in for Carbon Neutral$/, async function (t) {
  await testFunction.click(t, eaCheckoutDetailsPage.elements.cbOptInCarbonNeutral);
  console.log("CN checkbox selected.");
});
When(/^user fill the details to reproduce "([^"]*)" CDE response for "([^"]*)" customer$/, async function (t, [cdeResponse, customerType]) {
  await checkoutDetailsMethod.enterDetailsToMockCDE(t, cdeResponse, customerType);
});
When(/^user provides business details for My Account journey$/, async function (t) {
  await checkoutDetailsMethod.provideBusinessDetails_MA(t);
});
When(/^user "([^"]*)" optional detail sections on checkout details page for '(.*)'$/, async function (t, [expandOrCollapse, customerType], dataTable) {
  let isExpand = expandOrCollapse.toLowerCase() === "expand";
  if (isExpand) {
    await testFunction.waitForLoadingIconToClose();
    await testFunction.waitForElementToBeDisappeared(t, eaCheckoutDetailsPage.elements.eaSpinner);
  }

  if (await testFunction.isResidential(customerType)) {
    let data = dataTable.hashes();
    let AAH = data[0].AAH.toLowerCase() === "yes";
    let DD = data[0].DD.toLowerCase() === "yes";
    let concession = data[0].Concession.toLowerCase() === "yes";

    let aahSelector = isExpand ? eaCheckoutDetailsPage.elements.addAAH : eaCheckoutDetailsPage.elements.removeAAH;
    let ddSelector = isExpand ? eaCheckoutDetailsPage.elements.addDirectDebit : eaCheckoutDetailsPage.elements.removeDirectDebit;
    let concessionSelector = isExpand ? eaCheckoutDetailsPage.elements.addConcession : eaCheckoutDetailsPage.elements.removeConcession;

    if (AAH) {
      await testFunction.click(t, aahSelector);
    }
    if (DD) {
      await testFunction.click(t, ddSelector);
    }
    if (concession) {
      await testFunction.click(t, concessionSelector);
    }
  }
});

Then(/^user validates '([^"]*)' page UI$/, async function (t, [checkoutPage]) {
  let pageName = checkoutPage.toString().toLowerCase();

  if (pageName.includes("details")) {
    await testFunction.compareImages(t, "CHECKOUT_DETAILS_PAGE");
  } else if (pageName.includes("review")) {
    await testFunction.compareImages(t, "CHECKOUT_REVIEW_PAGE");
  } else if (pageName.includes("complete")) {
    await testFunction.compareImages(t, "CHECKOUT_COMPLETE_PAGE");
  } else {
    console.log("Invalid checkout page name.");
  }
});
When(/^user opts for special offer$/, async function (t, []) {
  await testFunction.click(t, eaCheckoutDetailsPage.elements.chkboxSpecialOffer);
});
When(/^user sends welcome pack through '(.*)'$/, async function (t, [option]) {
  if (option === 'Email') {
    await t.expect(await testFunction.getElementAttribute(t, eaCheckoutDetailsPage.elements.preferredCommEmail, 'class')).contains('ea-state-active');
  }
  if (option === 'Post') {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.preferredCommPost);
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "checkout_details_page", "post_welcome_pack_button");
    }
  }
});
When(/^user selects mailing address option$/, async function (t, [], dataTable) {
  let option = dataTable.hashes();
  if (option[0].addressType === "Connection Address") {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.mailingAddrAsConnAddr);
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "checkout_details_page", "mailing_addr_as_connaddr");
    }
  } else if (option[0].addressType === 'Other Address') {
    const otherAddress = option[0].otherAddress;
    await testFunction.click(t, eaCheckoutDetailsPage.elements.mailingAddrAsOtherAddr);
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "checkout_details_page", "address_picker");
    }
    await testFunction.enterText(t, eaCheckoutDetailsPage.elements.inputMailingAddrAsOtherAddr, otherAddress);
    await t.wait(2000);
    await testFunction.isElementVisible(t, eaCheckoutDetailsPage.elements.serviceAddressList);
    await testFunction.clickElementFromList(t, eaCheckoutDetailsPage.elements.serviceAddressList, otherAddress);
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "checkout_details_page", "different_mailing_address");
    }
    await t.wait(1000);
  } else {
    console.error("Invalid mailing address provided");
  }
  console.log("Mailing address is selected");

});
When(/^user saves the quote url$/, async function (t) {
  await checkoutDetailsMethod.saveQuoteUrl(t);
});
When(/^user validates solar component on checkout details page when solar setup is "([^"]*)"$/, async function (t, [solarSetup]) {
  await checkoutReviewMethod.validateSolarComponent(t, solarSetup);
});
When(/^user clicks on add plan button$/, async function (t) {
  await checkoutDetailsMethod.clickOnAddPlan(t);

});
Then(/^user validates solar government scheme disclaimer under solar buy back rates section$/, async function (t) {
  await plansMethod.validateSolarGovernmentSchemeDisclaimer(t);
});
Then(/^user validates solar indicator on checkout details page$/, async function (t) {
  await checkoutReviewMethod.verifyPresenceOfSolarIndicator(t);
});
Then(/^user validates solar disclaimer for QLD COR customer on PFIT NTC$/, async function (t) {
  await checkoutDetailsMethod.validateSolarDisclaimerForQLDCORCustomerOnPFITNTC(t);
});

Then(/^user validates the analytics data for user age for the customer$/, async function (t, []) {
  await checkoutDetailsMethod.validateAge(t);
});

