import {Selector } from 'testcafe';

const cartsPage={
  elements: {
    cartsPageContinueButton: Selector('.cart-button-wrapper__text'),
    elePlanName: Selector("[id*='flick-cart-plan__header-fuel-ELE'] div[class*='title']"),
    gasPlanName: Selector("[id*='flick-cart-plan__header-fuel-GAS'] div[class*='title']"),
    eleFeatures: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']"),
    eleFeature50Credit: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Credit"),
    eleFeatureChanceToWin: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("$2,000"),
    eleFeatureCN: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Carbon neutral"),
    eleFeatureDiscountOffTotal: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText(/Discount off total energy bill/i),
    eleFeaturePeaceOfMind: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Peace of mind"),
    eleFeatureDefaultOffer: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("Default offer"),
    eleFeatureVipPriorityService: Selector("[id*='flick-cart-plan__details-text-fuel-ELE']").withText("VIP Priority Service"),

    gasFeatures: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']"),
    gasFeature50Credit: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("Credit"),
    gasFeatureChanceToWin: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("$2,000"),
    gasFeatureCN: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("Carbon neutral"),
    gasFeatureDiscountOffTotal: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText(/Discount off total energy bill/i),
    gasFeaturePeaceOfMind: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("Peace of mind"),
    gasFeatureVipPriorityService: Selector("[id*='flick-cart-plan__details-text-fuel-GAS']").withText("VIP Priority Service")
  },
};

module.exports=cartsPage;



