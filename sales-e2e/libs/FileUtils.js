const YAML = require('yamljs');
const fs   = require('fs');

const path='resources/quoteDetails.yml';

export function createYamlFile(ymlData){
    fs.writeFileSync(path,ymlData,'utf8');
}

export function YAMLtoJSON(yamlStr) {
    let obj = YAML.parse(yamlStr);
    let jsonStr = JSON.stringify(obj);
    return jsonStr;
  }

export function converYmlTOJSONObj(){
    const doc=fs.readFileSync(path,'utf8');
    const strVal=YAMLtoJSON(doc);
    const JSONObj=JSON.parse(strVal);
    return JSONObj;
  }

