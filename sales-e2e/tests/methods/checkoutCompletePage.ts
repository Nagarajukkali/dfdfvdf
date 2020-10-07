import { testFunction} from '../../global_methods/helper';
const eaCheckoutCompletePage = require('../pages/checkoutComplete.page');
const eaCheckoutDetailsPage = require('../pages/checkOutDetails.page');

export class checkoutCompleteMethod {
  public static async verifyWelcomePackMessage(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.lblWhatHappensNowText);
  }

  public static async downloadPDF(t){
    await testFunction.click(t,eaCheckoutCompletePage.elements.btnDownloadPDF);
  }

  public static  async verifyApplicationDeclineMsg(t){
    let actualApplicationDeclineMsg=await testFunction.getElementText(t,eaCheckoutCompletePage.elements.applicationDeclineText);
    let expectedApplicationDeclineMsg="Your application has been declined";
    await testFunction.assertTextValue(t,actualApplicationDeclineMsg,expectedApplicationDeclineMsg);
  }

  public static async validateProgressbarAndSubheading(t, sourceSystem, journey, customerType, newOrExisting) {
    customerType = customerType.toUpperCase();
    sourceSystem = sourceSystem.toLowerCase();
    journey = journey.toLowerCase();
    newOrExisting = newOrExisting.toLowerCase();

    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.progressBar.main);
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.progressBar.completedIndicator);
    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.txtSubheading);
    if(newOrExisting !== "new") {
      await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, "Thanks");
    }

    if(await testFunction.isResidential(customerType)) {
      if(journey === "move home") {
        await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, ", we’re moving with you.");
      }else if(sourceSystem === "my account") {
        switch (journey) {
          case "plan switch" || "best offer":
            await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, ", your plan has been changed!");
            break;
          case "upsell":
            await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, ", your plan is being set up!");
            break;
          default:
            throw Error("Unhandled/Invalid journey");
        }
      } else if((newOrExisting === "new" && journey !== "move home") || journey === "new connection") {
          await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, "Welcome to EnergyAustralia, ");
      }
    }else if(await testFunction.isBusiness(customerType)) {
      if(newOrExisting === "new") {
        await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, "and welcome to EnergyAustralia");
      } else {
        switch (journey) {
          case "plan switch" || "best offer":
            await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, "has a new plan!");
            break;
          case "move home":
            await testFunction.assertText(t, eaCheckoutDetailsPage.elements.txtSubheading, ", we’re moving with ");
        }
      }
    } else {
      throw Error("Invalid customer type");
    }
    console.log("Progress bar And Subheading validation completed on checkout complete page.");
  }

  public static async validateApplicationAcceptedSection(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.applicationAccepted);
    console.log("Validation completed for application accepted section on checkout complete page.");
  }

  public static async validateSelectedPlanSection(t, fuelType) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.selectedPlan.main);
    await testFunction.assertText(t, eaCheckoutCompletePage.elements.selectedPlan.heading, "Your new plan");
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.selectedPlan.ele);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.selectedPlan.gas);
    }
    console.log("Validation completed for selected plan section on checkout complete page.");
  }

  public static async validateDownloadPDFSection(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.downloadPDF.main);
    await testFunction.assertText(t, eaCheckoutCompletePage.elements.downloadPDF.description, "To get the details of your plan, download the pdf here:");
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.downloadPDF.btnDownload);
    await testFunction.assertText(t, eaCheckoutCompletePage.elements.downloadPDF.btnDownload, "Download PDF");
    console.log("Validation completed for download PDF section on checkout complete page.");
  }

  public static async validateFeedbackForm(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.feedbackForm);
    console.log("Validation completed for the presence of feedback form.");
  }

  public static async validateIntroducingMABanner(t, sourceSystem) {
    sourceSystem = sourceSystem.toLowerCase();
    if(sourceSystem === "my account") {
      await testFunction.isElementAbsent(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.main);
    } else {
      await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.main);
      await testFunction.assertText(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.heading, "Introducing My Account");
      await testFunction.assertText(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.description, "Manage your energy accounts in one secure place.");
      let numOfFeatures = await testFunction.sizeOfElement(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.features);
      await t.expect(numOfFeatures).eql(3);
      await testFunction.assertText(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.feature1, "View and pay bills");
      await testFunction.assertText(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.feature2, "Manage your account details");
      await testFunction.assertText(t, eaCheckoutCompletePage.elements.bannerIntroducingMA.feature3, "Monitor your usage");
    }
    console.log("Validation completed for introducing my account banner.");
  }

  public static async validateNavigationButton(t, sourceSystem) {
    sourceSystem = sourceSystem.toLowerCase();
    let expectedText;
    if(sourceSystem === "my account") {
      expectedText = "Go to overview";
    }else {
      expectedText = "Back to home";
    }
    await testFunction.assertText(t, eaCheckoutCompletePage.elements.btnNavigation, expectedText);
    console.log("Validation completed for 'Go to' button on checkout complete page.");
  }
}
