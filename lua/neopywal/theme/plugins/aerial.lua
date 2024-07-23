local M = {}

function M.get()
	return {
		AerialLine = { fg = C.color4 },
		AerialGuide = { fg = C.comment },
		AerialBooleanIcon = { link = "Boolean" },
		AerialClassIcon = { link = "Type" },
		AerialConstantIcon = { link = "Constant" },
		AerialConstructorIcon = { link = "Special" },
		AerialFieldIcon = { link = "Variable" },
		AerialFunctionIcon = { link = "Function" },
		AerialMethodIcon = { link = "Function" },
		AerialNamespaceIcon = { link = "Include" },
		AerialNumberIcon = { link = "Number" },
		AerialOperatorIcon = { link = "Operator" },
		AerialTypeParameterIcon = { link = "Type" },
		AerialPropertyIcon = { link = "Function" },
		AerialStringIcon = { link = "String" },
		AerialVariableIcon = { link = "Variable" },
		AerialEnumMemberIcon = { link = "Variable" },
		AerialEnumIcon = { link = "Type" },
		AerialFileIcon = { link = "URLlink" },
		AerialModuleIcon = { link = "Include" },
		AerialPackageIcon = { link = "Include" },
		AerialInterfaceIcon = { link = "Type" },
		AerialStructIcon = { link = "Type" },
		AerialEventIcon = { link = "Type" },
		AerialArrayIcon = { link = "Constant" },
		AerialObjectIcon = { link = "Type" },
		AerialKeyIcon = { link = "Type" },
		AerialNullIcon = { link = "Type" },
	}
end

return M
