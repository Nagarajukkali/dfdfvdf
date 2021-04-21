import {Given} from 'cucumber'
import {getSpyData, spyOff, spyOn} from '../../global_methods/analyticsFunction';
import {Then} from 'cucumber'

Given(/^user initiates the call to capture analytics events$/, async function(t) {
 await spyOn();


});
Then(/^user validates the data layer is updated for solar$/, async function(t) {
  //const data = await getSpyData();
  const solarIndicatorValue = await t.eval(() => window.ead.productInfo.electricity.solarPanels);
  if(solarIndicatorValue === 'yes'){
    await t.expect(solarIndicatorValue).eql('yes');
    console.log("Solar Panel Yes for the premise")
  }else{
    await t.expect(solarIndicatorValue).eql('no');
    console.log("Solar Panel No for the premise")
  }

});
Then(/^user closes the spy on datalayer$/, async function(t) {
  await spyOff;
});
