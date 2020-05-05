import {FUEL_TYPE_OPTIONS} from "@ea/ea-commons-models";
import {checkoutDetailsMethod} from "../tests/methods/checkoutDetailsPage";

const YAML = require('yamljs');
const fs   = require('fs');
const path = require('path');

export function getFilePath(t,fuelType){
  let path;
  let scenarioId=checkoutDetailsMethod.getScenarioId(t);
  if(fuelType===FUEL_TYPE_OPTIONS.ELE.value)
    path= 'resources/quoteDetails/eleQuoteDetails_'+scenarioId+'.yml';
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
    path= 'resources/quoteDetails/gasQuoteDetails_'+scenarioId+'.yml';
  }
  return path;
}

export function createYamlFile(t,ymlData,fuelType){
  const path = getFilePath(t,fuelType);
  fs.writeFileSync(path,ymlData,'utf8');
}

export function YAMLtoJSON(yamlStr) {
    let obj = YAML.parse(yamlStr);
    let jsonStr = JSON.stringify(obj);
    return jsonStr;
  }

export function convertYmlTOJSONObj(t,fuelType){
    const path=getFilePath(t,fuelType);
    const doc=fs.readFileSync(path,'utf8');
    const strVal=YAMLtoJSON(doc);
    const JSONObj=JSON.parse(strVal);
    return JSONObj;
  }

export function deleteFiles(path) {
  if( fs.existsSync(path) ) {
    fs.readdirSync(path).forEach(function(file,index){
      let curPath = path + "/" + file;
      if(fs.lstatSync(curPath).isDirectory()) { // recurse
        deleteFiles(curPath);
      } else { // delete file
        fs.unlinkSync(curPath);
      }
    });
    fs.rmdirSync(path);
  }
};








