extends Node

var goods = [
	{
	"Name": "Hydrogen Fuel",
	"ID": "hydrogen_fuel",
	"Description": "Abundant on gas giants; cheaper on planets with advanced technology for efficient extraction.",
	"MinTechLevel": 3,
	"BasePricePerTechLevel": [600, 580, 500, 480, 460, 450, 440, 430, 420, 410]
	},
	{
	"Name": "Oxygen Tanks",
	"ID": "oxygen_tanks",
	"Description": "High demand on planets with harsh climates or lacking atmosphere; price drops on planets with advanced environmental control technology.",
	"MinTechLevel": 4,
	"BasePricePerTechLevel": [800, 780, 760, 750, 730, 710, 690, 670, 650, 630]
	},
	{
	"Name": "Titanium Ore",
	"ID": "titanium_ore",
	"Description": "Cheaper on planets rich in metallic resources; expensive on technologically advanced planets for construction and manufacturing.",
	"MinTechLevel": 2,
	"BasePricePerTechLevel": [1300, 1280, 1200, 1180, 1160, 1140, 1120, 1100, 1080, 1060]
	},
	{
	"Name": "Synthetic Food",
	"ID": "synthetic_food",
	"Description": "Price increases on overpopulated or agriculturally poor planets; cheaper on planets with advanced biotech facilities.",
	"MinTechLevel": 5,
	"BasePricePerTechLevel": [320, 340, 360, 380, 300, 280, 260, 240, 220, 200]
	},
	{
	"Name": "Luxury Textiles",
	"ID": "luxury_textiles",
	"Description": "High demand on wealthy, culturally rich planets; less valuable on low-population or utilitarian societies.",
	"MinTechLevel": 6,
	"BasePricePerTechLevel": [2100, 2080, 2060, 2040, 2020, 2000, 1980, 1960, 1940, 1920]
	},
	{
	"Name": "Quantum Processors",
	"ID": "quantum_processors",
	"Description": "Extremely valuable on technologically backward planets; cheaper on advanced scientific hubs.",
	"MinTechLevel": 9,
	"BasePricePerTechLevel": [12000, 11800, 11600, 11400, 11200, 11000, 10800, 10600, 10000, 9800]
	},
	{
	"Name": "Antimatter Containers",
	"ID": "antimatter_containers",
	"Description": "High demand on technologically advanced military bases; lower demand and price on peaceful or low-tech planets.",
	"MinTechLevel": 10,
	"BasePricePerTechLevel": [60000, 58000, 56000, 54000, 52000, 50000, 48000, 46000, 44000, 42000]
	},
	{
	"Name": "Rare Earth Elements",
	"ID": "rare_earth_elements",
	"Description": "Price varies greatly depending on a planet's natural resource abundance and technological needs.",
	"MinTechLevel": 3,
	"BasePricePerTechLevel": [5200, 5100, 5000, 4900, 4800, 4700, 4600, 4500, 4400, 4300]
	},
	{
	"Name": "Artificial Intelligence Cores",
	"ID": "artificial_intelligence_cores",
	"Description": "Extremely high value on technologically primitive planets; common and less expensive on advanced science worlds.",
	"MinTechLevel": 8,
	"BasePricePerTechLevel": [18000, 17500, 17000, 16500, 16000, 15500, 15000, 14500, 14000, 15000]
	},
	{
	"Name": "Medical Supplies",
	"ID": "medical_supplies",
	"Description": "Essential on war-torn or disease-stricken planets, raising prices; cheaper on planets with advanced healthcare systems.",
	"MinTechLevel": 5,
	"BasePricePerTechLevel": [2700, 2650, 2600, 2550, 2500, 2450, 2400, 2350, 2300, 2250]
	},
	{
	"Name": "Spacecraft Parts",
	"ID": "spacecraft_parts",
	"Description": "High demand on planets with significant space traffic; less valuable on isolated or primitive worlds.",
	"MinTechLevel": 7,
	"BasePricePerTechLevel": [3200, 3150, 3100, 3050, 3000, 2950, 2900, 2850, 2800, 2750]
	},
	{
	"Name": "Exotic Spices",
	"ID": "exotic_spices",
	"Description": "Luxury item, expensive on culturally rich or high-population planets; less valuable on utilitarian or low-population planets.",
	"MinTechLevel": 1,
	"BasePricePerTechLevel": [1900, 1880, 1860, 1840, 1820, 1800, 1780, 1760, 1740, 1720]
	},
	{
	"Name": "Robotics Components",
	"ID": "robotics_components",
	"Description": "More expensive on industrial planets; cheaper on planets with advanced robotics technology.",
	"MinTechLevel": 6,
	"BasePricePerTechLevel": [4700, 4650, 4600, 4550, 4500, 4450, 4400, 4350, 4300, 4250]
	},
	{
	"Name": "Nuclear Waste Disposal",
	"ID": "nuclear_waste_disposal",
	"Description": "Necessary service for planets with nuclear technology; not required on planets with alternative energy sources.",
	"MinTechLevel": 7,
	"BasePricePerTechLevel": [-400, -420, -440, -460, -480, -500, -520, -540, -560, -580]
	},
	{
	"Name": "Water Purification Systems",
	"ID": "water_purification_systems",
	"Description": "Essential on arid or polluted planets, increasing demand; less needed on planets with abundant clean water.",
	"MinTechLevel": 4,
	"BasePricePerTechLevel": [1600, 1580, 1560, 1540, 1520, 1500, 1480, 1460, 1440, 1420]
	},
	{
	"Name": "3D Printing Materials",
	"ID": "3d_printing_materials",
	"Description": "In high demand on manufacturing and construction-heavy planets; less valuable on low-tech worlds.",
	"MinTechLevel": 5,
	"BasePricePerTechLevel": [850, 840, 830, 820, 810, 800, 790, 780, 770, 760]
	},
	{
	"Name": "Holographic Art",
	"ID": "holographic_art",
	"Description": "Luxury good, highly valued on culturally advanced planets; less interesting for technologically backward planets.",
	"MinTechLevel": 6,
	"BasePricePerTechLevel": [2300, 2280, 2260, 2240, 2220, 2200, 2180, 2160, 2140, 2120]
	},
	{
	"Name": "Biotech Seeds",
	"ID": "biotech_seeds",
	"Description": "Essential for agricultural development on barren planets; less valuable on planets with established agriculture.",
	"MinTechLevel": 5,
	"BasePricePerTechLevel": [1050, 1040, 1030, 1020, 1010, 1000, 990, 980, 970, 960]
	},
	{
	"Name": "Nano-repair Kits",
	"ID": "nano_repair_kits",
	"Description": "High value in industrial and high-tech societies; less necessary on low-tech or primitive planets.",
	"MinTechLevel": 7,
	"BasePricePerTechLevel": [3600, 3550, 3500, 3450, 3400, 3350, 3300, 3250, 3200, 3150]
	},
	{
	"Name": "Cryogenic Life Pods",
	"ID": "cryogenic_life_pods",
	"Description": "Essential for long-duration space travel or extreme preservation needs.",
	"MinTechLevel": 8,
	"BasePricePerTechLevel": [7200, 7150, 7100, 7050, 7000, 6950, 6900, 6850, 6800, 6750]
	}
]

