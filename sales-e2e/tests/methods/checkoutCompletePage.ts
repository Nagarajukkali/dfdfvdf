const eaCheckoutCompletePage = require('../pages/checkoutComplete.page')
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutCompletePage() {
  async function verifyWelcomePackMessage(t,customer) {
    switch (customer) {
      case 'Existing':
        console.log('Existing customer');
        break;
      case 'New':
        console.log('New customer');
        break;
      default:
      //ReusableComponents.errorOutAndStopExecution();
    }
  }
  return{
    verifyWelcomePackMessage,
  };
}
