-- Sector values are given from seaward, this function flips them.
local function flipSector(sector)
	if sector < 180.0 then
		return sector + 180.0
	else
		return sector - 180.0
	end
end

function nmi2metres(nmi)
	return nmi * 1852.0
end

-- Main entry point for creating sector limit
function SectorLimit(feature, featurePortrayal, contextParameters)
	if feature.sectorLimit == nil then
		return
	end

	for isc, sectorLimit in ipairs(feature.sectorLimit) do
		local sectorLimit1 = flipSector(sectorLimit.sectorLimitOne.sectorBearing:ToNumber())
		local sectorLimit2 = flipSector(sectorLimit.sectorLimitTwo.sectorBearing:ToNumber())
		if sectorLimit2 < sectorLimit1 then
			sectorLimit2 = sectorLimit2 + 360.0
		end

		local length1, length2
		local crs1, crs2
		if sectorLimit.sectorLimitOne.sectorLineLength then
			length1 = nmi2metres(sectorLimit.sectorLimitOne.sectorLineLength:ToNumber())
			crs1 = 'GeographicCRS'
		else
			length1 = 25.0
			crs1 = 'LocalCRS'
		end
		
		if sectorLimit.sectorLimitTwo.sectorLineLength then
			length2 = nmi2metres(sectorLimit.sectorLimitTwo.sectorLineLength:ToNumber())
			crs2 = 'GeographicCRS'
		else
			length2 = length1
			crs2 = crs1
		end

		-- Draw leg 1
		featurePortrayal:AddInstructions('AugmentedRay:GeographicCRS,' .. sectorLimit1 .. ',' .. crs1 .. ',' .. length1)
		featurePortrayal:SimpleLineStyle('dash',0.32,'CHBRN')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
		
		-- Draw leg 2
		featurePortrayal:AddInstructions('AugmentedRay:GeographicCRS,' .. sectorLimit2 .. ',' .. crs2 .. ',' .. length2)
		featurePortrayal:AddInstructions('LineInstruction:_simple_')

		featurePortrayal:AddInstructions('ArcByRadius:0,0,20,' .. sectorLimit1 .. ',' .. sectorLimit2 - sectorLimit1)
		featurePortrayal:AddInstructions('AugmentedPath:LocalCRS,GeographicCRS,LocalCRS')

		featurePortrayal:AddInstructions('ClearGeometry')
	end
end
