import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {testFunction} from '../../global_methods/helper';

When(/^user moves on to fill the qualifier$/, async function(t) {
    await testFunction.takeScreenshot(t,"cart_page");
    await cartsMethod.clickContinueCartsPage(t);
  });




