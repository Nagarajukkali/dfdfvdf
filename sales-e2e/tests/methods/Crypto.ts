export class Crypto {
  public static encrypt(plainText) {
    var result="";
    for(let i=0;i<plainText.length;i++) {
      if(i<plainText.length-1) {
        result+=plainText.charCodeAt(i)+10;
        result+="-";
      }
      else {
        result+=plainText.charCodeAt(i)+10;
      }
    }
    return result;
  }

  public static decrypt(encryptedText) {
    var result="";
    var array = encryptedText.split("-");
    for(let i=0;i<array.length;i++) {
      result+=String.fromCharCode(array[i]-10);
    }
    return result;
  }
}
