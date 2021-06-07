module.exports = {
  config: {
    eaBaseUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au`,
    eaHomePageUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au?live=disabled`,
    eaHomePageABTest: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/home/electricity-and-gas/plans?test=dbopt-567`,
    eaHomePageBusinessABTest: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/business/electricity-and-gas/small-business/plans?test=dbopt-567`,
    eaNewConnectionPageUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/new-connections-ui/#/connection`,
    eaCampaignUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/`,
    eaMyAccountUrl: `https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/myaccount/index.html`,
    eaBillUploaderUrl:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/home/electricity-and-gas/compare-electricity-and-gas-plans/upload-your-electricity-bill`,
    qt2ReportingURL:`https://${process.env.npm_package_config_env}-staff.nonprod.digital.energyaustralia.com.au/qt2reporting/login`,
    qt2ReportingHomePageURL:`https://${process.env.npm_package_config_env}-staff.nonprod.digital.energyaustralia.com.au/qt2reporting/app/reporting`,
    savedQuoteURL:`https://${process.env.npm_package_config_env}.nonprod.digital.energyaustralia.com.au/checkout?r=891a9711-c203-46e5-80dd-5b06ffd85706&customerType=RES&exdat=e30%3D#/mydetails`,
    screenshot:'N',
    interceptNetworkRequest:'N',
    qt2ReportingToExcludeInEnvs:'chai,decaf,espresso',
    validateAnalytics:'N',
    visualValidation: {
      rebaseline: 'N',
      validate: 'N',
      baseDir: 'screenshots/Base',
      diffDir: 'screenshots/Diff',
      currentDir: 'screenshots/Current',
    },
    qt2ReportingCreds: {
      username: 'aparid',
      password: 'U2FsdGVkX19rUdxjOUEWGYeras0MT+iVvpY6aktiTR0='
    },
    ghostingUserCreds: {
      username: 'eacsr@ea.com',
      password: 'U2FsdGVkX19Rn/USOSqPpn1FTbs5vPvAFXa3NDuh2sA='
    },
    sampleResiAccount: {
      eleAccount: '8373520946',
      gasAccount: '2816302453',
      postcode: '3153',
      idType: 'dob',
      idValue: '01011980'
    },
    sampleBsmeAccount: {
      eleAccount: '2870412120',
      gasAccount: '3231348465',
      abn: '78538656400',
      idType: 'dob',
      idValue: '01011980'
    },
    sampleResiAddress: "42 Brownlow Drive, POINT COOK VIC 3030",
    sampleBsmeAddress: "36 Gregory Street West, WENDOUREE VIC 3355",
    deviceScreenSize: {
      eaMobile: {
        maxWidth: 767
      },
      eaTablet: {
        minWidth: 768,
        maxWidth: 991
      }
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
