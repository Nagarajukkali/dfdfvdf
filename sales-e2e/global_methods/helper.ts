import { Selector } from 'testcafe';
import { ClientFunction } from 'testcafe';
const replace = { replace: true };
//const faker=require('faker');

export function testFuncs() {

    async function click(t, buttonName) {
        try{
            await isElementDisplayed(t, buttonName);
            await t.click(buttonName);
            t.switchToIf
        }
        catch(error){
            console.log(error);
        }
    }

    async function scrollToElement(t, element) {
        await isElementDisplayed(t, element);
        await t.scrollTo(element);
      }

    async function isElementDisplayed(t, element) {
        await t.expect((element).exists).ok;
    }

    async function assertText(t, element, expectedFieldValue) {
        let actualFieldValue = element.innerText;
        await t.expect(actualFieldValue).contains(expectedFieldValue);
    }

    async function assertTextOnPage(t, text) {
        const actualPageContent= await Selector('html').textContent;
        await t.expect(actualPageContent).contains(text);
    }

    async function assertPageURL(t, urlContent) {
        const getPageUrl = ClientFunction(() => window.location.href);
        await t.expect(getPageUrl()).contains(urlContent);
    }

    async function clearAndEnterText(t, element, value) {
        try{
            await isElementDisplayed(t, element);
            await t.typeText(element, value, replace);
        }
        catch(error){
            console.log(error);
        }
    }
    async function getInputText(t, element) {
        return await element.value;
    }

    async function getElementText(t, element) {
        return element.innerText;
    }

    async function isElementVisible(t, element) {
        return element.visible;
    }

    function getRandomNumber(range) {
      return (parseInt(String(Math.random() * range)) % range + 1).toString();
    }

    async function clickElementFromList(t, element, value) {
        await t.click(element.withText(value));
    }

    async function isElectricity(fuelType) {
        return fuelType.toLowerCase() === 'electricity' || fuelType.toLowerCase() === 'dual' || fuelType.toLowerCase() === 'both';
    }

    async function isGas(fuelType) {
        return fuelType.toLowerCase() === 'gas' || fuelType.toLowerCase() === 'dual' || fuelType.toLowerCase() === 'both';
    }

  const waitForLoadingIconToClose = ClientFunction(() => {
    return new Promise(resolve => {
      let interval = setInterval(() => {
        if (document.querySelector('.processing'))
          return;

        clearInterval(interval);
        resolve();
      }, 100);
    });
  });


      return {
        click,
        isElementDisplayed,
        assertText,
        assertTextOnPage,
        assertPageURL,
        clearAndEnterText,
        getInputText,
        getElementText,
        scrollToElement,
        isElementVisible,
        getRandomNumber,
        clickElementFromList,
        waitForLoadingIconToClose,
      };
}

class test {

}
