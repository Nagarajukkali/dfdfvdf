import {Selector } from 'testcafe';

const eaCheckoutCompletePage={
  elements: {
    lblWelcomeText: Selector("[id*='WelText']"),
    lblWhatHappensNowText:Selector(".whats-next h3"),
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
    listGasDevices: Selector("#record-gas-life-support-devices"),
    btnDownloadPDF:Selector("#pdfDownload"),
    resiNewWelText:Selector("#resiNewCusWelText"),
    applicationDeclineText:Selector(".rtca-declined-container h1"),
    applicationDeclineDisclaimer:Selector(".rtca-declined-container p"),
    progressBar: {
      main: Selector("#handshakeapp .checkout-progress-bar"),
      completedIndicator: Selector("#handshakeapp .checkout-progress-bar .completed"),
    },
    applicationAccepted: Selector("#handshakeapp .application-accepted"),
    selectedPlan: {
      main: Selector("#handshakeapp .selected-plan"),
      heading: Selector("#handshakeapp .selected-plan h3"),
      gas: Selector("#handshakeapp .selected-plan .gas"),
      ele: Selector("#handshakeapp .selected-plan .electricity")
    },
    downloadPDF: {
      main: Selector("#handshakeapp .call-to-action"),
      description: Selector("#handshakeapp .call-to-action h3"),
      btnDownload: Selector("#pdfDownload")
    },
    feedbackForm: Selector("#customer-feedback"),
    bannerIntroducingMA: {
      main: Selector("#handshakeapp .hs-my-account-banner"),
      heading: Selector("#handshakeapp .hs-my-account-banner h3"),
      description: Selector("#handshakeapp .hs-my-account-banner p"),
      features: Selector("li.hs-my-account-banner__feature"),
      feature1: Selector("li.hs-my-account-banner__feature").nth(0),
      feature2: Selector("li.hs-my-account-banner__feature").nth(1),
      feature3: Selector("li.hs-my-account-banner__feature").nth(2),
    },
    btnNavigation: Selector(".confirmation__navigation a"),
    powerResponseSection:Selector("section.power-response-rewards"),
    btnBackToHome:Selector("#complete-home-link"),
    iconHomePage:Selector("span.icon-GasElectricity"),
  }
}

module.exports=eaCheckoutCompletePage;
