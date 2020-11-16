import {Selector } from 'testcafe';

const cartsPage={
  elements: {
    cartsPageContinueButton: Selector('#flick-fix-button-wrapper__proceedBtn'),
    elePlanName: Selector("#cart-plan-ELE .cart-plan__title"),
    gasPlanName: Selector("#cart-plan-GAS .cart-plan__title"),
    eleFeatures: Selector("#cart-plan-ELE .cart-plan__details-text"),
    eleFeature50Credit: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Credit"),
    eleFeatureChanceToWin: Selector("#cart-plan-ELE .cart-plan__details-text").withText("$2,000"),
    eleFeatureCN: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Carbon neutral"),
    eleFeatureDiscountOffTotal: Selector("#cart-plan-ELE .cart-plan__details-text").withText(/Discount off total energy bill/i),
    eleFeaturePeaceOfMind: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Peace of mind"),
    eleFeatureDefaultOffer: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Default offer"),
    eleFeatureVipPriorityService: Selector("#cart-plan-ELE .cart-plan__details-text").withText("VIP Priority Service"),

    gasFeatures: Selector("#cart-plan-GAS .cart-plan__details-text"),
    gasFeature50Credit: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Credit"),
    gasFeatureChanceToWin: Selector("#cart-plan-GAS .cart-plan__details-text").withText("$2,000"),
    gasFeatureCN: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Carbon neutral"),
    gasFeatureDiscountOffTotal: Selector("#cart-plan-GAS .cart-plan__details-text").withText(/Discount off total energy bill/i),
    gasFeaturePeaceOfMind: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Peace of mind"),
    gasFeatureVipPriorityService: Selector("#cart-plan-GAS .cart-plan__details-text").withText("VIP Priority Service")
  },
};

module.exports=cartsPage;



