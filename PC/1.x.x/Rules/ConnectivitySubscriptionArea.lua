require 'SectorLimit'

-- Main entry point for ConnectivitySubscriptionArea
function ConnectivitySubscriptionArea(feature, featurePortrayal, contextParameters)
	featurePortrayal:AddInstructions('ViewingGroup:31020;DrawingPriority:14;DisplayPlane:OverRADAR;')
	if feature.PrimitiveType == PrimitiveType.Point then
		SectorLimit(feature, featurePortrayal, contextParameters)
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		featurePortrayal:SimpleLineStyle('solid',0.5,'CHBRN')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	end
	return 31020
end