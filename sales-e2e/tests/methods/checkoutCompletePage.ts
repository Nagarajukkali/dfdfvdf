import {CustomerStatus} from '../../global_methods/helper';

export class checkoutCompleteMethod {
  public static async verifyWelcomePackMessage(t,customer) {
    switch (customer) {
      case CustomerStatus.EXISTING:
        console.log('Existing customer');
        break;
      case CustomerStatus.NEW:
        console.log('New customer');
        break;
      default:
        console.error('Please select a valid customer');
    }
  }
}
