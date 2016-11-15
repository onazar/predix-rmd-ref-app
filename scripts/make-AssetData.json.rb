#!/usr/bin/ruby
# Usage:
# ruby make-AssetData.json.rb 2001 2009 > AssetData.json
#
# This will create data to put in the file public/sample-data/compressor.json
# that allows creating an arbitrary number of compressors
# TODO: Write a grunt task to automate this
#
#
first, last = [2001, 2009]
if (ARGV[1]) then
    first, last = [ARGV[0].to_i, ARGV[1].to_i]
end
if (first < 2000 || last > 2999 || last < first) then
    raise "\nUsage: #{$0} <first> <last>\nfirst, last must be between 2000 and 2999"
end

puts <<ASSET_DATA
{
	"tags": [{
		"uri": "/tag/c5-c6-isomerization-reactor-output",
		"name": "Octane Number",
		"description": "C5/C6 isomerization process",
		"dataType": "number",
		"tagType": "Continuous",
		"defaultTag": []
	}, {
		"uri": "/tag/crank-frame-compressionratio",
		"name": "crank-frame-compressionratio",
		"description": "Crank Frame Compression Ratio",
		"dataType": "number",
		"tagType": "Continuous",
		"defaultTag": []
	}, {
ASSET_DATA

(first .. last).each do |i|
    puts <<-ASSET_DATA
                "uri": "/tag/crank-frame-compressionratio-#{i}",
                "name": "crank-frame-compressionratio-#{i}",
                "description": "Crank Frame Compression Ratio",
                "dataType": "number",
                "tagType": "Continuous",
                "defaultTag": []
        }, {
    ASSET_DATA
end

puts <<ASSET_DATA
		"uri": "/tag/crank-frame-dischargepressure",
		"name": "crank-frame-dischargepressure",
		"description": "Crank Frame Discharge Pressure",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "psi",
		"defaultTag": []
	}, {
		"uri": "/tag/crank-frame-maxpressure",
		"name": "crank-frame-maxpressure",
		"description": "Crank Frame Max Pressure",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "psi",
		"defaultTag": []
	}, {
		"uri": "/tag/crank-frame-minpressure",
		"name": "crank-frame-minpressure",
		"description": "Crank Frame Min Pressure",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "psi",
		"defaultTag": []
	}, {
		"uri": "/tag/crank-frame-suctionpressure",
		"name": "crank-frame-suctionpressure",
		"description": "Crank Frame Suction Pressure",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "psi",
		"defaultTag": []
	}, {
		"uri": "/tag/crank-frame-temperature",
		"name": "crank-frame-temperature",
		"description": "Crank Frame Temperature",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "F",
		"defaultTag": []
	}, {
ASSET_DATA

(first .. last).each do |i|
    puts <<-ASSET_DATA
		"uri": "/tag/crank-frame-velocity-#{i}",
		"name": "crank-frame-velocity-#{i}",
		"description": "Crank Frame Velocity",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "m/s",
		"defaultTag": []
	}, {
    ASSET_DATA
end

puts <<ASSET_DATA
		"uri": "/tag/crank-frame-velocity",
		"name": "crank-frame-velocity",
		"description": "Crank Frame Velocity",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "m/s",
		"defaultTag": []
	}, {
		"uri": "/tag/summary-output-mbd",
		"name": "summary-output-mbd",
		"description": "C5/C6 isomerization process summary output in mbd",
		"dataType": "number",
		"tagType": "Continuous",
		"uom": "mb/d",
		"defaultTag": []
	}],
	"groups": [{
		"parent": "/group/root",
		"description": "Predix Energy",
		"uri": "/group/enterprise-predix",
		"level": "enterprise",
		"name": "Predix Energy"
	}, {
		"parent": "/group/root",
		"description": "San Ramon Oil",
		"uri": "/group/enterprise-san-ramon",
		"level": "enterprise",
		"name": "San Ramon Oil"
	}, {
		"parent": "/group/site-richmond",
		"description": "Refinery",
		"uri": "/group/plant-richmond-refinery",
		"level": "plant",
		"name": "Richmond Refinery 1"
	}, {
		"parent": "/group/enterprise-predix",
		"description": "South Africa - Cape Town",
		"uri": "/group/site-capetown",
		"level": "site",
		"name": "South Africa, Cape Town"
	}, {
		"parent": "/group/enterprise-predix",
		"description": "Richmond",
		"uri": "/group/site-richmond",
		"level": "site",
		"name": "Richmond"
	}],
	"classifications": [{
		"description": "Asset Tag Extensions",
		"uri": "/classification/Asset-Tag-Extensions",
		"name": "/classification/Asset-Tag-Extensions",
		"obsolete": false,
		"attributes": {
			"alertStatus": {
				"enumeration": [],
				"value": []
			},
			"alertType": {
				"enumeration": [],
				"value": [
					"Calculated"
				]
			},
			"alertLevel": {
				"enumeration": [],
				"value": []
			},
			"alertLevelValue": {
				"enumeration": [],
				"value": []
			},
			"alertTime": {
				"enumeration": [],
				"value": []
			},
			"deltaThresholdColor": {
				"enumeration": [],
				"value": []
			},
			"deltaThresholdDirection": {
				"enumeration": [],
				"value": []
			},
			"deltaThresholdLevel": {
				"enumeration": [],
				"value": []
			},
			"deltaThreshold": {
				"enumeration": [],
				"value": []
			},
			"sourceType": {
				"enumeration": [],
				"value": []
			},
			"fieldSourceUri": {
				"enumeration": [],
				"value": []
			},
			"fieldUri": {
				"enumeration": [],
				"value": []
			}
		},
		"tags": []
	}, {
		"description": "Device",
		"uri": "/classification/device",
		"name": "device",
		"obsolete": false,
		"attributes": {
			"deviceType": {
				"enumeration": [],
				"value": []
			},
			"deviceName": {
				"enumeration": [],
				"value": []
			},
			"deviceId": {
				"enumeration": [],
				"value": []
			}
		},
		"tags": []
	}, {
		"description": "Field",
		"uri": "/classification/field",
		"name": "field",
		"obsolete": false,
		"attributes": {
			"fieldId": {
				"enumeration": [],
				"value": []
			},
			"fieldType": {
				"enumeration": [],
				"value": []
			}
		},
		"tags": []
	}, {
		"description": "Field Source Info",
		"uri": "/classification/fieldSourceInfo",
		"name": "/classification/fieldSourceInfo",
		"obsolete": false,
		"attributes": {
			"sourceType": {
				"enumeration": [],
				"value": []
			},
			"sourceName": {
				"enumeration": [],
				"value": []
			},
			"sourcePropertyName": {
				"enumeration": [],
				"value": []
			},
			"timePropertyName": {
				"enumeration": [],
				"value": []
			},
			"timePropertyUnit": {
				"enumeration": [],
				"value": []
			},
			"defaultOsacbmDataType": {
				"enumeration": [],
				"value": []
			},
			"queryDetail": {
				"enumeration": [],
				"value": []
			},
			"updateDetail": {
				"enumeration": [],
				"value": []
			},
			"fieldId": {
				"enumeration": [],
				"value": []
			}
		},
		"tags": []
	}, {
		"parent": "/classification/GasTurbine",
		"description": "Gas Turbine",
		"uri": "/classification/GasTurbineLate2014",
		"name": "/classification/GasTurbineLate2014",
		"obsolete": false,
		"tags": []
	}, {
		"parent": "/classification/GE_COMPRESSOR_CYLINDER",
		"description": "/classification/GE_COMPRESSOR_CYLINDER",
		"uri": "/classification/GE_COMPRESSOR_CYLINDER",
		"name": "/classification/GE_COMPRESSOR_CYLINDER",
		"obsolete": false,
		"tags": []
	}],
	"assets": [{
		"complexType": "Asset",
		"uri": "/asset/1",
		"name": "my sample asset",
		"assetTag": {
			"pressure": {
				"complexType": "AssetTag",
				"tagUri": "/pressure",
				"outputMinimum": 0,
				"outputMaximum": 0,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0
			}
		}
ASSET_DATA
(first .. last).each do |i|
    puts <<-ASSET_DATA
	}, {
		"complexType": "Asset",
		"uri": "/asset/compressor-#{i}",
		"classificationUri": "/classification/GE_COMPRESSOR_CYLINDER",
		"assetId": "compressor-#{i}",
		"description": "Bently Compressor #{i}",
		"group": "/group/plant-richmond-refinery",
		"parentUri": "/asset/compressor-1234",
		"assetTag": {
			"crank-frame-compressionratio-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-compressionratio-#{i}",
				"sourceTagId": "Compressor-#{i}:CompressionRatio",
				"outputMinimum": 2.5,
				"outputMaximum": 3,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:CompressionRatio",
					"isKpi": "true",
					"fieldUri": "asset/adh-field-123",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:CompressionRatio"
				}
			},
			"crank-frame-dischargepressure-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-dischargepressure-#{i}",
				"sourceTagId": "Compressor-#{i}:DischargePressure",
				"outputMinimum": 1,
				"outputMaximum": 22,
				"hiAlarmThreshold": 20,
				"loAlarmThreshold": 10,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:DischargePressure",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:DischargePressure",
					"tagExtensionsUri": "/asset/compressor-#{i}.tag-extensions.crank-frame-discharge-pressure"
				}
			},
			"crank-frame-suctionpressure-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-suctionpressure-#{i}",
				"sourceTagId": "Compressor-#{i}:SuctionPressure",
				"outputMinimum": 0,
				"outputMaximum": 0.21,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:SuctionPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:SuctionPressure"
				}
			},
			"crank-frame-maxpressure-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-maxpressure-#{i}",
				"sourceTagId": "Compressor-#{i}:MaximumPressure",
				"outputMinimum": 22,
				"outputMaximum": 26,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:MaximumPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:MaximumPressure"
				}
			},
			"crank-frame-minpressure-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-minpressure-#{i}",
				"sourceTagId": "Compressor-#{i}:MinimumPressure",
				"outputMinimum": 0,
				"outputMaximum": 0,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:MinimumPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:MinimumPressure"
				}
			},
			"crank-frame-velocity-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-velocity-#{i}",
				"sourceTagId": "Compressor-#{i}:Velocity",
				"outputMinimum": 0,
				"outputMaximum": 0.07,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:Velocity",
					"isKpi": "true",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:Velocity"
				}
			},
			"crank-frame-temperature-#{i}": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-temperature-#{i}",
				"sourceTagId": "Compressor-#{i}:Temperature",
				"outputMinimum": 65,
				"outputMaximum": 80,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:Temperature",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:Temperature"
				}
			}
		},
		"attributes": {
			"machineControllerId": {
				"complexType": "Attribute",
				"type": "string",
				"enumeration": [],
				"value": [
					"/asset/Bently.Nevada.3500.Rack#{i}"
				]
			},
			"summaryTag": {
				"complexType": "Attribute",
				"type": "string",
				"enumeration": [],
				"value": [
					"crank-frame-velocity-#{i}",
					"crank-frame-compressionratio-#{i}"
				]
			}
		}
	}, {
		"complexType": "Asset",
		"uri": "/asset/compressor-#{i}.tag-extensions.crank-frame-discharge-pressure",
		"classificationUri": "/classification/Asset-Tag-Extensions",
		"assetId": "/asset/compressor-#{i}.tag-extensions.crank-frame-discharge-pressure",
		"attributes": {
			"alertStatus": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"false"
				]
			},
			"alertType": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"Analytic"
				]
			},
			"alertLevel": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"alertLevelValue": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"alertTime": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdColor": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdDirection": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdLevel": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThreshold": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"sourceType": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"PredixTimeseries"
				]
			},
			"fieldSourceUri": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"fieldUri": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			}
		}
    ASSET_DATA
end

puts <<ASSET_DATA
	}, {
		"complexType": "Asset",
		"uri": "/asset/compressor-2015",
		"classificationUri": "/classification/GE_COMPRESSOR_CYLINDER",
		"assetId": "compressor-2015",
		"description": "Bently Compressor 2015",
		"group": "/group/plant-richmond-refinery",
		"parentUri": "/asset/compressor-1234",
		"assetTag": {
			"crank-frame-compressionratio": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-compressionratio",
				"sourceTagId": "Compressor-2015:CompressionRatio",
				"outputMinimum": 2.5,
				"outputMaximum": 3,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:CompressionRatio",
					"isKpi": "true",
					"fieldUri": "asset/adh-field-123",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:CompressionRatio"
				}
			},
			"crank-frame-dischargepressure": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-dischargepressure",
				"sourceTagId": "Compressor-2015:DischargePressure",
				"outputMinimum": 0,
				"outputMaximum": 23,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:DischargePressure",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:DischargePressure",
					"tagExtensionsUri": "/asset/compressor-2015.tag-extensions.crank-frame-discharge-pressure"
				}
			},
			"crank-frame-suctionpressure": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-suctionpressure",
				"sourceTagId": "Compressor-2015:SuctionPressure",
				"outputMinimum": 0,
				"outputMaximum": 0.21,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:SuctionPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:SuctionPressure"
				}
			},
			"crank-frame-maxpressure": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-maxpressure",
				"sourceTagId": "Compressor-2015:MaximumPressure",
				"outputMinimum": 22,
				"outputMaximum": 26,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:MaximumPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:MaximumPressure"
				}
			},
			"crank-frame-minpressure": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-minpressure",
				"sourceTagId": "Compressor-2015:MinimumPressure",
				"outputMinimum": 0,
				"outputMaximum": 0,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:MinimumPressure",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:MinimumPressure"
				}
			},
			"crank-frame-velocity": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-velocity",
				"sourceTagId": "Compressor-2015:Velocity",
				"outputMinimum": 0,
				"outputMaximum": 0.07,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:Velocity",
					"isKpi": "true",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:Velocity"
				}
			},
			"crank-frame-temperature": {
				"complexType": "AssetTag",
				"tagUri": "/tag/crank-frame-temperature",
				"sourceTagId": "Compressor-2015:Temperature",
				"outputMinimum": 65,
				"outputMaximum": 80,
				"hiAlarmThreshold": 0,
				"loAlarmThreshold": 0,
				"tagDatasource": {
					"nodeName": "Compressor-2015:Temperature",
					"fieldUri": "asset/adh-field-456",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:Temperature"
				}
			}
		},
		"attributes": {
			"machineControllerId": {
				"complexType": "Attribute",
				"type": "string",
				"enumeration": [],
				"value": [
					"/asset/Bently.Nevada.3500.Rack1"
				]
			},
			"summaryTag": {
				"complexType": "Attribute",
				"type": "string",
				"enumeration": [],
				"value": [
					"crank-frame-velocity",
					"crank-frame-compressionratio"
				]
			}
		}
	}, {
		"complexType": "Asset",
		"uri": "/asset/compressor-2015.tag-extensions.crank-frame-discharge-pressure",
		"classificationUri": "/classification/Asset-Tag-Extensions",
		"assetId": "/asset/compressor-2015.tag-extensions.crank-frame-discharge-pressure",
		"attributes": {
			"alertStatus": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"false"
				]
			},
			"alertType": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"Analytic"
				]
			},
			"alertLevel": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"alertLevelValue": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"alertTime": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdColor": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdDirection": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThresholdLevel": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"deltaThreshold": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"sourceType": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": [
					"PredixTimeseries"
				]
			},
			"fieldSourceUri": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			},
			"fieldUri": {
				"complexType": "Attribute",
				"enumeration": [],
				"value": []
			}
		}
	}, {
		"complexType": "Asset",
		"uri": "/asset/plant-richmond-refinery-summary",
		"description": "Summary for Richmond Plant",
		"obsolete": false,
		"empty": false,
		"assetId": "plant-richmond-refinery-summary",
		"propagateState": false,
		"group": "/asset/plant-richmond-refinery-summary/group",
		"attributes": {
			"summary": {
				"enumeration": [],
				"value": [
					"/group/plant-richmond-refinery"
				]
			},
			"summaryTag": {
				"type": "string",
				"enumeration": [],
				"value": [
					"crank-frame-dischargepressure",
					"crank-frame-compressionratio"
				]
			}
		},
		"tags": [],
		"tags": {
			"isomerization-reactor-output1": {
				"complexType": "AssetTag",
				"uri": "/tag/c5-c6-isomerization-reactor-output",
				"sourceTagId": "isomerization-reactor-output1",
				"tagDatasource": {
					"isKpi": "true"
				},
				"isManual": false,
				"outputMinimum": 72,
				"outputMaximum": 100
			},
ASSET_DATA

(first .. last).each do |i|
    puts <<-ASSET_DATA
			"crank-frame-dischargepressure-#{i}": {
				"complexType": "AssetTag",
				"uri": "/tag/crank-frame-dischargepressure",
				"sourceTagId": "Compressor-#{i}:DischargePressure",
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:DischargePressure",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:DischargePressure",
					"tagExtensionsUri": "/asset/compressor-#{i}.tag-extensions.crank-frame-discharge-pressure"
				},
				"isManual": false,
				"outputMinimum": 0,
				"outputMaximum": 23
			},
			"crank-frame-compressionratio-#{i}": {
				"complexType": "AssetTag",
				"uri": "/tag/crank-frame-compressionratio",
				"sourceTagId": "Compressor-#{i}:CompressionRatio",
				"tagDatasource": {
					"nodeName": "Compressor-#{i}:CompressionRatio",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-#{i}:CompressionRatio"
				},
				"isManual": false,
				"outputMinimum": 2.5,
				"outputMaximum": 3
			},
    ASSET_DATA
end
puts <<ASSET_DATA
			"crank-frame-dischargepressure": {
				"complexType": "AssetTag",
				"uri": "/tag/crank-frame-dischargepressure",
				"sourceTagId": "Compressor-2015:DischargePressure",
				"tagDatasource": {
					"nodeName": "Compressor-2015:DischargePressure",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:DischargePressure",
					"tagExtensionsUri": "/asset/compressor-2015.tag-extensions.crank-frame-discharge-pressure"
				},
				"isManual": false,
				"outputMinimum": 0,
				"outputMaximum": 23
			},
			"crank-frame-compressionratio": {
				"complexType": "AssetTag",
				"uri": "/tag/crank-frame-compressionratio",
				"sourceTagId": "Compressor-2015:CompressionRatio",
				"tagDatasource": {
					"nodeName": "Compressor-2015:CompressionRatio",
					"isKpi": "true",
					"controllerUri": "/sample/machine/controller",
					"machineUri": "/Compressor-2015:CompressionRatio"
				},
				"isManual": false,
				"outputMinimum": 2.5,
				"outputMaximum": 3
			}
		}
	}, {
		"uri": "/asset/rmd_user_test_asset556"
	}]
}
ASSET_DATA
