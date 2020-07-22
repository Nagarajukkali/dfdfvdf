import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
const eaCheckoutDetailsPage=require('../pages/checkOutDetails.page');
const eaCheckoutReviewPage=require('../pages/checkoutReview.page')
const EaHomePage=require('../pages/energy-australia-home.page');
import {LSDevices, PlanType, SelectionType, testFunction} from '../../global_methods/helper';
import {checkoutDetailsMethod} from './checkoutDetailsPage';


export class checkoutReviewMethod {

    public static async verifyLifeSupportSection(t) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportHeader);
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportDisclaimer);
    }

  public static async verifyExistingLifeSupportDetails(t,fuelType,accountType){
    switch (fuelType) {
    case FUEL_TYPE_OPTIONS.BOTH.value:
      this.verifyExistingLSDetailsForBothFuelSelected(t,accountType);
      break;
    case FUEL_TYPE_OPTIONS.ELE.value:
      this.verifyExistingLSDetailsForEleSelected(t,accountType);
      break;
    case FUEL_TYPE_OPTIONS.GAS.value:
      this.verifyExistingLSDetailsForGasSelected(t,accountType);
      break;
    default:
      console.error("Invalid fueltype or accountype selected");
    }
  }

  public static async verifyExistingLSDetailsForBothFuelSelected(t,verifiedAccount){
  switch (verifiedAccount) {
  case FUEL_TYPE_OPTIONS.BOTH.value:
    this.verifyDisplayOfExistingLSSectionForBothAccountVerified(t);
    break;
  case FUEL_TYPE_OPTIONS.ELE.value:
    this.verifyDisplayOfExistingLSSectionForEleAccountVerified(t);
    this.verifyLifeSupportQuestion(t,"GAS");
    break;
  case FUEL_TYPE_OPTIONS.GAS.value:
    this.verifyDisplayOfExistingLSSectionForGasAccountVerified(t);
    this.verifyLifeSupportQuestion(t,"ELE");
    break;
  default:
    console.error("Invalid account is selected");
  }
}

  public static async verifyExistingLSDetailsForEleSelected(t,verifiedAccount){
    if(verifiedAccount===FUEL_TYPE_OPTIONS.BOTH.value || verifiedAccount===FUEL_TYPE_OPTIONS.ELE.value){
      this.verifyDisplayOfExistingLSSectionForEleAccountVerified(t);
    }
    else if(verifiedAccount===FUEL_TYPE_OPTIONS.GAS.value){
      this.verifyLifeSupportQuestionForSingleFuel(t);
    }
    else{
      console.error("Invalid account type");
    }
  }

  public static async verifyExistingLSDetailsForGasSelected(t,verifiedAccount){
    if(verifiedAccount===FUEL_TYPE_OPTIONS.BOTH.value || verifiedAccount===FUEL_TYPE_OPTIONS.GAS.value){
      this.verifyDisplayOfExistingLSSectionForGasAccountVerified(t);
    }
    else if(verifiedAccount===FUEL_TYPE_OPTIONS.ELE.value){
      this.verifyLifeSupportQuestionForSingleFuel(t);
    }
    else{
      console.error("Invalid account is selected");
    }
  }

  public static async verifyDisplayOfExistingLSSectionForBothAccountVerified(t){
    await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.existingEleLifeSupportSection);
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.eleTextOnLifeSupportSection,"Electricity");
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.eleLifesupportStatus,"Registered");
    await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.existingGasLifeSupportSection);
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.gasTextOnLifeSupportSection,"Gas");
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.gasLifesupportStatus,"Registered");
  }

  public static async verifyDisplayOfExistingLSSectionForEleAccountVerified(t){
    await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.existingEleLifeSupportSection);
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.eleTextOnLifeSupportSection,"Electricity");
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.eleLifesupportStatus,"Registered");
  }

  public static async verifyDisplayOfExistingLSSectionForGasAccountVerified(t){
    await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.existingGasLifeSupportSection);
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.gasTextOnLifeSupportSection,"Gas");
    await testFunction.assertText(t,eaCheckoutReviewPage.elements.gasLifesupportStatus,"Registered");
  }



  public static async verifyLifeSupportQuestion(t, fuelType) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportQuestion);
      switch (fuelType) {
          case FUEL_TYPE_OPTIONS.BOTH.value:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support?");
              break;
          case FUEL_TYPE_OPTIONS.ELE.value:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for electricity?");
              break;
          case FUEL_TYPE_OPTIONS.GAS.value:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for gas?");
              break;
      }
      t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionYes.hasClass("ea-state-active"));
      t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionNo.hasClass("ea-state-active"));
  }

  public static async verifyLifeSupportQuestionForSingleFuel(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportQuestionSection);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support?");
    await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionYes.hasClass("ea-state-active"));
    await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionNo.hasClass("ea-state-active"));
  }

  public static async answerLifeSupportQuestion(t,option) {
      if(option==="Yes")
        await testFunction.click(t,eaCheckoutReviewPage.elements.lifeSupportQuestionYes);
      else if(option==="No")
        await testFunction.click(t,eaCheckoutReviewPage.elements.lifeSupportQuestionNo);
      else {
        console.error("Invalid option selected.");
      }
  }

  public static async getDiscount(t,fuelType){
      let eleSourceCode;
      let gasSourceCode;
      let eleDiscount;
      let gasDiscount;
      if(testFunction.isElectricity(fuelType)){
        let elePlanName=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtElePlanName);
        if(elePlanName===PlanType.TOTAL_PLAN || elePlanName==='Total Plan - Business' || elePlanName==='Family and Friends'){
          eleDiscount=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtEleDiscount);
          if(t.testRun.test.name.includes('EACorporateOffer')){
            eleSourceCode='Alliance_'+eleDiscount.split(" ")[1]+'GD';
          }
          else if(t.testRun.test.name.includes('familyandfriends')){
            eleSourceCode='Total_'+eleDiscount.split(" ")[1]+'GD';
          }
          else{
            eleSourceCode=elePlanName.split(" ")[0]+'_'+eleDiscount.split(" ")[1]+'GD';
          }
        }
        else if(elePlanName===PlanType.TOTAL_PLAN_PLUS || elePlanName==='Total Plan Plus - Business'){
          eleDiscount=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtEleDiscount);
          eleSourceCode=elePlanName.split(" ")[0]+'_Plus_'+eleDiscount.split(" ")[1]+'GD';
        }
        else if(elePlanName===PlanType.NO_FRILLS || elePlanName===PlanType.NO_FRILLS_BUSINESS){
          eleSourceCode='NOFRILLS';
        }
        else if(elePlanName===PlanType.BASIC_BUSINESS || elePlanName===PlanType.BASIC_HOME){
          eleSourceCode='Basic';
        }
        checkoutDetailsMethod.map.set('ele source code_'+checkoutDetailsMethod.getScenarioId(t),eleSourceCode);
      }
      if(testFunction.isGas(fuelType)){
        let gasPlanName=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtGasPlanName);
        if(gasPlanName===PlanType.TOTAL_PLAN || gasPlanName==='Total Plan - Business'){
          gasDiscount=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtGasDiscount);
          if(t.testRun.test.name.includes('EACorporateOffer')){
            gasSourceCode='Alliance_'+gasDiscount.split(" ")[1]+'GD';
          }
          else{
            gasSourceCode=gasPlanName.split(" ")[0]+'_'+gasDiscount.split(" ")[1]+'GD';
          }
        }
        else if(gasPlanName===PlanType.TOTAL_PLAN_PLUS || gasPlanName==='Total Plan Plus - Business'){
          gasDiscount=await testFunction.getElementText(t,eaCheckoutReviewPage.elements.txtGasDiscount);
          gasSourceCode=gasPlanName.split(" ")[0]+'_Plus_'+gasDiscount.split(" ")[1]+'GD';
        }
        else if(gasPlanName===PlanType.NO_FRILLS || gasPlanName===PlanType.NO_FRILLS_BUSINESS){
          gasSourceCode='NOFRILLS';
        }
        else if(gasPlanName===PlanType.BASIC_BUSINESS || gasPlanName===PlanType.BASIC_HOME){
          gasSourceCode='Basic';
        }
        checkoutDetailsMethod.map.set('gas source code_'+checkoutDetailsMethod.getScenarioId(t),gasSourceCode);
      }
      return checkoutDetailsMethod.map;
  }

  public static async submitQuote(t){
      await testFunction.click(t, eaCheckoutReviewPage.elements.agreeAndConfirm);
  }

  public static async validatePresenceOfFuelAccordion(t,fuelType) {
      if(await testFunction.isElectricity(fuelType)) {
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportElec);
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
      }
      if(await testFunction.isGas(fuelType)) {
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportGas);
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
      }
  }

  public static async clickOnRegisterDeviceBtn(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
    }
  }

  public static async validateLifeSupportDeviceList(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE, LSDevices.ELE_LSCNSPE);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR, LSDevices.ELE_LSCPAPR);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM, LSDevices.ELE_LSIPDM);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM, LSDevices.ELE_LSKDM);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC, LSDevices.ELE_LSOC);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS, LSDevices.ELE_LSVFLS);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, LSDevices.ELE_OTHER);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC, LSDevices.GAS_GLSMRHAC);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW, LSDevices.GAS_GLSMRHW);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, LSDevices.GAS_OTHER);
    }
  }

  public static async clickOtherCheckbox(t, selection, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      if(selection ===SelectionType.CHECK) {
        while (!((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked")))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }else {
        while ((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked"))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }
    }
    if(await testFunction.isGas(fuelType)) {
      if(selection ===SelectionType.CHECK) {
        while (!((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked")))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }else {
        while ((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked"))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }
    }
  }

  public static async validatePresenceOfOtherTextfield(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  public static async validateOtherFieldPlaceholder(t, expectedPlaceholder, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await t.expect(testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, "placeholder")).contains(expectedPlaceholder);
    }
    if(await testFunction.isGas(fuelType)) {
      await t.expect(testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, "placeholder")).contains(expectedPlaceholder);
    }
  }

  public static async validateMaxLengthForOtherEquipmentsTextfield(t, expectedMaxLength, fuelType) {
    let randomText=await testFunction.generateRandomText(expectedMaxLength + 1);
    if(await testFunction.isElectricity(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsElec, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).eql(expectedMaxLength);
    }
    if(await testFunction.isGas(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsGas, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).eql(expectedMaxLength);
    }
  }

  public static async validateAbsenceOfOtherTextarea(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  public static async validateReappearenceOfTextfieldWithPrefilledData(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).notEql(0);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).notEql(0);
    }
  }

  public static async validateTheSelectedOptionAndAbsenceOfFuelAccordions(t, expectedSelection, fuelType) {
    let classValue;
    if(expectedSelection ==="yes") {
      classValue=await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.lifeSupportQuestionYes, "class");
    }
    else {
      classValue=await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.lifeSupportQuestionNo, "class");
    }
    await classValue.include("ea-state-active").ok();

    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  public static async validatePresenceOfGenericLSError(t, expectedError) {
    await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGenericError);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblGenericError, expectedError);
  }

  public static async validatePresenceOfErrorMessageUnderneathOtherTextarea(t, expectedError, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError, expectedError);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError, expectedError);
    }
  }

  public static async selectLSDevice(t, webElement) {
    let tryCount=0;
    do{
      await testFunction.click(t, webElement);
      tryCount++;
      if(tryCount > 5)
        break;
    }while (!((await testFunction.getElementAttribute(t, webElement, "class")).includes("ea-state-checked")));
  }

  public static async selectElecLSEquipment(t, equipmentName, fuelType) {
      switch (equipmentName) {
        case LSDevices.ELE_LSCNSPE:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
          break;
        case LSDevices.ELE_LSCPAPR:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
          break;
        case LSDevices.ELE_LSIPDM:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
          break;
        case LSDevices.ELE_LSKDM:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
          break;
        case LSDevices.ELE_LSOC:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
          break;
        case LSDevices.ELE_LSVFLS:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
          break;
        case LSDevices.ELE_OTHER:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
          await testFunction.clearAndEnterText(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, "Sample Other electricity device.");
          break;
        default:
          console.error("Invalid Electricity Equipment.");
      }
  }

  public static async selectGasLSEquipment(t, equipmentName, fuelType) {
      switch (equipmentName) {
        case LSDevices.GAS_GLSMRHAC:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
          break;
        case LSDevices.GAS_GLSMRHW:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
          break;
        case LSDevices.GAS_OTHER:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
          await testFunction.clearAndEnterText(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, "Sample Other gas device.");
          break;
        default:
          console.error("Invalid Gas Equipment.");
      }
  }

  public static async validateAbsenceOfFuelAccordion(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  public static async clickCancelCTA(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnCancelElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnCancelGas);
  }

  public static async validatePresenceOfRegisterDeviceCTA(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
  }

  public static async validatePlanName(t: any, json: any, dataTable) {
    if(await testFunction.isElectricity(dataTable[0].fuelType)) {
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.elePlanName, json.planName);
    }
    if(await testFunction.isGas(dataTable[0].fuelType)) {
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.gasPlanName, json.planName)
    }
  }

  public static async validateFeatures(t: any, dataTable, json: any, numOfExpectedFeatures) {
    console.log("Validating plan features on review page.");
    if(await testFunction.isElectricity(dataTable[0].fuelType)) {
      await t.expect(await testFunction.sizeOfElement(t, eaCheckoutReviewPage.elements.eleFeatures)).eql(numOfExpectedFeatures);
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.eleFeatureCN, json.electricity.feature.postSelect.carbonNeutral);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.eleFeaturePeaceOfMind, json.electricity.feature.postSelect.peaceOfMind);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill);
      }
      if(dataTable[0].Feature_noStandardConnectionFee === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.eleFeatureNoStandardConnectionFee, json.electricity.feature.postSelect.noStandardConnectionFee);
      }
    }
    if(await testFunction.isGas(dataTable[0].fuelType)) {
      await t.expect(await testFunction.sizeOfElement(t, eaCheckoutReviewPage.elements.gasFeatures)).eql(numOfExpectedFeatures);
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.gasFeatureCN, json.gas.feature.postSelect.carbonNeutral);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.gasFeaturePeaceOfMind, json.gas.feature.postSelect.peaceOfMind);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill);
      }
    }
  }
  public static async verifyIDVPopup(t){
      await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.identificationPopup);
  }
  public static async confirmIdentification(t){
    await testFunction.click(t,eaCheckoutReviewPage.elements.identificationConfirmButton);
  }

  public static async provideIdDetails(t){
      await testFunction.enterText(t,eaCheckoutReviewPage.elements.idFirstName,'test');
      await testFunction.enterText(t,eaCheckoutReviewPage.elements.idLastName,'test');
      await testFunction.enterText(t,eaCheckoutReviewPage.elements.idDOBDay,'01011980');
      let licenceNumber=testFunction.getRandomNumber(999999);
      await testFunction.enterText(t,eaCheckoutReviewPage.elements.idnumberLicence,licenceNumber);
      await t.wait(3000);
      await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.identificationConfirmButton);
  }

  public static async validateProgressbarAndSubheading(t) {
    let numOfCompletedIndicator = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.progressBarProgressIndicatorCompleted);
    await t.expect(numOfCompletedIndicator).eql(1);
    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.progressBar);
    let subHeading = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.txtSubheading);
    await testFunction.assertTextValue(t, subHeading, "Review your details");
    console.log("Progress bar And Subheading validation completed on review page.");
  }

  public static async validateConnectionDetails(t, journey, fuelType) {
    journey = journey.toLowerCase();

    await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.main);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.connectionDetails.heading, "Connection details");

    await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.connectionAddress.main);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.connectionDetails.connectionAddress.heading, "Connection address");

    if(journey === "move home") {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.connectionDate.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.connectionDetails.connectionDate.heading, "Connection date");
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.connectionDate.data);
    }

    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.distributor.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.connectionDetails.distributor.heading, "Electricity distributor");
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.distributor.data);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.customerType.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.connectionDetails.customerType.heading, "Customer type");
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.connectionDetails.customerType.data);
    }
    console.log("Validation completed for Connection details section on review page.");
  }

  public static async validateAccountHoldersSection(t, sourceSystem, journey, aah) {
    sourceSystem = sourceSystem.toLowerCase();
    journey = journey.toLowerCase();
    aah = aah.toLowerCase();

    if(sourceSystem === "my account" && (journey === "plan switch" || journey === "best offer")) {
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.accountHolders.main);
    } else {
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.accountHolders.main);

      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.accountHolders.primaryAccountHolder.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.accountHolders.primaryAccountHolder.heading, "Primary account holder");
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.accountHolders.primaryAccountHolder.data);

      if(aah === "yes") {
        await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.accountHolders.additionalAccountHolder.main);
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.accountHolders.additionalAccountHolder.heading, "Additional account holder");
        await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.accountHolders.additionalAccountHolder.data);
      } else {
        await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.accountHolders.additionalAccountHolder.main);
      }

      console.log("Validation completed for account holder section on checkout review page.");
    }
  }

  public static async validateBillingAndPaymentPrefSection(t, sourceSystem, journey, dd) {
    sourceSystem = sourceSystem.toLowerCase();
    journey = journey.toLowerCase();
    dd = dd.toLowerCase();

    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.main);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.heading, "Billing and payment preferences");

    if(sourceSystem === "my account" && (journey === "plan switch" || journey === "best offer")) {
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_MA.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_MA.heading, "Bill Payment method");
      if(dd === "yes") {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_MA.data, "Direct Debit");
      } else {
        await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_MA.data, "Manually");
      }
    }

    if(sourceSystem != "my account" && dd === "yes") {
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_QT.main);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_QT.heading, "Bill Payment method");
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billPaymentMethod_QT.data);
    }
    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billsDeliveredTo.main);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billsDeliveredTo.heading, "Bills delivered to");
    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.billingAndPaymentPref.billsDeliveredTo.data);

    console.log("Validation completed for billing and payment preference section on checkout review page.");
  }

  public static async validateFeesAndChargesSection(t) {
    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.feesAndCharges.main);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.feesAndCharges.heading, "Fees and charges");
    await t.expect(await testFunction.sizeOfElement(t, eaCheckoutReviewPage.elements.feesAndCharges.feeItems)).gt(1);

    let expectedText = " Pleasenote for all payment options, excluding direct debit or Centrepay, a merchant service fee (incl. GST) may apply to credit card payments - 0.36% for paying bills by Visa and Mastercard and 1.5% for paying bills by American Express. The best way to avoid these fees is to set up direct debit via My Account.";
    let actualText = await testFunction.getElementText(t, eaCheckoutReviewPage.elements.feesAndCharges.disclaimer);
    actualText = actualText.replace(" ", "");
    expectedText = expectedText.replace(" ", "");
    await testFunction.assertTextValue(t, actualText, expectedText);

    console.log("Validation completed for fees and charges section on checkout review page.");
  }

  public static async validateCarbonNeutralSection(t) {
    let isBusiness = (await testFunction.getElementText(t, eaCheckoutReviewPage.elements.txtPlanTitle)).includes("Business");
    if(!isBusiness) {
      await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.carbonNeutral.main);
      await t.expect(await testFunction.getElementText(t, eaCheckoutReviewPage.elements.carbonNeutral.heading)).contains("Opt in for carbon neutral");
    }
    console.log("Validation completed for Carbon Neutral section on checkout review page.");
  }

  public static async validateNavigationButtons(t) {
    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.btnBack);
    await testFunction.isElementVisible(t, eaCheckoutReviewPage.elements.btnAgreeAndConfirm);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.btnBack, "Back");
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.btnAgreeAndConfirm, "Agree and confirm");
    console.log("Validation completed for buttons (back and Submit) on review page.");
  }

  public static async missingCustomerIdentificationDetails(t){
    let idValue=testFunction.getRandomNumber(999999);
    let indexForIdType=testFunction.getRandomInt(0,2);
    if(indexForIdType!==0){
      await testFunction.click(t,eaCheckoutReviewPage.elements.idTypeActiveOption);
      await testFunction.click(t,eaCheckoutReviewPage.elements.listIdType.nth(indexForIdType));
    }
    await testFunction.clearAndEnterText(t,eaCheckoutReviewPage.elements.idValue,idValue);
  }

  public static async provideMissingCustomerContactPersonDetails(t){
    let indexForTitle=testFunction.getRandomInt(0,4);
    await testFunction.click(t,eaCheckoutReviewPage.elements.titleActiveOption);
    await testFunction.click(t,eaCheckoutReviewPage.elements.listTitle.nth(indexForTitle));
    await testFunction.clearAndEnterText(t,eaCheckoutReviewPage.elements.inputFirstName,'test');
    await testFunction.clearAndEnterText(t,eaCheckoutReviewPage.elements.inputLastName,'test');
  }

  public static async provideMissingABNACNDetails(t){
    let indexForABNACN=testFunction.getRandomInt(0,1);
    if(indexForABNACN===0){
      let ABN=testFunction.getRandomNumber(99999999999);
      ABN = ABN.padEnd(11, "0");
      await testFunction.click(t,eaCheckoutReviewPage.elements.abn);
      await testFunction.clearAndEnterText(t,eaCheckoutReviewPage.elements.abnAcnValue,ABN);
    }
    else{
      let ACN=testFunction.getRandomNumber(999999999);
      ACN = ACN.padEnd(9, "0");
      await t.wait(2000);
      await testFunction.click(t,eaCheckoutReviewPage.elements.acn);
      await testFunction.clearAndEnterText(t,eaCheckoutReviewPage.elements.abnAcnValue,ACN);
    }
  }

  public static async enterBusinessDetails(t){
    let indexForBusinessType=testFunction.getRandomInt(0,9);
    let indexForAnZsicCode=testFunction.getRandomInt(0,17);
    await testFunction.click(t,eaCheckoutReviewPage.elements.businessTypeActiveOption);
    await testFunction.click(t,eaCheckoutReviewPage.elements.listBusinessType.nth(indexForBusinessType));
    await testFunction.click(t,eaCheckoutReviewPage.elements.anzsicCode);
    await testFunction.click(t,eaCheckoutReviewPage.elements.listAnzsicCode.nth(indexForAnZsicCode));
  }

  public static async validateGeneralStateDisclaimer(t, customerType, isNewCustomer, isMoving) {
    if(await testFunction.isResidential(customerType)) {
      //Residential customers
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP1, "When you choose us, you’ll be with a trusted power provider who supplies energy to 1.7 million Australian customers.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP2, "We are focusing on helping customers reduce their energy usage via tips in our blog on energy rating and how to be more energy efficient.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP3, "Compare energy plans from the options above and find our best electricity deals (www.energyaustralia.com.au/offer). Making an energy switch has never been so easy.");
    } else if(await testFunction.isBusiness(customerType)){
      let expectedText;
      if(isNewCustomer && isMoving) {
        //New -  Moving - Business customer
        expectedText = "Find a great deal for your business here at EnergyAustralia, and move with confidence. Easily compare plans, rates and benefits then book your move online for instant email confirmation.";
      }else if(isNewCustomer && !isMoving) {
        //New - Non moving - Business customer
        expectedText = "Find a better deal for your business here at EnergyAustralia. Easily compare plans, rates and benefits then switch online for instant email confirmation.";
      }else if(!isNewCustomer && isMoving) {
        //Existing - Moving - Business customer
        expectedText = "Find a great deal for your business here at EnergyAustralia, and move with confidence. Easily compare plans, rates and benefits then book your move online for instant email confirmation.";
      }else if(!isNewCustomer && !isMoving) {
        //Existing - Non moving - Business customer
        expectedText = "Find a great deal for your business here at EnergyAustralia. Easily compare plans, rates and benefits then switch online for instant email confirmation.";
      }else {
        throw Error("Invalid combination");
      }
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerOld, expectedText);
    }
    console.log("General state disclaimer validated successfully on review page.");
  }
}
