const cartsPage = require('../pages/carts.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function cartsPageFunction() {
    async function clickContinueCartsPage(t) {
        await helper.click(t, cartsPage.elements.cartsPageContinueButton);
    }
    return {
        clickContinueCartsPage,
      };
}
