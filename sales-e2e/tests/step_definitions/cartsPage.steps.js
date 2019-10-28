import { cartsPageFunction } from '../methods/cartsPage';
const { When } = require('cucumber');

When(/^user moves on to fill the qualifier$/, async t =>{
    await cartsPageFunction().clickContinueCartsPage(t);
  });




