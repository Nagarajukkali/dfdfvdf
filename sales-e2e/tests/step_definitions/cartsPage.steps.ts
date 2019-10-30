import { cartsPageFunction } from '../methods/cartsPage';
import { When } from 'cucumber';

When(/^user moves on to fill the qualifier$/, async t =>{
    await cartsPageFunction().clickContinueCartsPage(t);
  });




