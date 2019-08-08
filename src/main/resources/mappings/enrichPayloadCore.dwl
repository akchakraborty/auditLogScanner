%dw 2.0
import java!java::util::Date
output application/json skipNullOn = "everywhere"
---
{

     platform: vars.initpayload.platform,
      action: vars.initpayload.action,
      timestamp: (Date::new(vars.initpayload.timestamp) as DateTime {format:"yyyy-MM-dd'T'HH:mm:ss.SSSZ"}),
      userId: vars.initpayload.userId,
     userName: vars.initpayload.userName,
      clientIP: vars.initpayload.clientIP,
      payload: {
      	subaction: vars.initpayload.payload.subaction,
        id: vars.initpayload.payload.id,
       	organizationId: vars.initpayload.payload.organizationId,
       (if(	vars.initpayload.payload.organizationId != null)
       	orgName: vars.org.name
       	else null
       ),
        groupId: vars.initpayload.payload.groupId,
       	assetId: vars.initpayload.payload.assetId,
        version: vars.initpayload.payload.version,
        versionGroup: vars.initpayload.payload.versionGroup,
       (if (vars.initpayload.createdDate != null) 
       		createdDate: (Date::new(vars.initpayload.payload.createdDate) as DateTime {format:"yyyy-MM-dd'T'HH:mm:ss.SSSZ"})
       		else null),
       (if (vars.initpayload.updatedDate != null)
        	  updatedDate: (Date::new(vars.initpayload.payload.updatedDate) as DateTime {format:"yyyy-MM-dd'T'HH:mm:ss.SSSZ"})
        else null),
        	name:  vars.initpayload.payload.name,
       	'type': vars.initpayload.payload.'type',
        status: vars.initpayload.payload.status,
        description: vars.initpayload.payload.description,
        isCompleted: vars.initpayload.payload.isCompleted,
        isSnapshot: vars.initpayload.payload.isSnapshot,
        isLatestReleaseVersion: vars.initpayload.payload.isLatestReleaseVersion,
        isLatestPublicVersion: vars.initpayload.payload.isLatestPublicVersion,
        isLatestVersion: vars.initpayload.payload.isLatestVersion,
        isPublic: vars.initpayload.payload.isPublic,
        masterOrganizationId: vars.initpayload.payload.masterOrganizationId,
        (if (vars.initpayload.payload.masterOrganizationId != null )
        
        	masterOrgName : vars.masterorg.name
        	else null
        ), 
        createdById: vars.initpayload.payload.createdById, 
        (if (vars.initpayload.payload.createdById != null )
          username : vars.user
          else null
          ),
        ranking: vars.initpayload.payload.ranking,
        (if (vars.initpayload.payload.properties.role_id != null or
        		 vars.initpayload.payload.properties.context_params.envId !=null or 
        		 vars.initpayload.payload.properties.context_params.org !=null)
        
        /* these  properties   values gets generated when action is Permission Change  */
        
        properties: {
          role_id: vars.initpayload.payload.properties.role_id,
          (if (vars.initpayload.payload.properties.role_id != null) 
          	role : vars.role.name
          	else null
          ),
          context_params: {
            envId:  vars.initpayload.payload.properties.context_params.envId,
            (if (vars.initpayload.payload.properties.context_params.envId != null) 
            	environmentname:vars.env.name
            	else null
            ),
            org: vars.initpayload.payload.properties.context_params.org,
           (if (vars.initpayload.payload.properties.context_params.org != null)
           	orgName : vars.org.name 
           	else null
           ),
           
            }
          }
          else null),
         
        },
        /* these properties are used when action is Edit */
        (if (vars.initpayload.payload.properties.role.role_group_id != null or 
        		vars.initpayload.payload.properties.role.user_id != null
        )
        properties : {
          role: {
            role_group_id: vars.initpayload.payload.properties.role.role_group_id,
            role_group_name: vars.groupRoleId.payload.role.name
          },
          user: {
            user_id: vars.initpayload.payload.properties.user.user_id,
            username: vars.initpayload.payload.properties.user.username
          }
        }
        else null),
      failed: vars.initpayload.failed,
      failedCause: vars.initpayload.failedCause,
     	objects: vars.initpayload.objects map ( object , indexOfObject ) -> {
          objectType: object.objectType,
          objectId: object.objectId,
        		("environment": vars.env.name) if (object.objectType == "Environment") ,
        		( "username" : vars.user.username) if (object.objectType == "User"),
          	("role" : vars.role.name) if (object.objectType == "Role"),
          	objectName :object.objectName
         
           
        
         
        }
}        
        
