module.exports={
config: {
    eaBaseUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au`,
    eaHomePageUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au?live=disabled`,
    eaNewConnectionPageUrl:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/new-connections-ui/#/connection`,
    eaCampaignUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/`,
    eaMyAccountUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/myaccount/index.html`,
    eaBillUploaderUrl:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/home/electricity-and-gas/compare-electricity-and-gas-plans/upload-your-electricity-bill`,
    qt2ReportingURL:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/qt2reporting/login`,
    qt2ReportingHomePageURL:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/qt2reporting/app/reporting`,
    screenshot:'N',
    qt2ReportingCreds:{
      username:'abhar',
      password:'U2FsdGVkX1+ofbMmTfeufCoLeZbhDgsePj0GzAmmyv0='
    },
    ghostingUserCreds:{
      username:'eacsr@ea.com',
      password:'U2FsdGVkX19Rn/USOSqPpn1FTbs5vPvAFXa3NDuh2sA='
  }
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
