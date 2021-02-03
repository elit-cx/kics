package Cx

CxPolicy[result] {
	resource := input.document[i].resource.google_project[name]
    object.get(resource,"auto_create_network","undefined") != "undefined"
	not resource.auto_create_network == false

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("google_project[%s].auto_create_network", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": "'google_project.auto_create_network' is equal 'false'",
		"keyActualValue": "'google_project.auto_create_network' is equal 'true'",
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.google_project[name]
	object.get(resource,"auto_create_network","undefined") == "undefined"

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("google_project[%s]", [name]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "'google_project.auto_create_network' is set",
		"keyActualValue": "'google_project.auto_create_network' is undefined",
	}
}
