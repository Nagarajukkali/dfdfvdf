import {Before, After, Then, Given} from 'cucumber';
const {defineSupportCode}=require('cucumber');
import {testFunction} from '../../global_methods/helper';
import {ClientFunction} from 'testcafe';
let log4js=require('log4js');
const USERAGENT=ClientFunction(() => navigator.userAgent);
let logger=log4js.getLogger();
const eaHomePage=require('../pages/energy-australia-home.page');
logger.level='debug';
import * as _dayjs from "dayjs";
const dayjs = _dayjs;
export const ISO_DATE_FORMAT = "YYYY-MM-DD";
const FIRST_JAN_1900_UNIX_TIMESTAMP = -2208988800000;
let screenshotFolder=null;

Before(  async t => {
  await testFunction.maximizeWindow(t);
});

Given(/^user has opened the website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  await t.navigateTo(eaHomePage.pageUrl);
});

After( async t => {
  let format;
  await t.takeScreenshot(`../${await fetchBrowser()}/${await screenshotFolder}/${await this.getDateTime()}.png`);
  logger.debug('Execution completed');
});

async function fetchBrowser() {
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
async function getDateTime(unixTimestampMilliseconds: number, format = ISO_DATE_FORMAT) {
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
}


