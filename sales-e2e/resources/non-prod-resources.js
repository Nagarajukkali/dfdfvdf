module.exports = {
config: {
    env: 'non-prod',
    eaHomePageUrl: 'https://mocha.nonprod.digital.energyaustralia.com.au',
  },
  testData: {
    mastercard: {
      cardNumber: '5123456789012346',
      nameOnCard: 'Test Name One',
      cvv: '299',
    },
    visa: {
      cardNumber: '4987654321098769',
      nameOnCard: 'Test TWO ',
      cvv: '5893',
    },
    amex: {
      cardNumber: '345678901234564',
      nameOnCard: 'Test three',
      cvv: '888',
    },
    smsParameters: {
      accountNumber: '5517 4771 75',
      amount: '123',
    },
    emailAddress: 'Prasanya.gopinathan@energyaustralia.com.au',
    accountNumber: '5396750000',
  },
};
