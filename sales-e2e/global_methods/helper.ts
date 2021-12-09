import {ClientFunction, RequestLogger, Selector, t} from 'testcafe';
import {AustralianState, CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {fetchBrowser, getDateTime, screenshotFolder, width} from '../tests/step_definitions/hooks';
import {FileUtils} from '../libs/FileUtils';
import requestLoggerUtilities from '../global_methods/requestLoggerUtilities';

const fs = require("mz/fs");
const requestLoggerUtils = new requestLoggerUtilities();
const replace = {replace: true};
const {config} = require('../resources/resource');
const resemble = require("resemblejs");
const screenshot = config.screenshot;
const eaHomePage = config.eaCampaignUrl;
let logger = null;
const deviceScreenSize = config.deviceScreenSize;

export enum CustomerStatus {
  NEW = 'New',
  EXISTING = 'Existing'
}

export enum Moving {
  MOVING = 'Moving',
  NON_MOVING = 'Non-Moving'
}

export enum Property {
  OWNER = 'Owner',
  RENTER = 'Renter'
}

export enum Solar {
  YES = 'Yes',
  NO = 'No'
}

export enum BusinessType {
  ABN = 'ABN',
  ACN = 'ACN'
}

export enum PlanType {
  BASIC_HOME = 'Basic Home',
  RESIDENTIAL_BALANCE_PLAN = 'Balance Plan',
  BASIC_HOME_QLD = 'Basic Home QLD',
  NO_FRILLS = 'No Frills',
  TOTAL_PLAN = 'Total Plan',
  TOTAL_PLAN_PLUS = 'Total Plan Plus',
  BASIC_BUSINESS = 'Basic Business',
  BASIC_BUSINESS_QLD = 'Basic Business QLD',
  NO_FRILLS_BUSINESS = 'No Frills Business',
  TOTAL_BUSINESS = 'Total Plan - Business',
  TOTAL_PLAN_PLUS_BUSINESS = 'Total Plan Plus - Business',
  FAMILY_AND_FRIENDS = 'Family and Friends',
  FAMILY_AND_FRIENDS_BUSINESS = 'Family and Friends Business',
  BUSINESS_CARBON_NEUTRAL = 'Business Carbon Neutral',
  BUSINESS_BALANCE_PLAN = 'Business Balance Plan',
  EMPLOYEE_PLAN = 'Employee Plan',
}

export enum IdType {
  DOB = 'dob',
  DL = 'dl',
  PIN = 'pin',
  MEDICARE = 'medicare',
  PASSPORT = 'passport'
}

export enum LSDevices {
  ELE_LSCNSPE = 'Crigler Najjar Syndrome Phototherapy Equipment',
  ELE_LSCPAPR = 'Chronic Positive Airways Pressure Respirator',
  ELE_LSIPDM = 'Intermittent Peritoneal Dialysis Machine',
  ELE_LSKDM = 'Kidney Dialysis Machine',
  ELE_LSOC = 'Oxygen Concentrator',
  ELE_LSVFLS = 'Ventilator For Life Support',
  ELE_OTHER = 'Ele Other',
  GAS_GLSMRHAC = 'Medically Required Heating and/or Air Conditioning',
  GAS_GLSMRHW = 'Medically Required Hot Water',
  GAS_OTHER = 'Gas Other'
}

export enum SelectionType {
  CHECK = 'Check',
  UNCHECK = 'Uncheck'
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

export enum OfferType {
  ENE = 'ENE',
  COR = 'COR',
  PS = 'PS'
}

export const scrollTo = ClientFunction((selector: Selector, offset?: { x: number; y: number }) => {
  const _window = window;
  return new Promise(resolve => {
    const element: any = selector();
    element.scrollIntoView();

    if (offset) {
      _window.scrollBy(offset.x, offset.y);
    }

    resolve();
  });
});

export const setAttribute = ClientFunction((selector, propertyName, propertyValue) => {
  let element = document.querySelector(selector);

  element.setAttribute(propertyName, propertyValue);
});

export const setLocalStorageItem = ClientFunction((prop, value) => {
  localStorage.setItem(prop, value);
});

export const getLocalStorageItem = ClientFunction(prop => {
  return localStorage.getItem(prop);
});

export class testFunction {
  public static async click(t, element) {
    try {
      await this.isElementDisplayed(t, element);
      await t.click(element);
    } catch (error) {
      console.log(error);
      throw Error("Unable to click on the element: " + await element());
    }
  }

  public static async isElementDisplayed(t: any, element: any) {
    try {
      await t.expect((element).exists).ok({timeout: 30000});
    } catch (error) {
      console.log(error);
      throw Error("Unable to find the element: " + await element());
    }
  }

  public static async maximizeWindow(t) {
    await t.maximizeWindow();
  }

  public static async sizeOfElement(t, element) {
    let val = await element.count
      .then(result => result);
    return val;
  }

  public static async scrollToElement(t, element) {
    await this.isElementDisplayed(t, element);
    await t.scrollTo(element);
  }

  public static async assertText(t, element, expectedFieldValue: string) {
    const actualFieldValue: string = await this.getElementText(t, element);
    await t.expect(actualFieldValue).contains(expectedFieldValue);
  }

  public static async assertFalseText(t, element, expectedFieldValue: string) {
    const actualFieldValue: string = await this.getElementText(t, element);
    await t.expect(actualFieldValue).notContains(expectedFieldValue);
  }

  public static async assertTextOnPage(t, text) {
    const actualPageContent = await Selector('html').textContent;
    await t.expect(actualPageContent).contains(text);
  }

  public static async assertTextValue(t, actualText, expectedText) {
    await t.expect(actualText).eql(expectedText);
  }

  public static async assertPartialTextValue(t, actualText, expectedText) {
    await t.expect(actualText).contains(expectedText);
  }

  public static async getPageURL() {
    const getURL = ClientFunction(() => window.location.href);
    const url = await getURL();
    return url;
  }

  public static async getPageURLCheckout() {
    const getURL = ClientFunction(() => window.location.href);
    const url = await getURL().then(result => result)
    return url;
  }

  public static async clearAndEnterText(t, element, value) {
    try {
      await this.isElementDisplayed(t, element);
      await t.typeText(element, value, {replace: true, paste: true});
    } catch (error) {
      console.log(error);
    }
  }

  public static async clearTextField(t, element) {
    await this.isElementDisplayed(t, element);
    await t.click(element).pressKey('ctrl+a delete');
  }

  public static async isElementExists(t, element) {
    let count = await this.sizeOfElement(t, element);
    return count > 0;
  }
  public static async isElementNotExists(t, element) {
    await t.expect(Selector(element).exists).notOk();
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
    await t.click(element.withExactText(value));
  }

  public static isElectricity(fuelType) {
    return fuelType === FUEL_TYPE_OPTIONS.ELE.value || fuelType === FUEL_TYPE_OPTIONS.BOTH.value;
  }

  public static isGas(fuelType) {
    return fuelType === FUEL_TYPE_OPTIONS.GAS.value || fuelType === FUEL_TYPE_OPTIONS.BOTH.value;
  }

  public static waitForLoadingIconToClose() {
    const waitForLoading = ClientFunction(() => {
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
    return waitForLoading;
  }

  public static getElementAttribute(t, element, attribute) {
    return element.getAttribute(attribute);
  }

  public static async navigateTo(t, url) {
    await t.navigateTo(url);
  }

  public static async selectValueFromList(t, element, option) {
    const listItem = element.find('option');
    await t.click(element).click(listItem.withText(option));
  }

  public static generateRandomText(length) {
    let result = '';
    let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    let charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }

  public static async isElementAbsent(t, element) {
    await t.expect((element).exists).notOk();
  }

  public static async waitForLoadingIconToClose_MA(t) {
    const waitForLoading = ClientFunction(() => {
      return new Promise(resolve => {
        const interval = setInterval(() => {
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

  public static async waitForElementToBeInvisible(t, element, value, expectedText) {
    for (let i = 0; i < 10; i++) {
      const strVal = await testFunction.getElementAttribute(t, element, value);
      if (strVal.includes(expectedText)) {
        await t.wait(2000);
      } else {
        break;
      }
    }
  }

  public static async waitForElementPropertyToBeChanged(t, element, value, expectedText?) {
    for (let i = 0; i < 10; i++) {
      if (testFunction.isElementVisible(t, element)) {
        const strVal = await testFunction.getElementAttribute(t, element, value);
        if (strVal.includes(expectedText)) {
          break;
        } else {
          await t.wait(2000);
        }
      }
    }
  }


  public static async waitForElementToBeDisappeared(t, element) {
    if (await this.sizeOfElement(t, element) > 0) {
      await t.expect(element.exists).notOk({timeout: 60000});
    }
  }

  public static async waitForElementToBeAppeared(t, element) {
    let i = 0;
    while ((await this.sizeOfElement(t, element)) === 0) {
      await t.wait(1000);
      i++;
      if (i === 60) {
        break;
      }
    }
  }

  public static async selectDateFromCalendar(t, element) {
    const table = element;
    const tableElement = await element();
    const rowCount = tableElement.childElementCount;
    let dateValue;
    let flag = false;
    for (let i = 0; i < rowCount; i++) {
      const rows = table.child(i);
      const row = await rows();
      const colCount = row.childElementCount;
      for (let j = 1; j < colCount; j++) {
        const cols = rows.child(j);
        const dateBtn = cols.child(0);
        const backgroundColor = await dateBtn.getStyleProperty("background-color").then(result => result);
        if (backgroundColor.includes("rgba(110, 178, 20, 0.45)")) {
          dateValue=await testFunction.getElementText(t,cols);
          await testFunction.click(t, cols);
          flag = true;
          break;
        }
      }
      if (flag) {
        break;
      }
    }
    return dateValue;
  }

  public static async selectDateFromCalendarMoveHome(t, element) {
    await testFunction.waitForElementToBeAppeared(t, element)
    const table = element;
    const tableElement = await element();
    const rowCount = tableElement.childElementCount;
    let dateValue;
    let flag = false;
    for (let i = 0; i < rowCount; i++) {
      const rows = table.child(i);
      const row = await rows();
      const colCount = row.childElementCount;
      for (let j = 1; j < colCount; j++) {
        const cols = rows.child(j);
        const dateBtn = cols.child(0);
        const dateCount = await dateBtn.childElementCount.then(result => result);
        if(dateCount===1) {
          const date=dateBtn.child(0);
          if (!(await date.hasAttribute("disabled"))) {
            dateValue = await testFunction.getElementText(t, cols);
            await testFunction.click(t, cols);
            flag = true;
            break;
          }
        }
      }
      if (flag) {
        break;
      }
    }
    return dateValue;
  }

  public static async takeScreenshot(t, fileName) {
    let UIValidation = this.isValidatingUI();
    if (screenshot === 'Y' && !UIValidation) {
      await t.takeScreenshot({
        path: `../Current/${await fetchBrowser()}/${await screenshotFolder}/` + fileName + `_${await getDateTime()}.png`,
        fullPage: true
      });
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

  public static async getExpectedFeatureCount(dataRow: string[][]) {
    const dataArr = dataRow;
    let numOfExpectedFeatures = 0;
    for (let i = 0; i < dataArr[0].length; i++) {
      if (dataArr[0][i] === "Y") {
        numOfExpectedFeatures++;
      }
    }
    return numOfExpectedFeatures;
  }

  public static getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  public static isResidential(customerType) {
    return customerType === CustomerType.RESIDENTIAL;
  }

  public static isBusiness(customerType) {
    return customerType === CustomerType.BUSINESS;
  }

  public static async compareImages(t, imageName) {
    let isValidate = this.isValidatingUI();
    console.log(`isValidate: ${isValidate}`);
    //-----Performing the visual validations only if 'validate' key is set to 'Y' in config AND the UIValidation tests are running-----//
    if (isValidate && config.visualValidation.validate === 'Y') {
      //-----Capturing current result-----//
      let screenshotPath = `../Current/${await fetchBrowser()}/${await screenshotFolder}/` + imageName + `.png`;
      await t.takeScreenshot({path: screenshotPath, fullPage: true});

      await t.wait(5000);

      let browserName = await fetchBrowser();
      let baseImage = `${config.visualValidation.baseDir}/${browserName}/${screenshotFolder}/${imageName}.png`;
      let currentImage = `${config.visualValidation.currentDir}/${browserName}/${screenshotFolder}/${imageName}.png`;
      let diffImage = `${config.visualValidation.diffDir}/${browserName}/${screenshotFolder}/${imageName}.png`;

      //----Re-baselining the images if 'rebaseline' key is set to 'Y'----//
      if (config.visualValidation.rebaseline === 'Y') {
        fs.copyFileSync(currentImage, baseImage);
        console.log(`${browserName}/${screenshotFolder}/${imageName}.png re-baselined.`);
      } else {
        //-----Comparing the current image (generated in current execution) with it's baselined image-----//
        resemble(currentImage).compareTo(baseImage).onComplete(function (data) {
          //----Diff file will only be generated if there is a mismatch in image comparison----//
          if (data.misMatchPercentage > 0) {
            console.log(`Diff Image: ${diffImage}`);
            console.log(data);
            fs.writeFileSync(diffImage, data.getBuffer());
          }
        });
      }
    }
  }

  /////placeholder method to define output settings for specific page validations
  public static async setResembleOutputSettings(pageName = "default") {
    pageName = pageName.toLowerCase();
    switch (pageName) {
      case "checkoutreview":
        break;
      case "checkoutcomplete":
        break;
      default:
    }
  }

  public static async cleanBaselineImageDir() {
    if (config.visualValidation.rebaseline === 'Y') {
      let rootFolderPath = `${config.visualValidation.baseDir}/${await fetchBrowser()}`;
      if (!fs.existsSync(rootFolderPath)) {
        fs.mkdirSync(rootFolderPath);
      }
      let folderPath = `${config.visualValidation.baseDir}/${await fetchBrowser()}/${screenshotFolder}`;
      if (fs.existsSync(folderPath)) {
        await FileUtils.deleteFiles(folderPath);
      }
      if (!fs.existsSync(folderPath)) {
        fs.mkdirSync(folderPath);
      }
    }
  }

  public static async cleanDiffImageDir() {
    let rootFolderPath = `${config.visualValidation.diffDir}/${await fetchBrowser()}`;
    if (!fs.existsSync(rootFolderPath)) {
      fs.mkdirSync(rootFolderPath);
    }
    let folderPath = `${config.visualValidation.diffDir}/${await fetchBrowser()}/${screenshotFolder}`;
    if (fs.existsSync(folderPath)) {
      await FileUtils.deleteFiles(folderPath);
    }
    if (!fs.existsSync(folderPath)) {
      fs.mkdirSync(folderPath);
    }
  }

  //----The test will fail if there is even a single diff file generated in a scenario----//
  public static async reportUIFailures(t) {
    if (await testFunction.isValidatingUI()) {
      let folderPath = `${config.visualValidation.diffDir}/${await fetchBrowser()}/${screenshotFolder}`;
      fs.readdir(folderPath, function (err, files) {
        testFunction.assertTextValue(t, files.length, 0);
      });
    }
  }

  public static async captureNetworkCall(t: any, endpoint) {
    logger = RequestLogger(config.eaBaseUrl + endpoint, {
      logRequestHeaders: true,
      logRequestBody: true,
      logResponseHeaders: true,
      stringifyResponseBody: false,
      logResponseBody: true
    });
    await t.addRequestHooks(logger);
  }

  public static async captureAnalyticsNetworkCall(t: any) {
    logger = RequestLogger({
      url: /b\/ss/,
      method: 'POST'
    }, {
      logRequestHeaders: true,
      logRequestBody: true,
      stringifyRequestBody: true,
    });
    await t.addRequestHooks(logger);
  }

  public static async validateNetworkCall(t: any) {
    await requestLoggerUtils.unzipLoggerResponses(t, {requestLogger: logger, toJson: true});
    //console.log('\nUnzipped Response taken by the logger:\n', logger.requests[0].response.body);
    return logger.requests[0].response.body;
  }

  public static async validateAnalyticsNetworkCall(t: any) {
    //await requestLoggerUtils.unzipLoggerRequest(t, {requestLogger: logger, toJson: true});
    //console.log('\nUnzipped Response taken by the logger:\n', logger.requests[0].response.body);
    return logger.requests[0].request.body;
  }

  public static isMobile(): boolean {
    return (width < deviceScreenSize.eaMobile.maxWidth);
  }

  public static isTablet(): boolean {
    return (width > deviceScreenSize.eaTablet.minWidth && width < deviceScreenSize.eaTablet.maxWidth);
  }


  public static async isExistingCustomer(customerStatus) {
    return (customerStatus.toLowerCase() === CustomerStatus.EXISTING.toLowerCase());
  }

  public static isValidatingUI() {
    const doc = fs.readFileSync('../package.json', 'utf8');
    let packageJson = JSON.parse(doc);
    return packageJson.config.e2e_tags.toString().includes("@UIValidation");
  }

  public static getCampaignURL(campaign: string): string {
    let campaignPageURL;
    switch (campaign) {
      case "cashrewards":
        campaignPageURL = `${eaHomePage}${campaign}?rewardcode=test&live=disabled`;
        break;
      case "loyalty-boomerang":
        campaignPageURL = `${eaHomePage}${campaign}?rewardcode=test&live=disabled`;
        break;
      case "super-rewards":
        campaignPageURL = `${eaHomePage}${campaign}?rewardcode=test&live=disabled`;
        break;
      case "industryoffer":
        campaignPageURL = `${eaHomePage}/business/${campaign}`;
        break;
      case "business-total-canstarblue":
        campaignPageURL = `${eaHomePage}/business/total-canstarblue`;
        break;
      case "business-carbon-neutral":
        campaignPageURL = `${eaHomePage}/business/carbon-neutral`;
        break;
      case "business-home-page":
        campaignPageURL = `${eaHomePage}/business/electricity-and-gas/small-business/plans`;
        break;
      case "residential-home-page":
        campaignPageURL = `${eaHomePage}/`;
        break;
      default:
        campaignPageURL = `${eaHomePage}${campaign}?live=disabled`;
    }
    return campaignPageURL;
  }

  public static formatAddress(address: String) {
    let formattedAddress;
    if (address.includes("Avenue")) {
      formattedAddress = address.replace("Avenue,", "Ave");
    } else if (address.includes("Road")) {
      formattedAddress = address.replace("Road,", "Rd");
    } else if (address.includes("Street")) {
      formattedAddress = address.replace("Street,", "ST");
    } else if (address.includes("Lane")) {
      formattedAddress = address.replace("Lane,", "LANE");
    } else if (address.includes("Place")) {
      formattedAddress = address.replace("Place,", "PL");
    } else if (address.includes("Drive")) {
      formattedAddress = address.replace("Drive,", "DR");
    } else if (address.includes("Crescent")) {
      formattedAddress = address.replace("Crescent,", "Cres");
    } else if (address.includes("Court")) {
      formattedAddress = address.replace("Court,", "CT");
    }
    return formattedAddress;
  }
}


