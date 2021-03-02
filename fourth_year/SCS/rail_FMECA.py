rail_FMECA = { 
        "sea_flood":{
                "frequent":{
                    "failure":"Complete",
                    "failure_effect":"Sea levels rise, permanently flooding the track",
                    "severity" :9,
                    "occurrence":10,
                    "detection_method":"Tracking rising tides",
                    "detection_index":1, 
                    "mitigation":"Building sea dykes or converting low lying tracks to bridges or higher locations",
                    "RPN": 90
                    },
                "probable":{
                    "failure":"Intermittent/Gradual",
                    "failure_effect":"Sea levels rise, leading to tidal patterns that can sometimes flood the track, rusting equipment and slowing down trains",
                    "severity" : 7,
                    "occurrence": 5,
                    "detection_method":"Tracking tides and checking rails for rust",
                    "detection_index":2,
                    "mitigation":"Building sea dykes or converting low lying tracks to bridges",
                    "RPN": 70
                    }
                },
        "soil_erosion":{
                "frequent":{
                    "failure":"Gradual",
                    "failure_effect":"Soil is eroded on and away from tracks, making the tracks uneven to the point of danger of derailing" ,
                    "severity" :7,
                    "occurrence":6,
                    "detection_method":"Rainfall meters vibration sensors and soil checks",
                    "detection_index":4,
                    "mitigation":"Reinforce surrounding areas or consider moving tracks",
                    "RPN":168
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Soil is eroded on and away from tracks, making the tracks uneven" ,
                    "severity" :5,
                    "occurrence":5,
                    "detection_method":"Manual inspections",
                    "detection_index":4,
                    "mitigation":"Reinforce surrounding areas",
                    "RPN": 100
                    }
                },
        "track_erosion":{
                "frequent":{
                    "failure":"Gradual",
                    "failure_effect":"Ballast is washed away making tracks too unstable to run trains on",
                    "severity" :7,
                    "occurrence":7,
                    "detection_method":"Rainfall meters and vibration sensors",
                    "detection_index":5,
                    "mitigation":"Regularly check ballast and consider adding cages",
                    "RPN": 245
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Ballast is loosened, making tracks unstable",
                    "severity" :4,
                    "occurrence":5,
                    "detection_method": "Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Regularly check ballast",
                    "RPN": 100
                    }
                },
        "river_flooding" : {
                "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Bursting of river banks seriously flooding tracks and damaging structures",
                    "severity" :7,
                    "occurrence":5,
                    "detection_method":"Monitoring rainfall and river levels",
                    "detection_index":5,
                    "mitigation":"Reinforce structures and consider building man made levies",
                    "RPN": 175
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Flooding of track, slowing train speeds",
                    "severity" :5,
                    "occurrence":4,
                    "detection_method":"Monitoring Rainfall",
                    "detection_index": 4,
                    "mitigation":"Consider building man made levies",
                    "RPN": 120
                    }
                },
        "land_flooding":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and submerges tracks, stopping trains ",
                    "severity" :7,
                    "occurrence":5,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Invest in more drainage for area. Consider raising tracks",
                    "RPN":175
                    },
                "probable":{
                    "failure":"Intermittent",
                    "failure_effect":"Intense rain water logs land and cover track in water, slowing trains",
                    "severity" :6,
                    "occurrence":6,
                    "detection_method":"Rainfall meters",
                    "detection_index":5,
                    "mitigation":"Invest in more drainage for area",
                    "RPN":180
                    }
                },
           
        "temp":{
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Tracks get too hot for trains to run without damaging tracks",
                    "severity" :6,
                    "occurrence":4,
                    "detection_method":"Temperature sensors",
                    "detection_index":"2",
                    "mitigation":"Readjust time schedule to avoid warmest time of day",
                    "RPN":48
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"Tracks bend and warp due to heat and trains running on them",
                    "severity" :4,
                    "occurrence":6,
                    "detection_method":"Temperature sensors",
                    "detection_index":"2",
                    "mitigation":"Run trains at lower speeds",
                    "RPN": 48
                    }
                },
        "landslide" : {
                    "frequent":{
                    "failure":"Intermittent",
                    "failure_effect":"Landslide destroys and buries tracks",
                    "severity" :8,
                    "occurrence":4,
                    "detection_method":"Rainfall and vibrations sensors. Soil analysis",
                    "detection_index":7,
                    "mitigation":"Invest in landslide cages and barriers",
                    "RPN":224
                    },
                "probable":{
                    "failure":"Gradual",
                    "failure_effect":"small landslides damage(falling rocks) tracks",
                    "severity" :4,
                    "occurrence":5,
                    "detection_method":"Inspections of tracks",
                    "detection_index":7,
                    "mitigation":"Invest in landslide nets",
                    "RPN": 140
                    }
                }
        }
