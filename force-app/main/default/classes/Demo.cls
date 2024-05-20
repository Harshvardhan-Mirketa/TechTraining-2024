public class Demo {
    public static void printData(){
        List<String> nameList = new List<String>();
        nameList.add('sakshi');
        nameList.add('rupesh');
        nameList.add('akash');
        System.debug(nameList);
        System.debug(nameList.size());
        
        
        Set<String> nameSet = new Set<String>();
        nameSet.add('sakshi');
        nameSet.add('rupesh');
        nameSet.add('akash');
        nameSet.add('Sakshi');
        System.debug(nameSet);
        System.debug(nameSet.size());
        
        Map<Integer, String> mapNames = new Map<Integer, String>();
        mapNames.put(0,'Akash');
        mapNames.put(1,'Abhijit');
        System.debug(mapNames);
        System.debug(mapNames.get(1));
        System.debug(mapNames.containsKey(2));
        if(mapNames.containsKey(1)){
            mapNames.put(1,'Mirketa');
        }
        System.debug(mapNames.get(1));
    }
}