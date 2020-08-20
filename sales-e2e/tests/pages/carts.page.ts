import {Selector } from 'testcafe';

const cartsPage={
  elements: {
    cartsPageContinueButton: Selector('.cart-button-wrapper__text'),
    elePlanName: Selector("[id*='flick-cart-plan__header-fuel-ELE'] div[class*='title']"),
    gasPlanName: Selector("[id*='flick-cart-plan__header-fuel-GAS'] div[class*='title']"),
    eleFeatures: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']"),
    eleFeature50Credit: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("$50"),
    eleFeatureCN: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Carbon neutral"),
    eleFeatureDiscountOffTotal: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText(/[D|d]iscount off total energy bill/),
    eleFeaturePeaceOfMind: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Peace of mind"),
    gasFeatures: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']"),
    gasFeature50Credit: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("$50"),
    gasFeatureCN: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("Carbon neutral"),
    gasFeatureDiscountOffTotal: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText(/[D|d]iscount off total energy bill/),
    gasFeaturePeaceOfMind: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("Peace of mind")
  },
};

module.exports=cartsPage;



