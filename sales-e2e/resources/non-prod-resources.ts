module.exports={
config: {
    env: 'non-prod',
    eaHomePageUrl: 'https://preprod.nonprod.digital.energyaustralia.com.au?live=disabled',
    eaNewConnectionPageUrl:'https://preprod.nonprod.digital.energyaustralia.com.au/new-connections-ui/#/connection',
    eaCampaignUrl: 'https://preprod.nonprod.digital.energyaustralia.com.au/offer?live=disabled',
    eaMyAccountUrl: 'https://preprod.nonprod.digital.energyaustralia.com.au/myaccount/index.html',
    qt2ReportingURL:'https://preprod.nonprod.digital.energyaustralia.com.au/qt2reporting/login',
    qt2ReportingHomePageURL:'https://preprod.nonprod.digital.energyaustralia.com.au/qt2reporting/app/reporting'
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
    emailAddress: 'Prateek.Chauhan@energyaustralia.com.au',
    accountNumber: '5396750000',
  },
};
