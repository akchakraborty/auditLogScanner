%dw 2.0
output application/json skipNullOn ="everywhere"
---
{
	//roleId
	(if ( payload.payload.properties.role_id != null)
   		roleId: payload.payload.properties.role_id
   		else if ((payload.objects filter ($.objectType == "Role"))[0].objectId != null)
   			roleId: (payload.objects filter ($.objectType == "Role"))[0].objectId
  	 		else null
  	 ),
   //roleGroupId
   (if(payload.payload.properties.role.role_group_id !=null)
   roleGroupId : payload.payload.properties.role.role_group_id
   else null),
	environmentId: (payload.objects filter ($.objectType == "Environment"))[0].objectId,
	
	userId:(payload.objects filter ($.objectType == "User"))[0].objectId,
	
	//orgId
	( if (payload.payload.properties.organizationId != null  )
	    orgId: payload.payload.properties.organizationId
        		else if  (payload.payload.properties.context_params.org != null)
    		orgId:payload.payload.properties.context_params.org		
    	  			else null
	),
	//masterOrgId
	( if (payload.payload.properties.masterOrganizationId != null  )
	    masterOrgId: payload.payload.properties.masterOrganizationId
       		 else null

	),
	//applicationId:"",

	
	
}