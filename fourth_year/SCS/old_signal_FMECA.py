signal_FMECA = { 
        "sea_flood":{
                "frequent":{
                    "failure":"Complete",
                    "failure_effect":"Sea levels rise, permantly destroying area for electronics",
                    "severity" :6,
                    "occurence":10,
                    "dectection_method":"Tracking rising tides",
                    "dectection_index":1, 
                    "mitigation":"Building sea dykes or converting raise height of electronics"
                    },
                "probable":{
                    "failure":"Intermittent/Gradual",
                    "failure_effect":"Sea levels rise, leading to tidal patterns that can sometimes flood the track, rusting equipment and destroy electronice",
                    "severity" : 5,
                    "occurence": 6,
                    "dectection_method":"Tracking tides and checking rails for rust",
                    "dectection_index":4,
                    "mitigation":"Raise height/waterproof electronics",
                    }
                },
        "soil_erosion":{
                "frequent":{
                    "failure":"Gradual",
                    "failure_effect":"soil is eroded surround electronic supports, causing them to fall over and sustain damage" ,
                    "severity" :5,
                    "occurence":7,
                    "dectection_method":"Manual inspections",
                    "dectection_index":4,
                    "mitigation":"Renforce surrounding areas or consider electronics to sturdier ground",
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Soil is eroded on and away from tracks, making the electronics supports  uneven" ,
                    "severity" :3,
                    "occurence":5,
                    "dectection_method":"Manual inspections",
                    "dectection_index":4,
                    "mitigation":"Renforce surrounding areas",
                    }
                },
        
        "river_flooding" : {
                "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Bursting of river banks destroying or washing away electronic signals",
                    "severity" :5,
                    "occurence":5,
                    "dectection_method":"Monitoring rainfall and river levels",
                    "dectection_index":5,
                    "mitigation":"Raise height of electronics and consider building man made levies",
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Flooding of track, possibly shorting electronics",
                    "severity" :4,
                    "occurence":4,
                    "dectection_method":"Monitoring Rainfall",
                    "dectection_index": 4,
                    "mitigation":"Raise height of electronics",
                    }
                },
        
        "land_flooding":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain waterlogs land and destroys electronics ",
                    "severity" :5,
                    "occurence":6,
                    "dectection_method":"Rainfall meters",
                    "dectection_index":6,
                    "mitigation":"Invest in more draingage for area. Raise height electronics "
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain waterlogs land and cover track in water, ",
                    "severity" :5,
                    "occurence":5,
                    "dectection_method":"Rainfall meters",
                    "dectection_index":6,
                    "mitigation":"Raise height of electronics"
                    }
                },
           
        "temp":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Electronics overheat and stop working",
                    "severity" :5,
                    "occurence":3,
                    "dectection_method":"Temperature sensorsi, cooling systems for electronics",
                    "dectection_index":4,
                    "mitigation":"Electronic cooling. Readjust time schedule to avoid warmest time of day"
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Increase in temperature could reduce electronics lifetime",
                    "severity" :5,
                    "occurence":6,
                    "dectection_method":"Monitor weather forecase",
                    "dectection_index":2,
                    "mitigation":"Electronic cooling"
                    }
                },
        "landslide" : {
                    "frequent":{
                    "failure":"Itermittent",
                    "failure_effect":"Landslide destroys or obstruct electronics",
                    "severity" :5,
                    "occurence":4,
                    "dectection_method":"Rainfall and vibrations sensors. Soil anaylsis",
                    "dectection_index":7,
                    "mitigation":"Invest in landslde cages and barriers"
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"small landslides damage(falling rocks) electronics",
                    "severity" :4,
                    "occurence":6,
                    "dectection_method":"Inspections of tracks",
                    "dectection_index":4,
                    "mitigation":"Invest in landslide nets"
                    }
                }
        }
