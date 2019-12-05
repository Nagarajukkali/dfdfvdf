const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaMyAccount={
  pageUrl: config.eaMyAccountUrl,
  elements: {
    tfUsername: Selector("#username"),
    tfPassword: Selector("#password"),
    btnSignIn: Selector("form[name*='loginForm'] button[type*='submit']")
  },
};

module.exports = eaMyAccount;
