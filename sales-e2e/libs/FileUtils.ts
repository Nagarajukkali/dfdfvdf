import {CustomerType, FUEL_TYPE_OPTIONS} from "@ea/ea-commons-models";
import {checkoutDetailsMethod} from "../tests/methods/checkoutDetailsPage";

const YAML = require('yamljs');
const fs   = require('fs');

export class FileUtils {
  public static async getFilePath(t,fuelType){
    let path;
    let scenarioId=checkoutDetailsMethod.getScenarioId(t);
    if(fuelType===FUEL_TYPE_OPTIONS.ELE.value)
      path= 'resources/quoteDetails/eleQuoteDetails_'+scenarioId+'.yml';
    if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
      path= 'resources/quoteDetails/gasQuoteDetails_'+scenarioId+'.yml';
    }
    return path;
  }

  public static async createYamlFile(t,ymlData,fuelType){
    const path = this.getFilePath(t,fuelType);
    fs.writeFileSync(await path,ymlData,'utf8');
  }

  public static YAMLtoJSON(yamlStr) {
    let obj = YAML.parse(yamlStr);
    let jsonStr = JSON.stringify(obj);
    return jsonStr;
  }

  public static async convertYmlTOJSONObj(t,fuelType){
    const path = this.getFilePath(t,fuelType);
    const doc = fs.readFileSync(await path,'utf8');
    const strVal = this.YAMLtoJSON(doc);
    const JSONObj = JSON.parse(strVal);
    return JSONObj;
  }

  public static async getJSONfile(campaignName){
    campaignName = campaignName.toLowerCase();
    let JSONObj;
    const resiFilePath='resources/campaignData/' + campaignName + '.json';
    const doc = fs.readFileSync(resiFilePath,'utf8');
    JSONObj = JSON.parse(doc);
    return JSONObj;
  }

  public static deleteFiles(path) {
    if( fs.existsSync(path) ) {
      fs.readdirSync(path).forEach(function(file,index){
        let curPath = path + "/" + file;
        if(fs.lstatSync(curPath).isDirectory()) { // recurse
          FileUtils.deleteFiles(curPath);
        } else { // delete file
          fs.unlinkSync(curPath);
        }
      });
      fs.rmdirSync(path);
    }
  }

}









