const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const eaQualifierPage = {
  elements: {
    newCustomerBtn:Selector('#isNewEA0 label'),
    existingCustomerBtn:Selector('#isNewEA1 label'),
    nonMoving: Selector('#moveHouse1'),
    moving: Selector('#moveHouse0'),
    serviceAddress:Selector('#address-auto'),
    serviceAddressList:Selector('#address-auto+ ul>li a'),
    calendarTable:Selector('#switchDate table.datepicker-day-grid tbody').nth(1),
    
  },
};

module.exports = eaQualifierPage;