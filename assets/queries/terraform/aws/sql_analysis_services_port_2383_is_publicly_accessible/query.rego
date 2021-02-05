package Cx

import data.generic.terraform as lib

CxPolicy[result] {
	resource := input.document[i].resource.aws_security_group[name].ingress[x]
	resource.cidr_blocks[j] == "0.0.0.0/0"
	resource.protocol == "tcp"
	portNumber := lib.getPort(2383, lib.portNumbers)
	resource.from_port <= portNumber
	resource.to_port >= portNumber

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_security_group[%s]", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("aws_security_group[%s] doesn't openSQL Analysis Services Port 2383", [name]),
		"keyActualValue": sprintf("aws_security_group[%s] open SQL Analysis Services Port 2383", [name]),
	}
}

CxPolicy[result] {
	resource := input.document[i].resource.aws_security_group[name].ingress
	resource.cidr_blocks[j] == "0.0.0.0/0"
	resource.protocol == "tcp"
	portNumber := lib.getPort(2383, lib.portNumbers)
	resource.from_port <= portNumber
	resource.to_port >= portNumber

	result := {
		"documentId": input.document[i].id,
		"searchKey": sprintf("aws_security_group[%s]", [name]),
		"issueType": "IncorrectValue",
		"keyExpectedValue": sprintf("aws_security_group[%s] doesn't open SQL Analysis Services Port 2383", [name]),
		"keyActualValue": sprintf("aws_security_group[%s] opens SQL Analysis Services Port 2383", [name]),
	}
}
