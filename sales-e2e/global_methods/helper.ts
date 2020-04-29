import { Selector } from 'testcafe';
import { ClientFunction } from 'testcafe';
import {FUEL_TYPE_OPTIONS, AustralianState} from '@ea/ea-commons-models';
const replace={ replace: true };

  export enum CustomerStatus {
    NEW='New',
    EXISTING='Existing'
  }
  export enum Moving {
    MOVING='Moving',
    NON_MOVING='Non-Moving'
  }
  export enum Property {
    OWNER='Owner',
    RENTER='Renter'
  }
  export enum Solar {
    YES='Yes',
    NO='No'
  }
  export enum BusinessType {
    ABN='ABN',
    ACN='ACN'
  }

  export enum PlanType {
    BASIC_HOME='Basic Home',
    NO_FRILLS='No Frills',
    TOTAL_PLAN='Total Plan',
    TOTAL_PLAN_PLUS='Total Plan Plus',
    BASIC_BUSINESS='Basic Business',
    NO_FRILLS_BUSINESS='No Frills Business',
    TOTAL_BUSINESS='Total Business',
    TOTAL_PLAN_PLUS_BUSINESS='Total Plan Plus Business',
  }
  export enum IdType {
    DOB='dob',
    DL='dl',
    PIN='pin'
  }

  export enum LSDevices {
    ELE_LSCNSPE='Crigler Najjar Syndrome Phototherapy Equipment',
    ELE_LSCPAPR='Chronic Positive Airways Pressure Respirator',
    ELE_LSIPDM='Intermittent Peritoneal Dialysis Machine',
    ELE_LSKDM='Kidney Dialysis Machine',
    ELE_LSOC='Oxygen Concentrator',
    ELE_LSVFLS='Ventilator For Life Support',
    ELE_OTHER='Ele Other',
    GAS_GLSMRHAC='Medically Required Heating and/or Air Conditioning',
    GAS_GLSMRHW='Medically Required Hot Water',
    GAS_OTHER='Gas Other'
  }

  export enum SelectionType {
    CHECK='Check',
    UNCHECK='Uncheck'
  }

  export enum directDebitType {
    BANK_ACCOUNT = 'Bank',
    CREDIT_CARD = 'CC'
  }

  export enum cdeResponses {
    ACCEPT = "ACCEPT",
    DECLINE = "DECLINE",
    RETRY = "RETRY",
    ACCEPT_WITH_CONDITION = "ACCEPT_WC"
  }

export class testFunction {

  public static async click(t, element) {
    try {
      await this.isElementDisplayed(t, element);
      await t.click(element);
    } catch (error) {
      console.log(error);
    }
  }

  public static async isElementDisplayed(t: any, element: any) {
    await t.expect((element).exists).ok({ timeout: 30000 });
  }

  public static async maximizeWindow(t) {
    await t.maximizeWindow();
  }

  public static async sizeOfElement(t, element) {
    let val=await element.count
      .then(result => result);
    return val;
  }

  public static async scrollToElement(t, element) {
    await this.isElementDisplayed(t, element);
    await t.scrollTo(element);
  }

  public static async assertText(t, element, expectedFieldValue: string) {
    const actualFieldValue: string = await this.getElementText(t,element);
    await t.expect(actualFieldValue).contains(expectedFieldValue);
  }

  public static async assertTextOnPage(t, text) {
    const actualPageContent=await Selector('html').textContent;
    await t.expect(actualPageContent).contains(text);
  }

  public static async assertTextValue(t,actualText,expectedText){
    await t.expect(actualText).eql(expectedText);
  }

  public static async assertPageURL(t, urlContent) {
    const getPageUrl=ClientFunction(() => window.location.href);
    await t.expect(getPageUrl()).contains(urlContent);
  }

  public static async clearAndEnterText(t, element, value) {
    try {
      await this.isElementDisplayed(t, element);
      await t.typeText(element, value, {replace: true, paste: true});
    } catch (error) {
      console.log(error);
    }
  }

  public static async enterText(t, element, value) {
    try {
      await this.isElementDisplayed(t, element);
      await t.selectText(element)
        .pressKey('delete');
      await t.typeText(element, value, replace);
    } catch (error) {
      console.log(error);
    }
  }

  public static async getInputText(t, element) {
    return await element.value;
  }

  public static getElementText(t, element) {
    return element.innerText;
  }

  public static isElementVisible(t, element) {
    return element.visible;
  }

  public static getRandomNumber(range) {
    return (parseInt(String(Math.random() * range)) % range + 1).toString();
  }

  public static async clickElementFromList(t, element, value) {
    await t.click(element.withText(value));
  }

  public static isElectricity(fuelType) {
    return fuelType === FUEL_TYPE_OPTIONS.ELE.value || fuelType === FUEL_TYPE_OPTIONS.BOTH.value;
  }

  public static isGas(fuelType) {
    return fuelType === FUEL_TYPE_OPTIONS.GAS.value || fuelType === FUEL_TYPE_OPTIONS.BOTH.value;
  }

  public static waitForLoadingIconToClose(){
    const waitForLoading=ClientFunction(() => {
      return new Promise(resolve => {
        const interval=setInterval(() => {
          if (document.querySelector('.processing')) {
            return;
          }
          clearInterval(interval);
          resolve();
        }, 100);
      });
    });
    return waitForLoading;
  }

  public static getElementAttribute(t, element, attribute) {
    return element.getAttribute(attribute);
  }

  public static async navigateTo(t,url){
    await t.navigateTo(url);
  }

  public static async selectValueFromList(t,element,option){
    const listItem=element.find('option');
    await t.click(element).click(listItem.withText(option));
  }

  public static generateRandomText(length) {
    let result='';
    let characters='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    let charactersLength=characters.length;
    for (let i=0; i < length; i++) {
      result +=characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  public static async isElementAbsent(t, element) {
    await t.expect((element).exists).notOk();
  }

  public static async waitForLoadingIconToClose_MA(t) {
    const waitForLoading=ClientFunction(() => {
      return new Promise(resolve => {
        const interval=setInterval(() => {
          if (document.querySelector("[class*='spinner']")) {
            return;
          }
          clearInterval(interval);
          resolve();
        }, 100);
      });
    });
    return waitForLoading;
  }

  public static async waitForElementToBeInvisible(t,element,value,expectedText){
    for(let i=0;i<10;i++){
      const strVal=await testFunction.getElementAttribute(t,element,value);
      if(strVal.includes(expectedText)){
        await t.wait(2000);
      }
      else{
        break;
      }
    }
  }
  public static async waitForElementPropertyToBeChanged(t,element,value,expectedText?){
    for(let i=0;i<10;i++){
      if(testFunction.isElementVisible(t,element)){
        const strVal=await testFunction.getElementAttribute(t,element,value);
        if(strVal.includes(expectedText)){
          break;
        }
        else{
          await t.wait(2000);
        }
      }
      }
  }


  public static async waitForElementToBeDisappeared(t,element){
    await t.expect(element.exists).notOk({ timeout: 30000 });
  }
  public static async selectDateFromCalendar(t,element){
    const table=element;
    const tableElement=await element();
    const  rowCount=tableElement.childElementCount;
    let flag=false;
    for(let i=0;i<rowCount;i++){
      const rows=table.child(i);
      const row=await rows();
      const colCount=row.childElementCount;
      for(let j=1;j<colCount;j++){
        const cols=rows.child(j);
        const dateBtn=cols.child(0);
        const backgroundColor=await dateBtn.getStyleProperty("background-color").then(result=>result);
        if(backgroundColor.includes("rgba(110, 178, 20, 0.45)")){
          await testFunction.click(t,cols);
          flag=true;
          break;
        }
      }
      if(flag) break;
    }
  }

  public static getPostcode(state: string) {
    switch (state) {
      case AustralianState.VIC:
        return "3000";
      case AustralianState.NSW:
        return "2000";
      case AustralianState.ACT:
        return "2600";
      case AustralianState.SA:
        return "5000";
      case AustralianState.QLD:
        return "4500";
      default:
        return "Invalid State selection!";
    }
  }

}


