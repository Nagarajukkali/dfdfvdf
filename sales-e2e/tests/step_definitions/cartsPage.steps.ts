import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {fetchBrowser, getDateTime, screenshotFolder} from './hooks';

When(/^user moves on to fill the qualifier$/, async function(t) {
  await t.takeScreenshot(`../${await fetchBrowser()}/${await screenshotFolder}/cart_page_${await getDateTime()}.png`);
    await cartsMethod.clickContinueCartsPage(t);
  });




