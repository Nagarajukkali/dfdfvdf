import {Before, After, Then, Given} from 'cucumber';
const {defineSupportCode}=require('cucumber');
import {testFunction} from '../../global_methods/helper';
import {ClientFunction} from 'testcafe';
let log4js=require('log4js');
const USERAGENT=ClientFunction(() => navigator.userAgent);
let logger=log4js.getLogger();
const eaHomePage=require('../pages/energy-australia-home.page');
logger.level='debug';
let screenshotFolder=null;

Before(  async t => {
  await testFunction.maximizeWindow(t);
});

Given(/^user has opened the website link in a browser and creates '(.*)' to save evidences$/, async function(t, [folderName]) {
  screenshotFolder=folderName;
  await t.navigateTo(eaHomePage.pageUrl);
});

After( async t => {
  await t.takeScreenshot(`../${await fetchBrowser()}/${await screenshotFolder}/${await getDateTime()}.png`);
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
async function getDateTime() {
  let now    =new Date();
  let year   =now.getFullYear();
  let month: string=String(now.getMonth() + 1);
  let day: string=String(now.getDate());
  let hour: string=String(now.getHours());
  let minute: string=String(now.getMinutes());
  let second: string=String(now.getSeconds());
  if(month.toString().length ==1) {
    month='0'+month;
  }
  if(day.toString().length ==1) {
    day='0'+day;
  }
  if(hour.toString().length ==1) {
    hour='0'+hour;
  }
  if(minute.toString().length ==1) {
    minute='0'+minute;
  }
  if(second.toString().length ==1) {
    second='0'+second;
  }
  let dateTime=year+'_'+month+'_'+day+'_'+hour+'_'+minute+'_'+second;
  return dateTime;
}


