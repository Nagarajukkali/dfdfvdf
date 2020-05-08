import {Before, After, Then, Given} from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {ClientFunction} from 'testcafe';
const fileUtils=require('../../libs/FileUtils.js');
let log4js=require('log4js');
const USERAGENT=ClientFunction(() => navigator.userAgent);
let logger=log4js.getLogger();
const fs = require('fs');
const path = require('path');
const eaHomePage=require('../pages/energy-australia-home.page');
logger.level='debug';
export let screenshotFolder=null;

Before(  async t => {
  await testFunction.maximizeWindow(t);
});

Given(/^user has opened the website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Chrome/"+screenshotFolder;
  fileUtils.deleteFiles(screenshotFolderPath);
  await t.navigateTo(eaHomePage.pageUrl);
});



Given(/^user has opened the new connection website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Chrome/"+screenshotFolder;
  fileUtils.deleteFiles(screenshotFolderPath);
  await t.navigateTo(eaHomePage.newConnectionPageUrl);

});

Given(/^user has opened the '(.*)' link in a browser and creates '(.*)' to save evidences$/, async function (t,[campaign,folderName]) {
  screenshotFolder=folderName;
  let screenshotFolderPath="screenshots/Chrome/"+screenshotFolder;
  fileUtils.deleteFiles(screenshotFolderPath);
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
    default:
      console.error("Invalid campaign type.");
  }

});

After( async t => {
  let format;
  await t.takeScreenshot({path:`../${await fetchBrowser()}/${await screenshotFolder}/${await getDateTime()}.png`,fullPage:true});
  logger.debug('Execution completed');
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
