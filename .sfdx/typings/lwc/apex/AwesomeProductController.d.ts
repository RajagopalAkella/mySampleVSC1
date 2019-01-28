declare module "@salesforce/apex/AwesomeProductController.getProducts" {
  export default function getProducts(): Promise<any>;
}
declare module "@salesforce/apex/AwesomeProductController.getProductByName" {
  export default function getProductByName(param: {name: any}): Promise<any>;
}
declare module "@salesforce/apex/AwesomeProductController.getProductSizes" {
  export default function getProductSizes(param: {name: any}): Promise<any>;
}
