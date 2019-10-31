import { Selector } from 'testcafe';
import { ClientFunction } from 'testcafe';
const replace = { replace: true };
const faker=require('faker');

export function testFuncs() {

    async function click(t, buttonName) {
        try{
            isElementDisplayed(t, buttonName);
            await t.click(buttonName);
        }
        catch(error){
            console.log(error);
        }
    }

    async function scrollToElement(t, element) {
        isElementDisplayed(t, element);
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

    async function clearAndText(t, element, value) {
        try{
            isElementDisplayed(t, element);
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
        return await element.innerText;
    }

    async function isElementVisible(t, element) {
        return await element.visible;
    }
    async function generateRandomNumber(max){
        return faker.random.number(max);
    }

    async function isElectricity(t, element) {

    }

    async function isGas(t, element) {
  
    }


      return {
        click,
        isElementDisplayed,
        assertText,
        assertTextOnPage,
        assertPageURL,
        clearAndText,
        getInputText,
        getElementText,
        scrollToElement,
        isElementVisible,
        generateRandomNumber,
      };
}
