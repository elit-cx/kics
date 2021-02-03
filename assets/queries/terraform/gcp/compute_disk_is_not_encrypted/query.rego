package Cx

CxPolicy[result] {
	resource := input.document[i].resource.google_compute_disk[name]
	object.get(resource, "disk_encryption_key", "undefined") != "undefined"

    resource.disk_encryption_key == null
	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("google_compute_disk[%s].disk_encryption_key", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "'disk_encryption_key' is not equal 'null'",
		"keyActualValue": "'disk_encryption_key' is equal 'null'",
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.google_compute_disk[name]
	object.get(resource, "disk_encryption_key", "undefined") == "undefined"

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("google_compute_disk[%s]", [name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "'disk_encryption_key' is set",
		"keyActualValue": "'disk_encryption_key' is undefined",
	}
}
