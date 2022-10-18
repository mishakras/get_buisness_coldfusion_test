<!---

ADOBE SYSTEMS INCORPORATED

 Copyright 2009 Adobe Systems Incorporated

 All Rights Reserved.

 

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 

terms of the Adobe license agreement accompanying it.  If you have received this file from a 

source other than Adobe, then your use, modification, or distribution of it requires the prior 

written permission of Adobe.

--->


<cfcomponent output="no">

    <cffunction name="getDotNotationCFCPath" access="public" returntype="string" output="no">
       <cfargument name="absoluteCFCpath" type="string" required="yes">
        
        <cfset slash = "/">
		
        <cfif absoluteCFCpath contains '\'>
                    <cfset absoluteCFCpath = replace(absoluteCFCpath,'\',slash,'ALL')>  
        </cfif>

        <cfset webrt =  getPageContext().getServletContext().getRealPath("/") >
        <cfif webrt contains '\'>
                    <cfset webrt = replace(webrt,'\',slash,'ALL')>  
        </cfif>
        <!---<cfdump var="#listlast(listlast(absoluteCFCpath,'#slash#'),'.')#" output="C:\ormcfc.txt"><cfabort>--->
       <cfif listlast(listlast(absoluteCFCpath,'#slash#'),'.') neq 'cfc'>
            <cfthrow message='Error: Path passed is not a valid CFC file Path'>
            <cfreturn 'Error: Path passed is not a valid CFC file Path'>
       </cfif>
       
       
       <cfif webrt eq Mid(absoluteCFCpath,1,len(webrt)) >
           <cfset webpath = Mid(absoluteCFCpath,len(webrt)+1, len(absoluteCFCpath))> 
           <cfif webpath contains  slash>
                <cfset replacedList = replace(webpath,slash,'.','ALL') >
                <cfset dotPath =  listdeleteAt(replacedList,listlen(replacedList,'.'),'.')>     
           <cfelse>
                <cfset dotPath =  listdeleteAt(webpath,listlen(webpath,'.'),'.')>
           </cfif>
           <cfreturn  dotPath>  
       <cfelse>
           <cfthrow message='Error: Mostly, File path passed is not under CF server webroot'>
           <cfreturn 'Error: Mostly, File path passed is not under CF server webroot'>
       </cfif> 

    </cffunction> 

<!----------------------------------------------------------------------------------------------------------------->

	<cffunction name="getASDataType" access="public" returntype="string" output="no">
		<cfargument name="DBDataType" type="string" required="yes">
		<!----This Mapping covers Oracle, MS SQL Server Datatype mapping, More datatypes from other DBs could be added by user------>
		
        <cfswitch expression="#Trim(DBDataType)#">
		
		  <!----Integers (should Bit be part of this one ?)---->
		  <cfcase value="int,int identity,integer,integer identity,numeric,numeric identity,smallint,smallint identity,bigint,bigint identity,tinyint,bit,PLS_INTEGER,BINARY_INTEGER)">
		       <cfreturn 'int'>
		  </cfcase>
		  <!-----Large Numbers---->
		  <cfcase value="Number,AutoNumber,float,decimal,uniqueidentifier,real,double,byte,short,long,money">
		       <cfreturn 'Number'>
		  </cfcase>
		  <!---ODD Datatype---->
		  <cfcase value="numeric() identity">
		       <cfreturn 'int'>
		  </cfcase>
		  

		  <!----String (Long DT has been removed from here as it is conflicting with Number case, For Database LONG should be mapped with String but for Java it should be mapped with Number)---->
		  <cfcase value="String,text,varchar,varchar2,nvarchar2,char,nchar,ntext,nvarchar,CHARACTER,LONG RAW,RAW,ROWID,UROWID,CLOB,NCLOB,XMLType">
		       <cfreturn 'String'> 
		  </cfcase>

		  <!----Boolean---->
		  <cfcase value="bool,Boolean">
		       <cfreturn 'Boolean'>
		  </cfcase>
          <!----DateTime---->
		  <cfcase value="Datetime,smalldatetime,timestamp,TIMESTAMP WITH TIMEZONE, TIMESTAMP WITH LOCAL TIMEZONE, INTERVAL YEAR TO MONTH, INTERVAL DAY TO SECOND">
		       <cfreturn 'Date'>
		  </cfcase>
          <!----BINARY Datatypes---->
		  <cfcase value="binary,varbinary,BLOB">
		       <cfreturn 'ByteArray'>
		  </cfcase>
          <!----Image---->
		  <cfcase value="image">
		       <cfreturn 'Bitmap'>
		  </cfcase>
		</cfswitch>
        <cfreturn "Error:Invalid DataType '#Trim(DBDataType)#'">
	</cffunction>
<!------------------------------------------------------------------------------------------------------------>    
    <cffunction name="getPK" returntype="any">
      <cfargument required="yes" name="datasrc">
      <cfargument required="yes" name="tblName">  
		   <cfdbinfo 
		    type="columns"
		    datasource="#datasrc#"
            table = "#tblName#"
		    name="dbdata">
          <cfset PKList = ""> 
          <cfloop query="dbdata">
              <cfif dbdata.IS_PRIMARYKEY eq true>
                 <cfset PKList = ListAppend(PKList,dbdata.COLUMN_NAME)>
              </cfif>
          </cfloop>
       
       <cfreturn PKList>
    </cffunction>

<!------------------------------------------------------------------------------------------------------------->
    <cffunction name="getPropertyRecordSet" returntype="query">
      <cfargument required="yes" name="datasrc" type="String">
      <cfargument required="yes" name="tblName" type="String">
      <cfargument required="yes" name="props" type="Array">  
	
	  <cfset flag = true>
	  <cfif trim(datasrc) neq "">	
		    
            <cfdbinfo  type="columns"  datasource="#datasrc#"  table = "#tblName#"  name="dbdata">
            
	  <cfelse>
	         <cfset flag = false>
	  </cfif>		
	  
     <cfset PropQuery = QueryNew("PROPNAME,PROPTYPE,ISPK")> 
		  
<cfloop index="i" from="1" to="#ArrayLen(props)#" >
	     
	     <cfset queryAddRow(PropQuery)>

         <!----Decide on the ColumnName for DB Check---->
          <cfif StructKeyexists(props[i],'column') >
	           <cfset ColumnName = props[i].column > 
	      <cfelse>
		       <cfset ColumnName = props[i].name >
		  </cfif>	
	  
		 <!----PropName---->
		    
			 <cfif StructKeyexists(props[i],'name')>
				       <cfset querySetCell(PropQuery,"PROPNAME",props[i].name)>
			 <cfelse>
				       <cfthrow message="Error: Invalid CFC, Name is Mandatory for the Properties" > 
			 </cfif>
    
		 <!----Property Type---->
		  <cfif StructKeyexists(props[i],'datatype') and trim(props[i].datatype) neq ''>
                  <cfset querySetCell(PropQuery,"PROPTYPE",getASDataType(props[i].datatype))>
          <cfelseif StructKeyexists(props[i],'type') and props[i].type neq 'any' and trim(props[i].type) neq ''>
                   <cfset querySetCell(PropQuery,"PROPTYPE",getASDataType(props[i].type))>
		  <cfelse>
				  <cfif flag eq true>
					  <cfloop query="dbdata">
			              <cfif trim(dbdata.COLUMN_NAME) eq trim(ColumnName)>
							         <cfset querySetCell(PropQuery,"PROPTYPE",getASDataType(dbdata.TYPE_NAME))>	 
			              </cfif>
					  </cfloop>
				  <cfelse>
				       <cfthrow message="Error: Datasource has to be passed for this CFC as DataType/Type is not specified for some/all properties. Also Make sure that type is not 'any'." >
				  </cfif>
		  </cfif>
		 <!----IS PK ??---->
		  <cfif StructKeyexists(props[i],'fieldtype') and props[i].fieldtype eq 'id'>
                  <cfset querySetCell(PropQuery,"ISPK",'yes')>
		  <cfelse>
			      
				  
                  <!----Find if column is PK---->				  
				  <cfif flag eq true>
					  <cfloop query="dbdata">
			              <cfif trim(dbdata.COLUMN_NAME) eq trim(ColumnName)>
							     <cfif dbdata.IS_PRIMARYKEY eq true>
			                         <cfset querySetCell(PropQuery,"ISPK",'yes')>
								 <cfelse>
								     <cfset querySetCell(PropQuery,"ISPK",'no')>	 
			                     </cfif>
			              </cfif>
					  </cfloop>
				  <cfelse>
				       <cfset querySetCell(PropQuery,"ISPK",'DataSource Information should have been passed to find out, if the key is PK or not')>
					  <cflog text="DataSource Information should have been passed to find out, if the key is PK or not" >
				  </cfif>	  
		</cfif>	  
</cfloop>	   
		  		   
<cfreturn PropQuery>
          
</cffunction>
</cfcomponent>
