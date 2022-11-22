Config = {}



--Mini-Game Configs

Config.locksystem = "qb"   --qb = to qb-lock | ps = ps-ui you can use which ever you would like

--Money Configs

Config.Cash = true           -- you can ethier use cash black money vise versa
Config.BlackMoney = false     -- You can ethier use black money or cash vise versa

Config.MinCash = 500 --if Config.Cash = true
Config.MaxCash = 2000 -- You can change the min and the max how you please

Config.MinMarkedBills = 1 --if Config.BlackMoney = true if = false then leave default
Config.MaxMarkedBills = 5


Config.Models = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm",
}

Config.ModelHashes = {
    -870868698,           --prop_atm_01
    -1126237515,          --prop_atm_02
    -1364697528,          --prop_atm_02
    506770882,            --prop_fleeca_atm
}
