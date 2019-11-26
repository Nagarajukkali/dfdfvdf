import {plansMethod } from '../methods/plansPage';
import {selectionOptionModalWindowMethod } from '../methods/plansPage';
import {When, Then } from 'cucumber';

When(/^user clicks on the verify modal window on '(.*)' page$/, async function(t, [customerType]) {
      await plansMethod.clickPlansPageModal(t,customerType);
});

When(/^user clicks on '(.*)' from the modal$/, async function(t, [modalWindowValue]) {
    await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, modalWindowValue);
});

Then(/^User lands on plans page after verify account journey$/, async t =>{
  await plansMethod.verifyVerifyAccountChangeButton(t);
});

When(/^user selects '(.*)' from '(.*)' plans page$/, async function(t, [planName,customerType]){
  await plansMethod.selectPlan(t, planName, customerType);
});

