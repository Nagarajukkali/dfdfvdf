const cartsPage=require('../pages/carts.page');
import {testFunction } from '../../global_methods/helper';

export class cartsMethod {
    public static async clickContinueCartsPage(t) {
        await testFunction.click(t, cartsPage.elements.cartsPageContinueButton);
    }
}
