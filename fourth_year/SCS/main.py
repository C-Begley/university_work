VERTSEALEVELRATE = 0.0033 #milimeters
HORSEALEVELRATE = 100 * VERTSEALEVELRATE
RAINFALLRATE = 0.016  #17% increase from 2008-17
TEMPRATE = 0.113 #5.8 by 2070
TRAINTEMPFACTOR = 20 # Higher temperature in railways
HEAVYRAINFACTOR = 0.05 #Heavy rain average factor
from rail_FMECA import rail_FMECA
from signal_FMECA import signal_FMECA
from power_FMECA import power_FMECA
import json
import csv

SOILS = {
        "sand":{"erode":0.03, "perm":0.05},    
        "sandy loam":{"erode":0.24, "perm":0.025}, 
        "loam":{"erode":0.34, "perm":0.013}, 
        "clay loam":{"erode":0.28, "perm":0.008}, 
        "silty loam":{"erode":0.42, "perm":0.0025},
        "clay": {"erode":0.2, "perm":0.0005}
        }

def anaylise(file_name, types="json"):
    with open(file_name+".txt") as json_in:
        data = json.load(json_in)
    rail_results = calculate_prob(data, "RAIL")
    signal_results = calculate_prob(data, "SIGNAL")
    power_results = calculate_prob(data, "POWER")
    
    if types == "csv":
        report_csv(file_name, rail_results, signal_results, power_results)
    else:
        report_json(file_name, rail_results, signal_results, power_results)

def report_csv(file_name, rail_results, signal_results, power_results):
    rail_report = generate_csv(rail_results, rail_FMECA)
    signal_report = generate_csv(signal_results, signal_FMECA)
    power_report = generate_csv(power_results, power_FMECA)
    
    with open(file_name+'_rail_results.csv', 'w') as csvfile:
        csv_columns = list(rail_report[0].keys())
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in rail_report:
            writer.writerow(data)
    with open(file_name+'_signal_results.csv', 'w') as csvfile:
        csv_columns = list(signal_report[0].keys())
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in signal_report:
            writer.writerow(data)
    with open(file_name+'_power_results.csv', 'w') as csvfile:
        csv_columns = list(power_report[0].keys())
        writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
        writer.writeheader()
        for data in power_report:
            writer.writerow(data)

def report_json(file_name, rail_results, signal_results, power_results):
    rail_report = generate_json(rail_results, rail_FMECA)
    signal_report = generate_json(signal_results, signal_FMECA)
    power_report = generate_json(power_results, power_FMECA)
    
    with open(file_name+'_rail_results.txt', 'w') as json_out:
        json.dump(rail_report, json_out, indent=4)
    with open(file_name+'_signal_results.txt', 'w') as json_out:
        json.dump(signal_report, json_out, indent=4)
    with open(file_name+'_power_results.txt', 'w') as json_out:
        json.dump(power_report, json_out, indent=4)

def calculate_prob(data,types):
    results = {}
    results["sea_flood"] = check_sea_lvl(data["sea_distance"], data["years"])
    results["soil_erosion"] = check_soil_eroision(data["rain"], data["soil_type"],data["years"])
    results["river_flooding"] = check_river_flooding(data["river_distance"], data["max_river_height"]-data["river_height"], data["rain"],data["years"])
    results["land_flooding"] = check_land_flooding(data["soil_type"],data["rain"], data["years"]) 
    results["landslide"] = check_landslide(data["slope"], data["soil_type"], data["rain"],data["years"])
    
    if types == "RAIL":
        results["track_erosion"] = check_track_erosion(data["rain"], data["years"])
        results["temp"] = check_temp(data["max_temp"]+20,data["years"])
    elif types == "POWER":
        results["wind"] = "probable"
        results["temp"] = check_temp(data["max_temp"],data["years"])

    return results

def check_sea_lvl(dist, years):
    if dist == "N/A":
        return "N/A"
    else:
        coverage = years*HORSEALEVELRATE
        if coverage >= dist:
            return "frequent"
        elif coverage >= dist + dist/5: #Within 20%
            return "probable"
        else:
            return "improbable"

def check_soil_eroision(rain, soiltype,years):
    if soiltype == "N/A":
        return "N/A"
    soil = SOILS[soiltype]
    rain = rain*((1+RAINFALLRATE)**years)
    ero = rain*soil["erode"]
    if ero >= 1:
        return "frequent"
    elif ero >= 0.5 :
        return "probable"
    else:
        return "improbable"
    pass

def check_track_erosion(rain,years):
    rain = rain*((1+RAINFALLRATE)**years)
    if rain * HEAVYRAINFACTOR >= 0.1:
        return "frequent"
    elif rain * HEAVYRAINFACTOR >= 0.05:
        return "probable"
    else:
        return "improbable"
    
def check_river_flooding(dist, cap, rain, years):
    if dist == "N/A":
        return "N/A"
    rain = rain*((1+RAINFALLRATE)**years)*HEAVYRAINFACTOR*6
    if rain >= cap and (rain-cap)*HORSEALEVELRATE >= dist :
        return "frequent"
    elif rain >= 3/5*cap and (rain-cap)*HORSEALEVELRATE >= 3/5*dist :
        return "probable"
    else:
        return "improbable"

def check_land_flooding(soiltype,rain, years):
    if soiltype == "N/A":
        return "N/A"
    rain = rain*((1+RAINFALLRATE)**years)
    soil = SOILS[soiltype]
    flo = (rain*HEAVYRAINFACTOR - soil["perm"]*2)
    if flo >= 0.3:
        return "frequent"
    elif flo >= 0.1:
        return "probable"
    else:
        return "improbable"

def check_temp(region_temp,years):
    temp = region_temp+TEMPRATE*years
    rail_temp = temp + TRAINTEMPFACTOR
    if rail_temp >= 65:
        return "frequent"
    elif rail_temp >= 40:
        return "probable"
    else:
        return "improbable"

def check_landslide(slope, soil,rain, years):
    if slope == "N/A" or soil == "N/A":
        return "N/A"
    soil = SOILS[soil]
    rain = rain*((1+RAINFALLRATE)**years)
    rain = rain  * HEAVYRAINFACTOR
    slide = slope * (rain - soil["perm"]*6)
    if slide >= 3:
        return "frequent"
    elif slide >=1 :
        return "probable"
    else:
        return "improbable"

def generate_json(result, type_FMECA):
    report = {}
    for key,item in result.items():
        if item != "N/A":
            if item == "improbable" or key not in type_FMECA.keys():
                report[key] = "Not an issue"
            else:
                report[key] = type_FMECA[key][item]
                report[key]["liklihood"] = item
        else:
            report[key] ="N/A"
    return report

def generate_csv(result, type_FMECA):
    report = []
    for key,item in result.items():
        if item != "N/A":
            if item != "improbable" and key in type_FMECA.keys():
                r = type_FMECA[key][item]
                r["liklihood"] = item
                r["event"] = key
                report.append(r)
    return report


