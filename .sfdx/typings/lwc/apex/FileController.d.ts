declare module "@salesforce/apex/FileController.attachTheFile" {
  export default function attachTheFile(param: {parentId: any, fileName: any, base64Data: any, contentType: any, attDesc: any}): Promise<any>;
}
declare module "@salesforce/apex/FileController.saveTheChunk" {
  export default function saveTheChunk(param: {parentId: any, fileName: any, base64Data: any, contentType: any, fileId: any, attDesc: any}): Promise<any>;
}
