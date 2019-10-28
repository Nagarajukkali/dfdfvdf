import { qualifierPageFunction } from '../methods/qualifierPage';
const { When, Then } = require('cucumber');

When(/^user moves on to fill the qualifier$/, async t =>{
    await qualifierPageFunction().clickContinueCartsPage(t);
  });




