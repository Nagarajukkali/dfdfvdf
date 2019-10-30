import {Selector } from 'testcafe';

const eaCheckoutDetailsPage = {
  elements: {
    titleDropdown:Selector('#title sui-select>div'),
    titleDrop:Selector('#title div.sui-select>span'),
    titleTag:Selector('div[title*=\'Please select\'] sui-option').nth(0),
    firstName:Selector('#firstname'),
    lastName:Selector('#lastname')
  },
};

module.exports = eaCheckoutDetailsPage;