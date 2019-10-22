module.exports = {
  config: {
    env: 'local',
    clickToPayWebsiteUrl: 'https://localhost:4302/click-to-pay',
    clickToPaySMSUrl: 'https://localhost:4302/click-to-pay?Ref1=1618033988&Amount=123',
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
      accountNumber: '7167 7840 78',
      amount: '123',
    },
    emailAddress: 'Prasanya.gopinathan@energyaustralia.com.au',
    accountNumber: '9123456789',
  },
};

