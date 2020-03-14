import {Selector } from 'testcafe';

const eaCheckoutCompletePage={
  elements: {
    lblWelcomeText: Selector("[id*='WelText']"),
    lblWhatHappensNowText:Selector(".whats-next h1"),
    lifeSupportSubmitDisclaimer: Selector("#life-support-submit-disclaimer"),
    linkDownloadForm: Selector("#life-support-submit-disclaimer a[href*='.pdf']"),
    elecLifeSupport: Selector("#record-ele-life-support"),
    iconElecLifeSupport: Selector("#ea-life-support-electricity-icon"),
    lblElecLifeSupport: Selector("#record-ele-life-support-fuel-text"),
    gasLifeSupport: Selector("#record-gas-life-support"),
    iconGasLifeSupport: Selector("#ea-life-support-gas-icon"),
    lblGasLifeSupport: Selector("#record-gas-life-support-fuel-text"),
    lblElecLifeSupportStatus: Selector("#record-ele-life-support-status-text"),
    lblGasLifeSupportStatus: Selector("#record-gas-life-support-status-text"),
    listElecDevices: Selector("#record-ele-life-support-devices"),
    listGasDevices: Selector("#record-gas-life-support-devices")
  }
}

module.exports=eaCheckoutCompletePage;
