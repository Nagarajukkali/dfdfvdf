import {Selector} from 'testcafe';

const cartsPage = {
  elements: {
    cartsPageContinueButton: Selector('#flick-fix-button-wrapper__proceedBtn'),
    btnCartClose: Selector("button.cart-header__close"),
    elePlanName: Selector("#cart-plan-ELE .cart-plan__title"),
    gasPlanName: Selector("#cart-plan-GAS .cart-plan__title"),
    eleFeatures: Selector("#cart-plan-ELE .cart-plan__details-text"),
    eleFeature50Credit: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Credit"),
    eleFeatureChanceToWin: Selector("#cart-plan-ELE .cart-plan__details-text").withText("$2,000"),
    eleFeatureCN: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Carbon neutral"),
    eleFeatureCNEG: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Energy with a bit of good"),
    eleFeatureDiscountOffTotal: Selector("#cart-plan-ELE .cart-plan__details-text").withText(/[D|d]iscount off total/),
    eleFeaturePeaceOfMind: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Peace of mind"),
    eleFeatureDefaultOffer: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Default offer"),
    eleFeatureVipPriorityService: Selector("#cart-plan-ELE .cart-plan__details-text").withText("VIP Priority Service"),

    gasFeatures: Selector("#cart-plan-GAS .cart-plan__details-text"),
    gasFeature50Credit: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Credit"),
    gasFeatureChanceToWin: Selector("#cart-plan-GAS .cart-plan__details-text").withText("$2,000"),
    gasFeatureCN: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Carbon neutral"),
    gasFeatureCNEG: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Energy with a bit of good"),
    gasFeatureDiscountOffTotal: Selector("#cart-plan-GAS .cart-plan__details-text").withText(/[D|d]iscount off total/),
    gasFeaturePeaceOfMind: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Peace of mind"),
    gasFeatureVipPriorityService: Selector("#cart-plan-GAS .cart-plan__details-text").withText("VIP Priority Service"),
    addDifferentGasPlan: Selector("#cart-plan-GAS+button"),
    addDifferentElePlan: Selector("#cart-plan-ELE+button"),


  },
};

module.exports = cartsPage;



