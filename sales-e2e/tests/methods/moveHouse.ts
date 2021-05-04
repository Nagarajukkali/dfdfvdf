const moveHouse = require('../pages/moveHouse.page');
import {testFunction} from '../../global_methods/helper';

export class moveHouseMethod {
  public static async enterYourAddress(t, address) {
    await testFunction.click(t, moveHouse.elements.linkExistingCustomer);
    await testFunction.click(t, moveHouse.elements.btnEnterYourNewAddress);
    await testFunction.clearAndEnterText(t, moveHouse.elements.txtAddress, address);
    await testFunction.isElementVisible(t, moveHouse.elements.listOfAddresses);
    await testFunction.clickElementFromList(t, moveHouse.elements.listOfAddresses, address);
    await testFunction.waitForLoadingIconToClose();
    await testFunction.waitForElementToBeInvisible(t, moveHouse.elements.btnSelectMoveDate, `value`, "Please wait");
  }

  public static async selectMovingDate(t) {
    await testFunction.click(t, moveHouse.elements.btnSelectMoveDate);
    await testFunction.selectDateFromCalendar(t, moveHouse.elements.tableCalendar);
    await testFunction.takeScreenshot(t, "move_house");//disabled UI Validation
    await testFunction.click(t, moveHouse.elements.btnMoving);
  }

  public static async validateSolarSetupUnknownError(t) {
    let expectedSolarSetUpUnknownErrorText = "We have detected an issue with the electricity meter at this address. Please contact us so one of our customer support agents can solve this error.";
    await testFunction.isElementDisplayed(t, moveHouse.elements.solarSetUpUnknownError);
    await testFunction.assertText(t, moveHouse.elements.solarSetUpUnknownError, expectedSolarSetUpUnknownErrorText);
    await testFunction.click(t, moveHouse.elements.solarSetUpUnknownError.find("a"));
    const url = await testFunction.getPageURL();
    await t.expect(url).contains("contact-us");
    await t.closeWindow();
  }

  public static async validateSolarSetupUnknownErrorForUndetectedNMI(t) {
    let expectedSolarSetupUnknownErrorForUndetectedNMI = "We could not determine if there is solar at this address. If there is no solar power please continue.";
    let expectedContactUsTextForUndetectedNMI = "If you do have solar power set up at this address please contact us so we can add it to your quote.";
    await testFunction.isElementDisplayed(t, moveHouse.elements.solarSetUpUnknownErrorForUndetectedNMI);
    await testFunction.assertText(t, moveHouse.elements.solarSetUpUnknownErrorForUndetectedNMI, expectedSolarSetupUnknownErrorForUndetectedNMI);
    await testFunction.assertText(t, moveHouse.elements.contactUsTextForUndetectedNMI, expectedContactUsTextForUndetectedNMI);
    await testFunction.click(t, moveHouse.elements.contactUsTextForUndetectedNMI.find("a"));
    const url = await testFunction.getPageURL();
    await t.expect(url).contains("contact-us");
    await t.closeWindow();
  }

}
