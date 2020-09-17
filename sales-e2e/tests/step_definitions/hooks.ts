import {Before, After, Then, Given} from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {ClientFunction} from 'testcafe';
import {FileUtils} from '../../libs/FileUtils'
import * as fs from 'fs';
let log4js=require('log4js');
const USERAGENT=ClientFunction(() => navigator.userAgent);
let logger=log4js.getLogger();
const eaHomePage=require('../pages/energy-australia-home.page');
logger.level='debug';
export let screenshotFolder=null;
export let getTestCafeRC=null;
export let height=null;
export let width=null;

Before(  async t => {
  await testFunction.maximizeWindow(t);
  const doc = fs.readFileSync('.testcaferc.json','utf8');
  getTestCafeRC = JSON.parse(doc);
  logger.info(`  Test: ${t.testRun.test.name}`);
});

Given(/^user has opened the website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Current/" + await fetchBrowser() + "/" + screenshotFolder;
  await FileUtils.deleteFiles(screenshotFolderPath);
  await testFunction.cleanBaselineImageDir();
  await testFunction.cleanDiffImageDir();
  await t.navigateTo(eaHomePage.pageUrl);
  height = await ClientFunction(()=>window.innerHeight)();
  width = await ClientFunction(()=>window.innerWidth)();
});

Given(/^user has opened the bill uploader website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Current/" + await fetchBrowser() + "/" + screenshotFolder;
  await FileUtils.deleteFiles(screenshotFolderPath);
  await testFunction.cleanBaselineImageDir();
  await testFunction.cleanDiffImageDir();
  await t.navigateTo(eaHomePage.billUploaderUrl);
  height = await ClientFunction(()=>window.innerHeight)();
  width = await ClientFunction(()=>window.innerWidth)();
});

Given(/^user has opened the new connection website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Current/" + await fetchBrowser() + "/" + screenshotFolder;
  await FileUtils.deleteFiles(screenshotFolderPath);
  await testFunction.cleanBaselineImageDir();
  await testFunction.cleanDiffImageDir();
  await t.navigateTo(eaHomePage.newConnectionPageUrl);
  height = await ClientFunction(()=>window.innerHeight)();
  width = await ClientFunction(()=>window.innerWidth)();
});

Given(/^user has opened the '(.*)' link in a browser and creates '(.*)' to save evidences$/, async function (t,[campaign,folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Current/" + await fetchBrowser() + "/" + screenshotFolder;
  await FileUtils.deleteFiles(screenshotFolderPath);
  await testFunction.cleanBaselineImageDir();
  await testFunction.cleanDiffImageDir();
  switch (campaign) {
    case "offer":
      await t.navigateTo(eaHomePage.campaignPageUrl+"offer?live=disabled");
      break;
    case "elec-tpp":
      await t.navigateTo(eaHomePage.campaignPageUrl+"elec-tpp?live=disabled");
      break;
    case "gas-tpp":
      await t.navigateTo(eaHomePage.campaignPageUrl+"gas-tpp?live=disabled");
      break;
    case "elec-tp":
      await t.navigateTo(eaHomePage.campaignPageUrl+"elec-tp?live=disabled");
      break;
    case "gas-tp":
      await t.navigateTo(eaHomePage.campaignPageUrl+"gas-tp?live=disabled");
      break;
    case "total":
      await t.navigateTo(eaHomePage.campaignPageUrl+"total?live=disabled");
      break;
    case "total-plan-plus":
      await t.navigateTo(eaHomePage.campaignPageUrl+"total-plan-plus?live=disabled");
      break;
    case "comeback":
      await t.navigateTo(eaHomePage.campaignPageUrl+"comeback?live=disabled");
      break;
    case "eacorporateOffer":
      await t.navigateTo(eaHomePage.campaignPageUrl+"eacorporateoffer?live=disabled");
      break;
    case "familyandfriends":
      await t.navigateTo(eaHomePage.campaignPageUrl+"familyandfriends?live=disabled");
      break;
    case "amic":
      await t.navigateTo(eaHomePage.campaignPageUrl+"amic?live=disabled");
      break;
    case "ticketek":
      await t.navigateTo(eaHomePage.campaignPageUrl+"ticketek?live=disabled");
      break;
    case "geelong":
      await t.navigateTo(eaHomePage.campaignPageUrl+"geelong?live=disabled");
      break;
    case "fiftyupclub":
      await t.navigateTo(eaHomePage.campaignPageUrl+"fiftyupclub?live=disabled");
      break;
    case "basic-home":
      await t.navigateTo(eaHomePage.campaignPageUrl+"basic-home?live=disabled");
      break;
    case "nofrills-canstarblue":
      await t.navigateTo(eaHomePage.campaignPageUrl+"nofrills-canstarblue?live=disabled");
      break;
    case "nofrills-finder":
      await t.navigateTo(eaHomePage.campaignPageUrl+"nofrills-finder?live=disabled");
      break;
    case "movehouse":
      await t.navigateTo(eaHomePage.campaignPageUrl+"movehouse?live=disabled");
      break;
    case "nofrills":
      await t.navigateTo(eaHomePage.campaignPageUrl+"nofrills?live=disabled");
      break;
    case "offer-finder":
      await t.navigateTo(eaHomePage.campaignPageUrl+"offer-finder?live=disabled");
      break;
    case "offer-canstarblue":
      await t.navigateTo(eaHomePage.campaignPageUrl+"offer-canstarblue?live=disabled");
      break;
    case "basichome-finder":
      await t.navigateTo(eaHomePage.campaignPageUrl+"basichome-finder?live=disabled");
      break;
    case "basichome-canstarblue":
      await t.navigateTo(eaHomePage.campaignPageUrl+"basichome-canstarblue?live=disabled");
      break;
    case "bizreferral":
      await t.navigateTo(eaHomePage.campaignPageUrl+"bizreferral?live=disabled");
      break;
    case "business-energy":
      await t.navigateTo(eaHomePage.campaignPageUrl+"business-energy?live=disabled");
      break;
    case "business-total-canstarblue":
      await t.navigateTo(eaHomePage.campaignPageUrl+"business/total-canstarblue?live=disabled");
      break;
    case "pga":
      await t.navigateTo(eaHomePage.campaignPageUrl+"pga?live=disabled");
      break;
    case "biztpp":
      await t.navigateTo(eaHomePage.campaignPageUrl+"biztpp?live=disabled");
      break;
    case "fca":
      await t.navigateTo(eaHomePage.campaignPageUrl+"fca?live=disabled");
      break;
    case "cashrewards":
      await t.navigateTo(eaHomePage.campaignPageUrl+"cashrewards?rewardcode=test?live=disabled");
      break;
    case "nsw-seniors":
      await t.navigateTo(eaHomePage.campaignPageUrl+"nsw-seniors?live=disabled");
      break;
    case "business-industryoffer":
      await t.navigateTo(eaHomePage.campaignPageUrl+"business/industryoffer?live=disabled");
      break;
    default:
      console.error("Invalid campaign type.");
  }

});

After( async t => {
  await testFunction.reportUIFailures(t);
  let format;
  await t.takeScreenshot({path:`../Current/${await fetchBrowser()}/${await screenshotFolder}/${await getDateTime()}.png`,fullPage:true});
  logger.info(`  Execution Completed: ${t.testRun.test.name}`);
});

export async function fetchBrowser() {
  const useragent=await USERAGENT().then(result => result);
  let browser;
    if (useragent.indexOf("Firefox") > -1) {
      browser="Firefox";
    } else if (useragent.indexOf("Trident") > -1) {
      browser="Internet Explorer";
    } else if (useragent.indexOf("Chrome") > -1) {
      browser="Chrome";
    } else if (useragent.indexOf("Safari") > -1) {
      browser="Safari";
    } else {
      browser="unknown";
    }
    return browser;
}
/*async function getDateTime(unixTimestampMilliseconds: number, format = ISO_DATE_FORMAT) {
    let formattedDate: string;
    if (!unixTimestampMilliseconds || unixTimestampMilliseconds < FIRST_JAN_1900_UNIX_TIMESTAMP) {
      const error = `Invalid unix timestamp: ${unixTimestampMilliseconds}`;
      this.log.debug(error);
      throw Error(error);
    }
    try {
      formattedDate = dayjs(unixTimestampMilliseconds).format(format);
    } catch (error) {
      this.log.debug(error);
      throw Error(error);
    }
    return formattedDate;
}*/
export async function getDateTime() {
  let now = new Date();
  let year = now.getFullYear();
  let month = String(now.getMonth() + 1);
  let day = String(now.getDate());
  let hour = String(now.getHours());
  let minute = String(now.getMinutes());
  let second = String(now.getSeconds());
  if (month.length === 1) {
    month = `0${month}`;
  }
  if (day.length === 1) {
    day = `0${day}`;
  }
  if (hour.length === 1) {
    hour = `0${hour}`;
  }
  if (minute.length === 1) {
    minute = `0${minute}`;
  }
  if (second.length === 1) {
    second = `0${second}`;
  }
  return `${year}_${month}_${day}_${hour}_${minute}_${second}`;
}
