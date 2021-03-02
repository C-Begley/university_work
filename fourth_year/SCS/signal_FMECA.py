signal_FMECA = { 
        "sea_flood":{
                "frequent":{
                    "failure":"Complete",
                    "failure_effect":"Sea levels rise, permanently destroying area for electronics",
                    "severity" :7,
                    "occurrence":10,
                    "detection_method":"Tracking rising tides",
                    "detection_index":1, 
                    "mitigation":"Building sea dykes or raising height of electronics",
		    "RPN": 70	
                    },
                "probable":{
                    "failure":"Intermittent/Gradual",
                    "failure_effect":"Sea levels rise, leading to tidal patterns that can sometimes flood the track, rusting equipment and destroy electronics",
                    "severity" : 6,
                    "occurrence": 5,
                    "detection_method":"Tracking tides and checking rails for rust",
                    "detection_index":2,
                    "mitigation":"Raise height/waterproof electronics",
                    "RPN":60
                    }
                },
        "soil_erosion":{
                "frequent":{
                    "failure":"Gradual",
                    "failure_effect":"soil is eroded surround electronic supports, causing them to fall over and sustain damage" ,
                    "severity" :6,
                    "occurrence":6,
                    "detection_method":"Rain fall meters and manual inspections",
                    "detection_index":4,
                    "mitigation":"Reinforce surrounding areas or consider electronics to sturdier ground",
                    "RPN": 144
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Soil is eroded on and away from tracks, making the electronics supports  uneven" ,
                    "severity" :4,
                    "occurrence":5,
                    "detection_method":"Manual inspections",
                    "detection_index":5,
                    "mitigation":"Reinforce surrounding areas",
                    "RPN": 100
                    }
                },
        
        "river_flooding" : {
                "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Bursting of river banks destroying or washing away electronic signals",
                    "severity" :7,
                    "occurrence":5,
                    "detection_method":"Monitoring rainfall and river levels",
                    "detection_index":5,
                    "mitigation":"Raise height of electronics and consider building man made levies",
                    "RPN": 175
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Flooding of track, possibly shorting electronics",
                    "severity" :6,
                    "occurrence":4,
                    "detection_method":"Monitoring Rainfall",
                    "detection_index": 4,
                    "mitigation":"Raise height of electronics",
                    "RPN": 96
                    }
                },
        
        "land_flooding":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and destroys electronics ",
                    "severity" :7,
                    "occurrence":5,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Invest in more drainage for area. Raise height electronics",
                    "RPN": 175
                   },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and cover track in water, possibly shorting electronics",
                    "severity" :6,
                    "occurrence":6,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Raise height of electronics",
                    "RPN": 180
                    }
                },
           
        "landslide" : {
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Landslide destroys or obstruct electronics",
                    "severity" :6,
                    "occurrence":4,
                    "detection_method":"Rainfall and vibrations sensors. Soil analysis",
                    "detection_index":7,
                    "mitigation":"Invest in landslide cages and barriers",
                    "RPN": 168
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"small landslides damage(falling rocks) electronics",
                    "severity" :4,
                    "occurrence":5,
                    "detection_method":"Inspections of tracks",
                    "detection_index":7,
                    "mitigation":"Invest in landslide nets",
                    "RPN": 140
                    }
                }
        }
