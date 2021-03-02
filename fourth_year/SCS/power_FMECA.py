power_FMECA = { 
        "sea_flood":{
                "frequent":{
                    "failure":"Complete",
                    "failure_effect":"Sea levels rise, permanently destroying area for power lines",
                    "severity" :7,
                    "occurrence":10,
                    "detection_method":"Tracking rising tides",
                    "detection_index":1, 
                    "mitigation":"Building sea dykes or raise height of power lines",
		            "RPN": 70
                    },
                "probable":{
                    "failure":"Intermittent/Gradual",
                    "failure_effect":"Sea levels rise, leading to tidal patterns that can sometimes flood the track, rusting equipment and destroy power lines",
                    "severity" : 6,
                    "occurrence": 5,
                   "detection_method":"Tracking tides and checking rails for rust",
                    "detection_index":4,
                    "mitigation":"Raise height power lines",
		            "RPN": 120
                    }
                },
        "soil_erosion":{
                "frequent":{
                    "failure":"Gradual",
                    "failure_effect":"soil is eroded surround power line supports, causing them to fall over and sustain damage" ,
                    "severity" :7,
                    "occurrence":6,
                    "detection_method":"Rainfall meters and manual inspections",
                    "detection_index":4,
                    "mitigation":"Reinforce surrounding areas or consider power lines to sturdier ground",
		            "RPN": 168
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Soil is eroded on and away , making the power lines supports uneven and risk touching surroundings" ,
                    "severity" :5,
                    "occurrence":5,
                    "detection_method":"Manual inspections",
                    "detection_index":4,
                    "mitigation":"Reinforce surrounding areas",
		            "RPN": 100
                    }
                },
        
        "river_flooding" : {
                "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Bursting of river banks destroying or washing away power lines",
                    "severity" :7,
                    "occurrence":4,
                    "detection_method":"Monitoring rainfall and river levels",
                    "detection_index":5,
                    "mitigation":"Raise height of power lines and consider building man made levies",
		           "RPN":140
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Flooding of track, possibly shorting power lines",
                    "severity" :6,
                    "occurrence":4,
                    "detection_method":"Monitoring Rainfall",
                    "detection_index": 4,
                    "mitigation":"Raise height of power lines",
		            "RPN":96
                    }
                },
        
        "land_flooding":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and destroys power lines ",
                    "severity" :7,
                    "occurrence":5,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Invest in more drainage for area. Raise height power lines",
		            "RPN":175
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and cover track in water, ",
                    "severity" :6,
                    "occurrence":6,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Raise height of power lines",
		            "RPN": 180
                    }
                },
           
        "temp":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Power lines expand,reducing resistance, increase current and catch fire ",
                    "severity" :9,
                    "occurrence":3,
                    "detection_method":"Temperature sensors",
                    "detection_index":2,
                    "mitigation":"Reduce transmissions values. Readjust time schedule to avoid warmest time of day",
		            "RPN":54
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Increase in temperature could cause power lines to sage",
                    "severity" :4,
                    "occurrence":6,
                    "detection_method":"Temperature sensors",
                    "detection_index":2,
                    "mitigation":"Reduce transmissions values. Readjust time schedule to avoid warmest time of day",
		            "RPN":48
		    }
                },
        "landslide" : {
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Landslide destroys or obstruct power lines",
                    "severity" :8,
                    "occurrence":4,
                    "detection_method":"Rainfall and vibrations sensors. Soil analysis",
                    "detection_index":7,
                    "mitigation":"Invest in landslide cages and barriers",
		            "RPN":224
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"small landslides damage(falling rocks) power lines",
                    "severity" :6,
                    "occurrence":5,
                    "detection_method":"Inspections of tracks",
                    "detection_index":4,
                    "mitigation":"Invest in landslide nets",
		           "RPN": 120
                    }
                }
        }
