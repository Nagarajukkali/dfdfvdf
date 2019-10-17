module.exports = {
  [`/espresso`]: {
    secure: false,
    logLevel: 'debug',
    changeOrigin: true,
    target: 'https://mocha.nonprod.digital.energyaustralia.com.au',
    pathRewrite: {
      [`^/espresso`]: '',
    },
  },

  '/bpoint/*': {
    target: 'https://preprod.nonprod.digital.energyaustralia.com.au',
    secure: false,
    changeOrigin: true,
    logLevel: 'debug',
  },
  '/myaccount/api/*': {
    target: 'https://mocha.nonprod.digital.energyaustralia.com.au',
    secure: false,
    changeOrigin: true,
    logLevel: 'debug',
  },
};
