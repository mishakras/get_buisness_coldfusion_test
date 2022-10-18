component{

	public function init(string cfcreference =""){
    		
		variables.toolTips = generateToolTips(arguments.cfcreference);	
			
    	return This;
    }
    

	public struct function generateToolTips(string cfcreference =""){
		var i =  0;
		var result = StructNew();
		if (len(arguments.cfcreference) < 1){
			return result;
		}
		var metaData = GetComponentMetaData(arguments.cfcreference);
		var props = metaData.properties;
		
		
		for(i=1; i <= ArrayLen(props); i++){
			result[props[i]['name']] = props[i]['hint'];
		}
	
		return result;
	}

	

	public string function getToolTip(required string name){
		if(structKeyExists(variables.toolTips, arguments.name)){
			return variables.toolTips[arguments.name];
		}
		else{
			return "";
		}
	}

}
