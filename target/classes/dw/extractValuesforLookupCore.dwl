%dw 2.0
output application/json skipNullOn ="everywhere"
---
{
	platform: payload.platform,
	action: payload.action,
	timestamp: payload.timestamp,
	userId: payload.userId,
	userName: payload.userName,
	clientIP: payload.clientIP,
	payload: payload.payload,
	failed: payload.failed,
	failedCause: payload.failedCause,
	objects: payload.objects map ( object , indexOfObject ) -> {
		objectType: object.objectType,
		objectId: object.objectId,
		applicationName: object.objectName
		
	}
}