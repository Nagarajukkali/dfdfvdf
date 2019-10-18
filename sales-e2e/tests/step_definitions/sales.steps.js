const { Given, When, Then } = require('cucumber');
const { testData } = require('../../resources/resource')
const EaHomePage = require('../pages/energy-australia-home.page');
const { ClientFunction } = require('testcafe');
const {dateFormat} = require('../../libs/utility');

let amount;
let accountNumber;
let cardName;
const replace = { replace: true };

Given('user have opened the website link in a browser', async t => {
  await t.navigateTo(EaHomePage.pageUrl);
});

And(/^user has navigated to '(.*)' plans page$/, async function(t, customerType) {
  console.log(customerType.toString());
  if(customerType.toString()==='Residential'){
    await t.click(EaHomePage.elements.redidentialComparePlansButton);
  }
});

When(/^user clicks on the verify modal window on '(.*)' page$/, async function(t, customerType) {
  if(customerType.toString()==='Residential'){
    await t.click(EaHomePage.elements.residentialModalWindow);
  }
});

Then(/^I enter valid account number and '(.*)' in Payment details section$/, async function(t, amountToPay) {
  accountNumber = testData.accountNumber.substring(0, 4) + " " + testData.accountNumber.substring(4, 8) + " " + testData.accountNumber.substring(8, 10);
  amount = amountToPay.toString();
  await t
    .typeText(PaymentPage.elements.accountNumber, testData.accountNumber, replace)
    .typeText(PaymentPage.elements.amountToPay, amount, replace);
});

Then(/^I enter valid '(.*)' information in Payment method section$/, async function(t, cardType) {
  const elements = PaymentPage.elements;
  const type = cardType[0].charAt(0).toLowerCase() + cardType[0].substring(1);
  cardName = cardType.toString();
  const card = testData[type];

  await t
    .typeText(elements.creditCardNumber, card.cardNumber, replace)
    .typeText(elements.nameOnCard, card.nameOnCard, replace)
    .typeText(elements.expiryDate, dateFormat(cardName).toString(), replace)
    .typeText(elements.cvv, card.cvv, replace);
});

Then(/^I am on '(.*)' page$/, async function(t, pageURLContent) {
  const getPageUrl = ClientFunction(() => window.location.href);
  await t.expect(getPageUrl()).contains(pageURLContent);
});


Then(/^I click '(.*)' button$/, async function(t, buttonName) {
  await t.click(PaymentPage.elements.button.withText(buttonName.toString()));
});


Then('I see the account number and amount to pay prefilled correctly', async t => {
  accountNumber = testData.smsParameters.accountNumber;
  amount = testData.smsParameters.amount;
  await t.expect(PaymentPage.elements.accountNumberPrefilled.textContent).contains(testData.smsParameters.accountNumber)
    .expect(PaymentPage.elements.amountToPay.value).contains(amount);
});

Then('I see the spinner', async t => {
  await t.expect(PaymentPage.elements.modalSpinner.visible).ok();
});

Then(/^I see the success message '(.*)'$/, async function(t, message) {
  await t.expect(ReceiptPage.elements.successMessage.textContent).contains(message);
});
Then(/^I see the email success message '(.*)'$/, async function(t, message) {
  await t.expect(ReceiptPage.elements.emailSuccessMessage.textContent).contains(message);
});
Then('I see the relevant payment receipt details', async t => {
  if (cardName === 'Amex') {
    cardName = 'AMEX'
  }
  await t.expect(ReceiptPage.elements.amount.textContent).contains(amount)
    .expect(ReceiptPage.elements.accountNumber.textContent).contains(accountNumber)
    .expect(ReceiptPage.elements.paidFrom.textContent).contains(cardName);
});
Then('I enter a valid email address', async t => {
  await t.typeText(ReceiptPage.elements.emailAddress, testData.emailAddress);
});
