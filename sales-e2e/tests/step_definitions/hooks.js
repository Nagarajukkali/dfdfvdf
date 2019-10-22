const { Before,After } = require('cucumber');
const { ClientFunction } = require('testcafe');
var fs = require('fs');
Before( async t => {
  await t.maximizeWindow();
});

After( async t => {
  await t.takeScreenshot('../sales-e2e/screenshots/${USERAGENT}/test-${TEST_INDEX}/${DATE}_${TIME}.png');
});

