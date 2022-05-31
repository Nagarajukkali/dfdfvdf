import {Selector} from 'testcafe';

const cartsPage = {
  elements: {
    cartsPageContinueButton: Selector('#flick-fix-button-wrapper__proceedBtn'),
    btnCartClose: Selector("button.cart-header__close"),
    elePlanName: Selector("#cart-plan-ELE .cart-plan__title"),
    gasPlanName: Selector("#cart-plan-GAS .cart-plan__title"),
    eleFeatures: Selector("#cart-plan-ELE .cart-plan__details-text"),
    eleFeature50Credit: Selector("#cart-plan-ELE .cart-plan__details-text").withText(/[C|c]redit/),
    eleFeatureChanceToWin: Selector("#cart-plan-ELE .cart-plan__details-text").withText("$2,000"),
    eleFeatureCN: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Carbon neutral"),
    eleFeatureMoveHome: Selector("#cart-plan-ELE .cart-plan__details-text").withText("sign up credit"),
    eleFeatureCNEG: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Energy with a bit of good"),
    eleFeatureDiscountOffTotal: Selector("#cart-plan-ELE .cart-plan__details-text").withText(/[D|d]iscount off total/),
    eleFeaturePeaceOfMind: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Peace of mind"),
    eleFeaturePeaceOfMindEE: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Priority customer service"),
    eleFeatureDefaultOffer: Selector("#cart-plan-ELE .cart-plan__details-text").withText("Default offer"),
    eleFeatureVipPriorityService: Selector("#cart-plan-ELE .cart-plan__details-text").withText("VIP Priority Service"),
    eleFeatureVariableRates: Selector("#cart-plan-ELE .cart-plan__details-text").withText(/Variable [R|r]ates/),

    gasFeatures: Selector("#cart-plan-GAS .cart-plan__details-text"),
    gasFeature50Credit: Selector("#cart-plan-GAS .cart-plan__details-text").withText(/[C|c]redit/),
    gasFeatureChanceToWin: Selector("#cart-plan-GAS .cart-plan__details-text").withText("$2,000"),
    gasFeatureCN: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Carbon neutral"),
    gasFeatureMoveHome: Selector("#cart-plan-GAS .cart-plan__details-text").withText("sign up credit"),
    gasFeatureCNEG: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Energy with a bit of good"),
    gasFeatureDiscountOffTotal: Selector("#cart-plan-GAS .cart-plan__details-text").withText(/[D|d]iscount off total/),
    gasFeaturePeaceOfMind: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Peace of mind"),
    gasFeaturePeaceOfMindEE: Selector("#cart-plan-GAS .cart-plan__details-text").withText("Priority customer service"),
    gasFeatureVipPriorityService: Selector("#cart-plan-GAS .cart-plan__details-text").withText("VIP Priority Service"),
    addDifferentGasPlan: Selector("#cart-plan-GAS+button"),
    addDifferentElePlan: Selector("#cart-plan-ELE+button"),
    gasFeatureVariableRates: Selector("#cart-plan-GAS .cart-plan__details-text").withText(/Variable [R|r]ates/),
    ResidentialBalanceTable: {
      residentialBalancePlanName: Selector("[id*='plan-heading-title-BASE_RSOT-']"),
      residentialBalanceFuel: Selector("[id*='plan-heading-fuel-BASE_RSOT-']"),
      residentialBalanceEleDiscount: Selector("[id*='plan-heading-title-BASE_RSOT-']"),
      residentialBalanceGasDiscount: Selector("[id*='plan-heading-fuel-BASE_RSOT-']"),
      residentialBalanceHeadingDescription : Selector("[id*='plan-heading-description-BASE_RSOT-']"),
      cNTitle: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      cNNDescription: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
      cNTitleQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      cNNDescriptionQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
      peaceOfMindTitle: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      peaceOfMindDescription: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
      peaceOfMindTitleQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      peaceOfMindDescriptionQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
      discountOffTitle: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      discountOffNDescription: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
      discountOffTitleQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral"),
      discountOffNDescriptionQLD: Selector("[id*='plan-feature'] [class*='hs-plan-feature__item-title']").withText("Carbon neutral").sibling(),
    },

  },
};

module.exports = cartsPage;



