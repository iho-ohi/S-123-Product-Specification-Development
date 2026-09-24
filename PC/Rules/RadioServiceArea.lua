-- Main entry point for RadioServiceArea
function RadioServiceArea(feature, featurePortrayal, contextParameters)
	local color
	if feature.Code == 'RadioServiceArea' then
		color = 'CHBRN'
	elseif feature.Code == 'IndeterminateZone' then
		color = 'CHBRN'
	else 
	end
    featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:13;DisplayPlane:OverRADAR;')
    --featurePortrayal:AddInstructions('ColorFill:'..color..',0.75')
	featurePortrayal:SimpleLineStyle('solid',0.32,'CHBRN')
	featurePortrayal:AddInstructions('LineInstruction:_simple_')
	return 31020
end