require 'SectorLimit'

-- Main entry point for RadioStation
function RadioStation(feature, featurePortrayal, contextParameters)
    local viewingGroup = 31020
	local textViewingGroup = 11
	local priority = 16
    local textPriority = 24

	featurePortrayal:AddInstructions('ViewingGroup:'..viewingGroup..';DrawingPriority:'..priority..';DisplayPlane:OverRadar')

    if feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:AddInstructions('PointInstruction:RDOSTA02')
        featurePortrayal:AddInstructions('PointInstruction:TOWERS15')
    end


    local label = ''

    if feature.hoursOfWatch then
        label = feature.hoursOfWatch
    end

    if #feature.categoryOfRadioStation ~= 0 then
        local textCatros = ''

		for index, categoryOfRadioStation in ipairs(feature.categoryOfRadioStation) do
			textCatros = ''
			if categoryOfRadioStation == 5 then
				textCatros = 'RDF'
			elseif categoryOfRadioStation == 9 then
				textCatros = 'Loran C'
			elseif categoryOfRadioStation == 10 then
				textCatros = 'DGNSS'
			elseif categoryOfRadioStation == 19 then
				textCatros = 'RT' -- Radio Telephone Station
			elseif categoryOfRadioStation == 20 then
				textCatros = 'AIS Base'
			end

			if textCatros ~= '' then
				if label ~= '' then
					label = label..', '..textCatros
				else
					label = textCatros
				end
			end
		end
	end

    if feature.status then
		if label ~= '' then
	 		label = label..', '..feature.status
	 	else
	 		label = feature.status
	 	end
    end

	SectorLimit(feature, featurePortrayal, contextParameters)


	if label ~= '' then
		featurePortrayal:AddInstructions('FontColor:CHBLK')
        featurePortrayal:AddInstructions('LocalOffset:3.0,0.0')
		featurePortrayal:AddTextInstruction(EncodeString(label, '%s'), textViewingGroup, textPriority, viewingGroup, priority)
	end

    --[[
    When it is impractical to encode the radio coverage, e.g., in HF band,
    extent of the radio service may be encoded by using estimatedRangeOfTransmission attribute of RadioStation.
    ]]


    return viewingGroup
end