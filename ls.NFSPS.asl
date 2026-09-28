state("nfs", "v1.1") 
{
    int loading: 0xAB2E16;
	string12 fmv: "nfs.exe", 0x6B27E0;
}

init 
{
	// Cracked v1.1 (Vitality), Cracked v1.1 (Battery), Non Cracked v1.1
    if(modules.First().ModuleMemorySize == 0x1784000 || modules.First().ModuleMemorySize == 0x1B687E2 || modules.First().ModuleMemorySize == 0x16A9000) {
		version = "v1.1";
	}
}

startup
{
	settings.Add("prologue", true, "Prologue Split", "splits");
}

start
{
	vars.split = 0;
	return old.fmv != current.fmv && current.fmv == "fmv01_career";
}

split
{
	// First race splitted by the count of loading screens probably will change that
	if(vars.split == 2 && old.loading == 0 && current.loading != 0 && settings["prologue"]) {
		return true;
	}
}

isLoading 
{
    return current.loading != 0;
}

exit
{
	timer.IsGameTimePaused = false;
}