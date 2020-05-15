import { moveHouseMethod } from '../methods/moveHouse';
import { When } from 'cucumber';
import {testFunction} from '../../global_methods/helper';

When(/^user enters '(.*)' in address field and selects any available moving date$/, async function (t,[movingAddress]) {
  await moveHouseMethod.enterYourAddress(t,movingAddress);
  await testFunction.takeScreenshot(t,"move_house");
  await moveHouseMethod.selectMovingDate(t);
});
