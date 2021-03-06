public class Realtime_Tracking_Controller {
    public static final String REALTIME_TRACKING = 'Realtime_Tracking';
    
    
    @RemoteAction
    public static List<UserWrapper> searchForUser(String searchTerm){
        System.debug('searchTerm:  ' + searchTerm);        
        List<UserWrapper> userList = new List<UserWrapper>();
        if(searchTerm != null && searchTerm != ''){
            String tempTerm = '%' + searchTerm + '%';
            for(User u : [Select Id, Name FROM User WHERE Name LIKE :tempTerm]){
                userList.add(new UserWrapper(u));
            }
        }
        system.debug('##### Userlist: ' + userList);
        return userList;
    }
    
    @RemoteAction
    public static List<Location> getLocationData(String userId){
        List<Location> locList = new List<Location>();
        for(Check_In__c c : [Select Id, User__c, Location__Longitude__s, Location__Latitude__s, CreatedDate FROM Check_In__c 
                             WHERE User__c = :userId
                             AND CreatedDate > YESTERDAY]){
            locList.add(new Location(c));                     
        }
        
        return locList;
    }

    @RemoteAction
    public static Boolean deleteCheckin(){        
        list<Check_In__c> chkinList = [Select Id from Check_In__c];        
        delete chkinList;
        return true;
    }
    
    @RemoteAction
    public static Boolean insertNewCheckin(Double latitude, Double longitude){
        insert new Check_In__c(User__c = UserInfo.getUserId(), Location__Latitude__s = latitude, Location__Longitude__s = longitude);
        return true;
    }
    
    public PageReference startPushTopic(){
        List<PushTopic> current = [Select Id, Name From PushTopic Where Name = :REALTIME_TRACKING];
        if (current != null && current.size() == 0) {
            PushTopic newTopic = new PushTopic();
            newTopic.Name = REALTIME_TRACKING;
            newTopic.Query = 'SELECT Id, User__c, Location__Longitude__s, Location__Latitude__s, CreatedDate FROM Check_In__c';
            newTopic.ApiVersion = 29.0;
            newTopic.NotifyForOperationCreate = true;
            insert newTopic;            
        }
        return null;
    }
    
    public class Location{
        public Double latitude{get;set;}
        public Double longitude{get;set;}
        public String checkinTime{get;set;}
        
        public Location(Check_In__c c){
            this.checkinTime = c.CreatedDate.format('h:mm a');        
            this.latitude = c.Location__Latitude__s;
            this.longitude = c.Location__Longitude__s;
        }
    }
    
    public class UserWrapper{
        public String id{get;set;}
        public String value{get;set;}
        
        public UserWrapper(User u){
            this.id = u.Id;
            this.value = u.Name;
        }
    }
}