module.exports={
config: {
    env: 'non-prod',
    eaHomePageUrl: 'https://espresso.nonprod.digital.energyaustralia.com.au?live=disabled',
    eaNewConnectionPageUrl:'https://espresso.nonprod.digital.energyaustralia.com.au/new-connections-ui/#/connection',
    eaCampaignUrl: 'https://espresso.nonprod.digital.energyaustralia.com.au/',
    eaMyAccountUrl: 'https://espresso.nonprod.digital.energyaustralia.com.au/myaccount/index.html',
    eaBillUploaderUrl:'https://espresso.nonprod.digital.energyaustralia.com.au/home/electricity-and-gas/compare-electricity-and-gas-plans/upload-your-electricity-bill',
    qt2ReportingURL:'https://espresso.nonprod.digital.energyaustralia.com.au/qt2reporting/login',
    qt2ReportingHomePageURL:'https://espresso.nonprod.digital.energyaustralia.com.au/qt2reporting/app/reporting',
    screenshot:'N'
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
