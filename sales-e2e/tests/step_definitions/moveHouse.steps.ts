import { moveHouseMethod } from '../methods/moveHouse';
import { When } from 'cucumber';

When(/^user enters '(.*)' in address field and selects any available moving date$/, async function (t,[movingAddress]) {
  await moveHouseMethod.enterYourAddress(t,movingAddress);
  await moveHouseMethod.selectMovingDate(t);
});
