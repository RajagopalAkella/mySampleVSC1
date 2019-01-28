global class MyWebService {
    webservice static Id makeContact(String aName) {
        Account a = new Account(Name = aName);
        insert a;
        return a.id;
    }
}