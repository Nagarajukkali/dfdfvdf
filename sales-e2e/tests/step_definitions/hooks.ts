import { Before, After } from 'cucumber';


Before( async t => {

});

After( async t => {
  await t.takeScreenshot('../sales-e2e/screenshots/${USERAGENT}/test-${TEST_INDEX}/${DATE}_${TIME}.png');
});

