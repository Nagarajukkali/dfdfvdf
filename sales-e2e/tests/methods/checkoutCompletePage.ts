const eaCheckoutCompletePage = require('../pages/checkoutComplete.page')
import {CustomerStatus,testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutCompletePage() {
  async function verifyWelcomePackMessage(t,customer) {
    switch (customer) {
      case CustomerStatus.EXISTING:
        console.log('Existing customer');
        break;
      case CustomerStatus.NEW:
        console.log('New customer');
        break;
      default:
        console.log('Please select a valid customer');
    }
  }
  return{
    verifyWelcomePackMessage,
  };
}
