state("HotAsphalt") 
{
	int loadandcomix : 0x9F8108;
	byte ilstart : 0xB6271A;
	float igtTime : 0xA55D3C, 0xA0;
	
}

init
{

}

split
{
	if (old.ilstart == 1 & current.ilstart < 1) {
		return true;
	}
}

isLoading 
{
    return current.loadandcomix != 1;
}

exit
{

}