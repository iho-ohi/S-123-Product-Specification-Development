function NAVTEXServiceArea(feature, featurePortrayal, contextParameters)
    featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:14;DisplayPlane:OverRADAR;')
	featurePortrayal:SimpleLineStyle('dash',0.32,'CHBRN')
	featurePortrayal:AddInstructions('LineInstruction:_simple_')
--	featurePortrayal:AddInstructions("ColorFill:CHBRN,0.75")
	return 31020
end