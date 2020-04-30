import {Selector } from 'testcafe';

const cartsPage={
  elements: {
    cartsPageContinueButton: Selector('.cart-button-wrapper__text'),
    elePlanName: Selector("[id*='flick-cart-plan__header-fuel-ELE'] div[class*='title']"),
    gasPlanName: Selector("[id*='flick-cart-plan__header-fuel-GAS'] div[class*='title']")
  },
};

module.exports=cartsPage;



