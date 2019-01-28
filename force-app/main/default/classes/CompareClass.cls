public class CompareClass {
    public static void CompareMethod(List<Integer> ListA, List<Integer> ListB) {
        List<Integer> CompList = new List<Integer>();
        List<Integer> HighList = new List<Integer>{0,0};
        if(ListA.size()==0 || ListA == null || ListB.size()==0 || ListB == null) {
            system.debug('Enter equal length lists');
        }
        for(integer i = 0; i < ListA.size(); i++){
            //ListA.get(i) > ListB.get(i) ? CompList.set(i,1) : CompList.set(i,0);
            if(ListA[i] > ListB[i]) {
                CompList[i] = 1;
                HighList[0]++ ;
            } else{
                CompList[i] = 0;
                HighList[1]++;
            }                       
        }
        system.debug('Output List1: ' + CompList);
        system.debug('Output List2: ' + HighList);
    }
}