import {Selector } from 'testcafe';

const cartsPage={
  elements: {
    cartsPageContinueButton: Selector('.cart-button-wrapper__text'),
    elePlanName: Selector("[id*='flick-cart-plan__header-fuel-ELE'] div[class*='title']"),
    gasPlanName: Selector("[id*='flick-cart-plan__header-fuel-GAS'] div[class*='title']"),
    eleFeature50Credit: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("$50"),
    eleFeatureCN: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Carbon neutral"),
    eleFeatureDiscountOffTotal: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Discount off total energy bill"),
    eleFeaturePeaceOfMind: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Peace of mind"),

  },
};

module.exports=cartsPage;



