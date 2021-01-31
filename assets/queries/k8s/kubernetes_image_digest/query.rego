package Cx

CxPolicy[result] {
	document := input.document[i]
	metadata := document.metadata
	spec := document.spec
	types := {"initContainers", "containers"}
	containers := spec[types[x]]
	image := containers[c].image
	not contains(image, "@")

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("metadata.name=%s.spec.%s.name=%s.image", [metadata.name, types[x], containers[c].name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("metadata.name=%s.spec.%s.name=%s.image has '@'", [metadata.name, types[x], containers[c].name]),
		"keyActualValue": sprintf("metadata.name=%s.spec.%s.name=%s.image '@'", [metadata.name, types[x], containers[c].name]),
	}
}

CxPolicy[result] {
	document := input.document[i]
	metadata := document.metadata
	spec := document.spec
	types := {"initContainers", "containers"}
	containers := spec[types[x]]
	object.get(containers[k], "image", "undefined") == "undefined"

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("metadata.name=%s.spec.%s", [metadata.name, types[x]]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": sprintf("metadata.name=%s.spec.%s.name=%s.image is Defined", [metadata.name, types[x], containers[c].name]),
		"keyActualValue": sprintf("metadata.name=%s.spec.%s.name=%s.image is Undefined", [metadata.name, types[x], containers[c].name]),
	}
}
