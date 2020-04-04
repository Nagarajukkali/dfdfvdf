import {FUEL_TYPE_OPTIONS} from "@ea/ea-commons-models";

const YAML = require('yamljs');
const fs   = require('fs');

export function getFilePath(fuelType){
  let path;
  if(fuelType===FUEL_TYPE_OPTIONS.ELE.value)
    path= 'resources/eleQuoteDetails.yml';
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
    path= 'resources/gasQuoteDetails.yml';
  }
  return path;
}

export function createYamlFile(ymlData,fuelType){
  const path = getFilePath(fuelType);
  fs.writeFileSync(path,ymlData,'utf8');
}

export function YAMLtoJSON(yamlStr) {
    let obj = YAML.parse(yamlStr);
    let jsonStr = JSON.stringify(obj);
    return jsonStr;
  }

export function convertYmlTOJSONObj(fuelType){
    const path=getFilePath(fuelType);
    const doc=fs.readFileSync(path,'utf8');
    const strVal=YAMLtoJSON(doc);
    const JSONObj=JSON.parse(strVal);
    return JSONObj;
  }

