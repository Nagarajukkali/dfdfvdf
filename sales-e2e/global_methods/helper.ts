import { Selector } from 'testcafe';
import { ClientFunction } from 'testcafe';
import { error } from 'console';
const replace = { replace: true };

  export enum FuelType {
    ELECTRICITY = 'Electricity',
    GAS= 'Gas',
    DUAL= 'Dual'
  }
  export enum CustomerStatus {
    NEW= 'New',
    EXISTING= 'Existing'
  }
  export enum CustomerType {
    RESIDENTIAL= 'Residential',
    BUSINESS= 'Business'
  }
  export enum Moving {
    MOVING= 'Moving',
    NONMOVING= 'Non-Moving'
  }
  export enum Property {
    OWNER= 'Owner',
    RENTER= 'Renter'
  }
  export enum Solar {
    YES= 'Yes',
    NO= 'No'
  }
  export enum BusinessType {
    ABN= 'ABN',
    ACN= 'ACN'
  }
  export enum PlanType {
    BASICHOME= 'Basic',
    NOFRILLS= 'No Frills',
    TOTALPLAN= 'Total',
    TOTALPLANPLUS= 'Total Plan Plus',
    BASICBUSINESS= 'Basic Business'
  }
  export enum IdType {
    DOB= 'dob',
    DL= 'dl',
    PIN= 'pin'
  }
  export enum State {
    VIC= 'VIC',
    SA= 'SA',
    NSW= 'NSW',
    QLD= 'QLD',
    ACT= 'ACT'
  }

  export enum LSDevices {
    ELE_LSCNSPE = 'Crigler Najjar Syndrome Phototherapy Equipment',
    ELE_LSCPAPR = 'Chronic Positive Airways Pressure Respirator',
    ELE_LSIPDM = 'Intermittent Peritoneal Dialysis Machine',
    ELE_LSKDM = 'Kidney Dialysis Machine',
    ELE_LSOC = 'Oxygen Concentrator',
    ELE_LSVFLS = 'Ventilator For Life Support',
    ELE_OTHER = 'Other',
    GAS_GLSMRHAC = 'Medically Required Heating and/or Air Conditioning',
    GAS_GLSMRHW = 'Medically Required Hot Water',
    GAS_OTHER = 'Other'
  }

  export enum SelectionType {
    CHECK = 'Check',
    UNCHECK = 'Uncheck'
  }

export function testFuncs() {

  async function click(t, buttonName) {
    try {
      await isElementDisplayed(t, buttonName);
      await t.click(buttonName);
    } catch (error) {
      console.log(error);
    }
  }

  async function maximizeWindow(t) {
    await t.maximizeWindow();
  }

  async function sizeOfElement(t, element) {
    let val = await element.count
      .then(result => result);
    return val;
  }

  async function scrollToElement(t, element) {
    await isElementDisplayed(t, element);
    await t.scrollTo(element);
  }

  async function isElementDisplayed(t, element) {
    await t.expect((element).exists).ok;
  }

  async function assertText(t, element, expectedFieldValue) {
    const actualFieldValue = element.innerText;
    await t.expect(actualFieldValue).contains(expectedFieldValue);
  }

  async function assertTextOnPage(t, text) {
    const actualPageContent = await Selector('html').textContent;
    await t.expect(actualPageContent).contains(text);
  }

  async function assertPageURL(t, urlContent) {
    const getPageUrl = ClientFunction(() => window.location.href);
    await t.expect(getPageUrl()).contains(urlContent);
  }

  async function clearAndEnterText(t, element, value) {
    try {
      await isElementDisplayed(t, element);
      await t.selectText(element)
        .pressKey('delete');
      await t.typeText(element, value, replace);
    } catch (error) {
      console.log(error);
    }
  }

  async function getInputText(t, element) {
    return await element.value;
  }

  async function getElementText(t, element) {
    return element.innerText;
  }

  async function isElementVisible(t, element) {
    return element.visible;
  }

  function getRandomNumber(range) {
    // tslint:disable-next-line:radix
    return (parseInt(String(Math.random() * range)) % range + 1).toString();
  }

  async function clickElementFromList(t, element, value) {
    await t.click(element.withText(value));
  }

  async function isElectricity(fuelType) {
    return fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL;
  }

  async function isGas(fuelType) {
    return fuelType === FuelType.GAS || fuelType === FuelType.DUAL;
  }

  const waitForLoadingIconToClose = ClientFunction(() => {
    return new Promise(resolve => {
      const interval = setInterval(() => {
        if (document.querySelector('.processing')) {
          return;
        }

        clearInterval(interval);
        resolve();
      }, 100);
    });
  });

  async function getElementAttribute(t, element, attribute) {
    return element.getAttribute(attribute);
  }

  async function generateRandomText(length) {
    let result = '';
    let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  async function isElementAbsent(t, element) {
    await t.expect((element).exists).notOk();
  }


  return {
    click,
    isElementDisplayed,
    assertText,
    assertTextOnPage,
    assertPageURL,
    clearAndEnterText,
    getInputText,
    getElementText,
    scrollToElement,
    isElementVisible,
    getRandomNumber,
    clickElementFromList,
    waitForLoadingIconToClose,
    isElectricity,
    isGas,
    sizeOfElement,
    maximizeWindow,
    getElementAttribute,
    generateRandomText,
    isElementAbsent,
  };
}


