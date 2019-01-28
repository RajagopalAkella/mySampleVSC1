public class SampleAccountsSet {
	@AuraEnabled
    public static List<Account> getAcc(){
        return [SELECT id,name,Phone FROM Account LIMIT 4];
    }
}