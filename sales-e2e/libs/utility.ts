/*Expiry date calculator utility*/
const  dayjs =require('dayjs');

function dateFormat(expectedOutput){
let YY1;
  switch(expectedOutput){
    case "Mastercard":
      expectedOutput=(dayjs().format('MM/YY')).toString();
      break;
    case "Visa":
      YY1=dayjs().add(1, 'year');
      expectedOutput=(YY1.format('MM/YY')).toString();
      break;
    case "Amex":
      YY1=dayjs().add(19, 'year');
      expectedOutput=(YY1.format('MM/YY')).toString();
      break;
  }
  return expectedOutput;
}

module.exports={
  dateFormat:dateFormat,
};
