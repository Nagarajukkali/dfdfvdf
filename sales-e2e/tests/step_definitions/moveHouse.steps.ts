import {moveHouseMethod} from '../methods/moveHouse';
import {Then, When} from 'cucumber';
import {testFunction} from '../../global_methods/helper';

When(/^user enters '(.*)' in address field and selects any available moving date$/, async function (t, [movingAddress]) {
  await moveHouseMethod.enterYourAddress(t, movingAddress);
  await testFunction.takeScreenshot(t, "move_house");//disabled UI Validation
  await t.wait(3000)
  await moveHouseMethod.selectMovingDate(t);
});

When(/^user enters '(.*)' in address field$/, async function (t, [movingAddress]) {
  await moveHouseMethod.enterYourAddress(t, movingAddress);
  await testFunction.takeScreenshot(t, "move_house");//disabled UI Validation
});

When(/^user waits for few seconds$/, async function (t, [time]) {
  await t.wait(3000);
});

Then(/^error message is displayed for missing solar tariff in MSATS$/, async function (t) {
  await moveHouseMethod.validateSolarSetupUnknownError(t);
});
When(/^user selects moving date$/, async function (t) {
  await moveHouseMethod.selectMovingDate(t);
});
Then(/^error message is displayed for undetected NMI in MSATS$/, async function (t) {
  await moveHouseMethod.validateSolarSetupUnknownErrorForUndetectedNMI(t);
});
//When(/^user enters '(.*)' in address field$/, async function (t, [movingAddress]) {
 // await moveHouseMethod.enterYourAddress(t, movingAddress);
  //await testFunction.takeScreenshot(t, "move_house");
//});
