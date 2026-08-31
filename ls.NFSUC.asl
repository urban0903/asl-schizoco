/*
 *	Autosplitter and Load Remover done by Failracer, TDOG20, WillTreaty and CrayZeei
 */

state("nfs", "steam") 
{
	string24 raceName: "nfs.exe", 0x99B7E4, 0x18, 0x3C;
	int gameState: "nfs.exe", 0xF5DF00;
	byte completed: "nfs.exe", 0x9E5414, 0xB4;
	byte loadingEverything: "nfs.exe", 0x9A530C;
	
	float completion : "nfs.exe", 0x9E6DC8, 0xD0;
	int raceCP: "nfs.exe", 0x9E6DC8, 0x394;
	int raceLap: "nfs.exe", 0x9E6DC8, 0x64;
	int raceStart: "nfs.exe", 0x99B95C;
	float totalExp: "nfs.exe", 0x99B808, 0x24;
	float bonusZone: "nfs.exe", 0x9E6DBC, 0xC;
	
}

state("NFS", "origin") 
{
	string24 raceName: "NFS.exe", 0xEAC524, 0x18, 0x3C;
	int gameState: "NFS.exe", 0x148A700;
	byte completed: "NFS.exe", 0xEF6484, 0xB4;
	byte loadingEverything: "NFS.exe", 0xEB6382;
	
	float completion: "NFS.exe", 0xEF7E38, 0xD0;
	int raceCP: "NFS.exe", 0xEF7E38, 0x394;
	int raceLap: "NFS.exe", 0xEF7E38, 0x64;
	int raceStart: "NFS.exe", 0xEAC691;
	float totalExp: "NFS.exe", 0xEAC548, 0x24;
	float bonusZone: "NFS.exe", 0xEF7E2C, 0xC;
	
}

init
{
	if (modules.First().ModuleMemorySize == 0x1008000) {
		version = "steam";
	}
	else if (modules.First().ModuleMemorySize == 0x1556000) {
		version = "origin";
	}
}

startup
{
	vars.timerModel = new TimerModel { CurrentState = timer };

	settings.Add("quickracemode", false, "Quick Race Mode");
	settings.SetToolTip("quickracemode", "Handles starts, splits (in 20 intervals) and resets for quick race (IL) conditions.");
	
	settings.Add("circuitmode", false, "Circuit Mode", "quickracemode");
	settings.SetToolTip("circuitmode", "Handles IL splitter for circuit race type.");
	settings.Add("checkpointmode", false, "Checkpoint Mode", "quickracemode");
	settings.SetToolTip("checkpointmode", "Handles IL splitter for checkpoint race type.");

	settings.Add("splits", true, "Event Splits (for Any%)");
	
	settings.Add("prologue", true, "Prologue", "splits");
	settings.SetToolTip("prologue", "Split after starting first career race (after cutscene and call)");
	
	settings.Add("sp_c_12.vlt", true, "Cross Slope & Ocean", "splits");
	settings.Add("hb_c_01.vlt", true, "East I-20", "splits");
	settings.Add("sp_c_21.vlt", true, "Aubrey Street", "splits");
	settings.Add("or_c_03.vlt", true, "West Ocean Express", "splits");
	settings.Add("sp_c_20.vlt", true, "Palm Harbor Rally", "splits");
	settings.Add("cr_c_03.vlt", true, "Ocean & Wilson", "splits");
	settings.Add("hb_c_04.vlt", true, "West I-20", "splits");
	settings.Add("or_c_07.vlt", true, "South Lawrence", "splits");
	settings.Add("cr_c_04.vlt", true, "Jackson & Veteran", "splits");
	settings.Add("cts_c_02.vlt", true, "West Water Street", "splits");
	settings.Add("es_c_02.vlt", true, "West Alena", "splits");
	settings.Add("cts_c_01.vlt", true, "East Konopa", "splits");
	settings.Add("hb_c_03.vlt", true, "Rush Hour", "splits");
	settings.Add("cts_c_03.vlt", true, "West Lydian", "splits");
	settings.Add("es_c_01.vlt", true, "North Sutton", "splits");
	settings.Add("E047.vlt", true, "Training Wheels", "splits");
	settings.Add("or_c_01.vlt", true, "The Game", "splits");
	settings.Add("E069.vlt", true, "Eyes In The Sky", "splits");
	settings.Add("E071.vlt", true, "Nick of Time", "splits");
	settings.Add("es_c_03.vlt", true, "East Sutton", "splits");
	settings.Add("cts_c_04.vlt", true, "Aubrey & Wilson", "splits");
	settings.Add("E120.vlt", true, "Mystery Job", "splits");
	settings.Add("es_c_04.vlt", true, "South Ocean Express", "splits");
	settings.Add("cts_c_06.vlt", true, "East Stadium", "splits");
	settings.Add("or_c_04.vlt", true, "West Stadium", "splits");
	settings.Add("cts_c_05.vlt", true, "South Harbor", "splits");
	settings.Add("E085.vlt", true, "Versus", "splits");
	settings.Add("or_c_02.vlt", true, "Jackson & Ocean", "splits");
	settings.Add("hb_c_02.vlt", true, "Southeast I-20", "splits");
	settings.Add("E096.vlt", true, "The Trap", "splits");
	settings.Add("E098.vlt", true, "The Kingpin", "splits");
	settings.Add("E115.vlt", true, "Grease Monkey", "splits");
	settings.Add("E116.vlt", true, "Loco", "splits");
	
	settings.Add("hb_a_04.vlt", true, "Road Rage and/or I-10 North", "splits");
	settings.SetToolTip("hb_a_04.vlt", "Both events shares the same ingame name.");
	
	settings.Add("E076.vlt", true, "Transporter", "splits");
	settings.Add("cts_a_01.vlt", true, "South Pine Creek", "splits");
	settings.Add("cto_a_02.vlt", true, "Morin & Douglas", "splits");
	settings.Add("cr_a_15.vlt", true, "Tri-City Tournament", "splits");
	settings.Add("cts_a_02.vlt", true, "Eastside & Sheridan", "splits");
	settings.Add("es_a_01.vlt", true, "South Palm", "splits");
	settings.Add("E145.vlt", true, "Rematch", "splits");
	settings.Add("es_a_05.vlt", true, "South Trevino Ave", "splits");
	settings.Add("cto_a_08.vlt", true, "South Gold Coast Hwy", "splits");
	settings.Add("cto_a_06.vlt", true, "Eastside & Gord", "splits");
	settings.Add("cto_a_01.vlt", true, "Gord & Eastside", "splits");
	settings.Add("cto_a_05.vlt", true, "Southbridge & Eastside", "splits");
	settings.Add("es_a_03.vlt", true, "Valencia & Peak Ridge", "splits");
	settings.Add("cts_a_03.vlt", true, "West Southbridge", "splits");
	settings.Add("es_a_04.vlt", true, "Mountain & Gold Coast", "splits");
	settings.Add("es_a_02.vlt", true, "North Gold Coast", "splits");
	settings.Add("cto_a_03.vlt", true, "Hillside & Sheridan", "splits");
	settings.Add("E186.vlt", true, "Grand Theft 5-0", "splits");
	settings.Add("cto_a_04.vlt", true, "Southeast Valencia", "splits");
	settings.Add("cto_c_01.vlt", true, "Alena & Harbor", "splits");
	settings.Add("E193.vlt", true, "Hot Item", "splits");
	settings.Add("E195.vlt", true, "Special Delivery", "splits");
	settings.Add("hb_a_03.vlt", true, "I-10 to I-5", "splits");
	settings.Add("es_b_01.vlt", true, "I-10 Onramp", "splits");
	settings.Add("hb_a_08.vlt", true, "I-5 to I-85", "splits");
	settings.Add("E215.vlt", true, "Duel", "splits");
	settings.Add("E217.vlt", true, "Rocket Ride", "splits");
	settings.Add("E219.vlt", true, "Lightspeed", "splits");
	settings.Add("E223.vlt", true, "Hunted", "splits");
	settings.Add("cts_b_01.vlt", true, "East Prime Ave", "splits");
	settings.Add("es_b_02.vlt", true, "Canyon Hwy South", "splits");
	settings.Add("sp_a_29.vlt", true, "Rollercoaster", "splits");
	settings.Add("cp_a_22.vlt", true, "Tri-City Run", "splits");
	settings.Add("cto_b_02.vlt", true, "Maureen & Powell", "splits");
	settings.Add("cts_b_04.vlt", true, "South Naval Access", "splits");
	settings.Add("cts_b_02.vlt", true, "North Victory", "splits");
	settings.Add("hb_b_05.vlt", true, "I-85 to I-5", "splits");
	settings.Add("cto_b_04.vlt", true, "South Industry Lane", "splits");
	settings.Add("hb_b_01.vlt", true, "North I-85", "splits");
	settings.Add("E277.vlt", true, "Hornet's Nest", "splits");
	settings.Add("E279.vlt", true, "The Feds", "splits");
	settings.Add("es_b_03.vlt", true, "I-85 Offramp", "splits");
	settings.Add("hb_a_02.vlt", true, "South I-5", "splits");
	settings.Add("E283.vlt", true, "Payback", "splits");
	settings.Add("hb_a_06.vlt", true, "West I-5", "splits");
	settings.Add("hb_a_01.vlt", true, "I-5 North", "splits");
	settings.Add("E286.vlt", true, "Double Trouble", "splits");
	settings.Add("es_b_04.vlt", true, "West Maureen", "splits");
	settings.Add("E313.vlt", true, "Betrayed", "splits");
	
	settings.Add("showdown", true, "Showdown", "splits");
	settings.SetToolTip("showdown", "Split after pressing continue button in final event as it's determined on src page.");
	
	settings.Add("extras", false, "Extra Events (for Any%)");
	settings.Add("hb_b_04.vlt", true, "West I-85", "extras");
	settings.Add("or_a_05.vlt", true, "East Gold Coast Hwy", "extras");
	settings.Add("hb_a_07.vlt", true, "Gold Coast & Mountain Hwy", "extras");
	settings.Add("hb_a_05.vlt", true, "I-20 & Gold Coast", "extras");
	settings.Add("es_a_06.vlt", true, "Gold Coast to Mountain", "extras");
	settings.Add("hb_b_02.vlt", true, "South I-85", "extras");
	
	settings.Add("hundo", false, "Other Events (for 100%)");
	settings.Add("cto_a_07.vlt", true, "Morin & Trevino", "hundo");
	settings.Add("cto_b_01.vlt", true, "Powell & South Blvd", "hundo");
	settings.Add("cto_b_05.vlt", true, "Prime & Maureen Street", "hundo");
	settings.Add("cto_b_03.vlt", true, "South Blvd & Harris", "hundo");
	settings.Add("cts_b_05.vlt", true, "Powell & Dock", "hundo");
	settings.Add("cts_b_03.vlt", true, "East Freightyard Access", "hundo");
	settings.Add("or_a_06.vlt", true, "Mountain to Hillside", "hundo");
	settings.Add("or_a_03.vlt", true, "Hillside Shortcut", "hundo");
	settings.Add("or_a_04.vlt", true, "Gold Coast Hwy Loop", "hundo");
	settings.Add("or_a_07.vlt", true, "North Valencia Hill", "hundo");
	settings.Add("or_b_04.vlt", true, "West Freightyard Access", "hundo");
	settings.Add("or_b_05.vlt", true, "East Inlet Expressway", "hundo");
	settings.Add("E288", true, "Sideshow", "hundo");
	settings.Add("E290", true, "Deuce", "hundo");
	settings.Add("cp_c_08.vlt", true, "Adder Shortcut", "hundo");
	settings.Add("cp_c_02.vlt", true, "Harbor & Alena", "hundo");
	settings.Add("cp_c_03.vlt", true, "South Memorial Tunnel", "hundo");
	settings.Add("cp_c_04.vlt", true, "East Ocean Expressway", "hundo");
	settings.Add("cp_c_07.vlt", true, "Ocean & Gusa", "hundo");
	settings.Add("cp_a_18.vlt", true, "Gold Coast to Canyon Hwy", "hundo");
	settings.Add("cp_a_10.vlt", true, "East I-5", "hundo");
	settings.Add("cp_a_13.vlt", true, "Gold Coast to Peak Ridge", "hundo");
	settings.Add("cp_a_15.vlt", true, "I-10 to Gold Coast", "hundo");
	settings.Add("cp_a_07.vlt", true, "East Fasulo Bridge", "hundo");
	settings.Add("cp_a_23.vlt", true, "River Expressway Offroad", "hundo");
	settings.Add("cp_a_17.vlt", true, "Silverwood & Mountain", "hundo");
	settings.Add("cp_a_03.vlt", true, "Northbringe & Tunnel", "hundo");
	settings.Add("cp_a_01.vlt", true, "South Gord", "hundo");
	settings.Add("cp_a_08.vlt", true, "River & Sheridan", "hundo");
	settings.Add("cp_a_21.vlt", true, "Peak Ridge to Fasulo", "hundo");
	settings.Add("cp_a_24.vlt", true, "North River Expressway", "hundo");
	settings.Add("cp_a_20.vlt", true, "North Willow", "hundo");
	settings.Add("cp_a_14.vlt", true, "I-10 to Peak Ridge", "hundo");
	settings.Add("cp_b_10.vlt", true, "I-10 Offramp", "hundo");
	settings.Add("cp_b_04.vlt", true, "West Prome Ave", "hundo");
	settings.Add("cr_c_07.vlt", true, "Malcolm & Francisco", "hundo");
	settings.Add("cr_c_09.vlt", true, "East Malcolm", "hundo");
	settings.Add("cr_c_11.vlt", true, "Cross Slope Loop", "hundo");
	settings.Add("cr_c_10.vlt", true, "Cross Slope & Gusa", "hundo");
	settings.Add("cr_c_08.vlt", true, "Water & Cross Slope", "hundo");
	settings.Add("cr_a_01.vlt", true, "Palm & Redland", "hundo");
	settings.Add("cr_a_20.vlt", true, "Eastside & Palm", "hundo");
	settings.Add("cr_a_04.vlt", true, "Pine Creek & Douglas", "hundo");
	settings.Add("cr_a_12.vlt", true, "Trevino & Morin", "hundo");
	settings.Add("cr_a_10.vlt", true, "Eastside & Cross", "hundo");
	settings.Add("cr_a_07.vlt", true, "Diamond & Eastside", "hundo");
	settings.Add("cr_a_19.vlt", true, "Hillside Blvd Loop", "hundo");
	settings.Add("cr_a_09.vlt", true, "Hillside & Gord", "hundo");
	settings.Add("cr_a_13.vlt", true, "Peak Ridge Loop", "hundo");
	settings.Add("cr_a_11.vlt", true, "East Walencia Hill", "hundo");
	settings.Add("cr_b_03.vlt", true, "Inlet Expressway Loop", "hundo");
	settings.Add("cr_b_01.vlt", true, "South Blvd & Bank", "hundo");
	settings.Add("sp_c_08.vlt", true, "Bay & Alena", "hundo");
	settings.Add("sp_c_22.vlt", true, "Stadium & Francisco", "hundo");
	settings.Add("sp_c_16.vlt", true, "Harbor & Malcolm", "hundo");
	settings.Add("sp_c_19.vlt", true, "Bay Drive & Harbor", "hundo");
	settings.Add("sp_c_09.vlt", true, "North Narrows Bridge", "hundo");
	settings.Add("sp_c_06.vlt", true, "i-20 Offramp", "hundo");
	settings.Add("sp_c_14.vlt", true, "Ocean & Jackson", "hundo");
	settings.Add("sp_c_15.vlt", true, "Sutton & Cross Slope", "hundo");
	settings.Add("sp_c_05.vlt", true, "Water & Veteran", "hundo");
	settings.Add("sp_c_18.vlt", true, "Gusa & Cross Slope", "hundo");
	settings.Add("sp_c_13.vlt", true, "West Cross Slope", "hundo");
	settings.Add("sp_c_17.vlt", true, "Gold Coast to Ocean", "hundo");
	settings.Add("sp_a_24.vlt", true, "Gold Coast Offramp", "hundo");
	settings.Add("sp_a_22.vlt", true, "I-5 to Hillside Blvd", "hundo");
	settings.Add("cr_a_18.vlt", true, "I-5 Loop", "hundo");
	settings.Add("sp_a_01.vlt", true, "West Fasulo Bridge", "hundo");
	settings.Add("sp_a_11.vlt", true, "Southbridge & Gord", "hundo");
	settings.Add("cp_a_11.vlt", true, "Silverwood & I-10", "hundo");
	settings.Add("cp_a_16.vlt", true, "Hillside & Hunter", "hundo");
	settings.Add("sp_a_25.vlt", true, "North Gord Avenue", "hundo");
	settings.Add("sp_a_28.vlt", true, "I-5 to Tuscany Loop", "hundo");
	settings.Add("sp_a_05.vlt", true, "South Eastside", "hundo");
	settings.Add("sp_a_21.vlt", true, "Morin to Closs Slope", "hundo");
	settings.Add("sp_a_17.vlt", true, "Diamond & River", "hundo");
	settings.Add("sp_a_14.vlt", true, "Gold Coast to Diamond", "hundo");
	settings.Add("sp_a_26.vlt", true, "Sheridan & Willow", "hundo");
	settings.Add("sp_a_23.vlt", true, "Gold Coast to Valencia", "hundo");
	settings.Add("sp_a_16.vlt", true, "Gold Coast to I-10", "hundo");
	settings.Add("sp_a_19.vlt", true, "Gold Coast to Causeway", "hundo");
	settings.Add("sp_a_12.vlt", true, "West Mountain Hwy", "hundo");
	settings.Add("sp_a_20.vlt", true, "Valencia to Hillside Blvd", "hundo");
	settings.Add("sp_a_15.vlt", true, "Canyon to Gold Coast", "hundo");
	settings.Add("sp_a_27.vlt", true, "West Valencia", "hundo");
	settings.Add("sp_a_13.vlt", true, "South Canyon Hwy", "hundo");
	settings.Add("sp_b_08.vlt", true, "East I-85", "hundo");
	settings.Add("sp_b_07.vlt", true, "South Inlet Bridge", "hundo");
	settings.Add("sp_b_06.vlt", true, "I-85 to Inlet Expressway", "hundo");
	settings.Add("sp_b_02.vlt", true, "East Naval Access", "hundo");
	
	settings.Add("cs", false, "Challenge Series (Origin Only)");
	settings.SetToolTip("cs", "Both events shares the same ingame name. Enable everything in [Any%/100% Splits] to work correctly.");
	
	settings.Add("cp_c_03_r.vlt", true, "Checkpoint 1", "cs");
	settings.Add("cp_a_07_r.vlt", true, "Checkpoint 2", "cs");
	settings.Add("race_bin_challenge_1.vlt", true, "Checkpoint 3", "cs");
	settings.Add("cp_a_20_r.vlt", true, "Checkpoint 4", "cs");
	settings.Add("cp_a_09.vlt", true, "Checkpoint 6", "cs");
	settings.Add("sp_c_06_r.vlt", true, "Sprint 1", "cs");
	settings.Add("sp_a_27_r.vlt", true, "Sprint 2", "cs");
	settings.Add("sp_1_13_r.vlt", true, "Sprint 4", "cs");
	settings.Add("sp_c_19_r.vlt", true, "Sprint 5", "cs");
	settings.Add("sp_b_02_r.vlt", true, "Sprint 6", "cs");
	settings.Add("hb_c_03_r.vlt", true, "Highway Wars 1", "cs");
	settings.Add("hb_b_04_r.vlt", true, "Highway Wars 2", "cs");
	settings.Add("hb_a_07_r.vlt", true, "Highway Wars 3", "cs");
	settings.Add("hb_b_05_r.vlt", true, "Highway Wars 4", "cs");
	settings.Add("hb_a_08_r.vlt", true, "Highway Wars 5", "cs");
	settings.Add("hb_c_04_r.vlt", true, "Highway Wars 6", "cs");
	settings.Add("cr_c_07_r.vlt", true, "Circuit 1", "cs");
	settings.Add("cr_b_03_r.vlt", true, "Circuit 2", "cs");
	settings.Add("cr_a_09_r.vlt", true, "Circuit 3", "cs");
	settings.Add("cr_b_01_r.vlt", true, "Circuit 4", "cs");
	settings.Add("cr_a_13_r.vlt", true, "Circuit 5", "cs");
	settings.Add("cr_c_09_r.vlt", true, "Circuit 6", "cs");
	settings.Add("hb_b_02_hwcp.vlt", true, "Highway Checkpoint 1", "cs");
	settings.Add("hb_b_01_hwcp.vlt", true, "Highway Checkpoint 2", "cs");
	settings.Add("hb_a_06_hwcp.vlt", true, "Highway Checkpoint 3", "cs");
	settings.Add("hb_a_05_hwcp.vlt", true, "Highway Checkpoint 4", "cs");
	settings.Add("hb_a_03_hwcp.vlt", true, "Highway Checkpoint 5", "cs");
	settings.Add("hb_c_01_hwcp.vlt", true, "Highway Checkpoint 6", "cs");
	
    if (timer.CurrentTimingMethod == TimingMethod.RealTime) {
        var timingMessage = MessageBox.Show(
            "This game uses Time without Loads (Game Time) as the main timing method.\n"
            + "LiveSplit is currently set to show Real Time (RTA).\n"
            + "Would you like to set the timing method to Game Time?",
            "Need for Speed: Undercover | LiveSplit",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );

        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

update 
{
	if ((timer.CurrentPhase == TimerPhase.Ended || timer.CurrentPhase == TimerPhase.NotRunning) && settings["quickracemode"] && old.raceStart != current.raceStart && current.raceStart == 0) {
		vars.timerModel.Reset();
	}
}

start
{
	if (version == "steam" && !settings["quickracemode"] && (current.gameState != old.gameState && old.gameState == 412) || (old.gameState == 56 && current.loadingEverything == 96)) {
		return true;
	} else if (version == "origin" && !settings["quickracemode"] && (current.gameState != old.gameState && old.gameState == 412) || (old.gameState == 56 && current.loadingEverything == 28)) {
		return true;
	} else if (version == "steam" && settings["quickracemode"] && old.raceStart == 0 && current.raceStart == 1 && (int)current.completion == 0) {
		return true;
	} else if (version == "origin" && settings["quickracemode"] && old.raceStart == -134217728 && current.raceStart == -134217727 && (int)current.completion == 0) {
		return true;
	}
}

split
{
	if (!settings["quickracemode"]) {
		if (settings[current.raceName] && ((current.raceName.Contains("E") && old.gameState != current.gameState && current.gameState == 859) || (old.completed != current.completed && (current.completed == 1 || current.completed == 2) && current.gameState != 863))) {
			return true;
		} else if (settings["showdown"] && current.raceName.Equals("E315.vlt") && (current.gameState == 32 || current.gameState == 31) && current.gameState != old.gameState) {
			return true;
		} else if (settings["prologue"] && old.raceName.Equals("E002.vlt") && (current.raceName.Equals("sp_c_12.vlt") || current.raceName.Equals("hb_c_01.vlt"))) {
			return true;
		} else {
			return false;
		}
	} else if (settings["quickracemode"]) {
		if (!settings["circuitmode"] && !settings["checkpointmode"] && (int)current.completion != (int)old.completion && (int)current.completion % 20 == 0 && (int)current.completion != 0) {
			return true;
		} else if (settings["circuitmode"] && current.raceLap != old.raceLap && current.raceLap == old.raceLap+1) {
			return true;
		} else if (settings["checkpointmode"] && ((current.raceCP != old.raceCP && current.raceCP == old.raceCP+1) || ((int)current.completion != (int)old.completion && (int)current.completion == 100))) {
			return true;
		} else {
			return false;
		}
	}
}

isLoading 
{
	return current.loadingEverything != 0;
}

reset 
{
	if (version == "steam" && settings["quickracemode"] && old.raceStart != current.raceStart && current.raceStart == 0) {
		return true;
	} else if (version == "origin" && settings["quickracemode"] && old.raceStart != current.raceStart && current.raceStart == -134217728) {
		return true;
	} else {
		return false;
	}
}

exit
{
	timer.IsGameTimePaused = false;
}