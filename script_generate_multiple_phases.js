var allTubes = [                                                                                                                    
	{	tube: [0,5,3,4,0,0,0,0,0,6,1,5,5,5,4,0,4,0,2,2,0,4,5,2,3,5,0,5,3,4,4,5,0,5,3,0,0,6,1,6,3,2,4,3,0,5,2,4,1,6,0,0,2,0], moves: 38},	 	//phase 2
	{	tube: [0,1,5,4,6,3,0,0,0,2,0,1,3,1,3,4,3,0,3,2,3,5,5,1,2,2,0,2,0,1,2,6,3,6,0,0,0,0,2,0,1,0,3,1,0,0,0,1,3,5,1,4,1,0], moves: 31},		//phase 3
	{	tube: [0,0,1,3,2,3,1,2,0,4,5,4,5,3,2,3,0,0,3,4,4,4,3,5,1,2,0,0,0,1,4,6,0,2,3,0,0,0,1,6,6,6,6,1,0,0,0,2,0,3,1,6,2,0], moves: 29},		//phase 4
	{	tube: [0,4,2,3,4,6,0,0,0,2,2,4,5,2,0,0,0,0,4,1,4,2,3,3,0,0,0,6,1,3,1,0,1,6,0,0,5,3,2,2,5,6,2,3,0,1,1,0,0,5,1,1,4,0], moves: 42},		//phase 5
	{	tube: [0,2,3,2,4,1,3,1,0,3,5,2,1,1,0,3,2,0,0,3,5,5,2,3,1,5,0,3,4,0,6,2,2,3,4,0,0,0,0,2,3,3,3,1,0,0,0,0,2,4,1,6,0,0], moves: 33},		//phase 6
	{	tube: [0,2,4,1,4,3,2,2,0,1,6,1,1,1,3,5,1,0,5,2,6,1,2,0,1,5,0,1,5,2,6,4,2,6,3,0,0,0,5,1,5,3,4,5,0,0,0,6,5,2,4,2,5,0], moves: 38},		//phase 7
	{	tube: [0,1,4,2,2,3,4,2,0,2,0,1,1,3,2,3,3,0,5,1,4,2,6,5,5,5,0,5,1,4,4,2,0,3,3,0,0,6,4,4,5,4,6,5,0,0,0,1,5,2,6,1,6,0], moves: 37},		//phase 8
	{	tube: [0,0,5,2,6,1,0,0,0,1,4,2,5,2,6,1,2,0,5,1,4,4,1,5,5,1,0,6,5,1,3,3,3,5,6,0,0,3,5,4,0,4,5,4,0,4,1,4,1,2,4,2,6,0], moves: 38},		//phase 9
	{	tube: [0,2,5,3,6,1,4,0,0,5,2,3,1,5,1,4,2,0,2,0,3,5,2,4,4,1,0,2,3,3,6,3,5,5,5,0,5,5,5,4,3,0,5,6,0,2,2,5,6,0,0,2,1,0], moves: 41},		//phase 10
	{	tube: [0,3,3,6,2,0,0,0,0,4,4,2,2,5,4,2,0,0,3,4,5,1,1,1,1,2,0,4,2,1,5,4,4,2,4,0,6,4,6,5,1,6,1,5,0,3,3,1,6,6,1,5,1,0], moves:	58},		//phase 11
	{	tube: [0,3,6,3,2,3,1,1,0,4,6,5,2,5,2,1,3,0,1,3,1,6,5,5,3,5,0,6,5,4,2,2,2,3,4,0,3,3,4,3,3,3,2,4,0,1,5,1,3,1,1,4,6,0], moves:	48},		//phase 12
	{	tube: [0,1,4,1,3,3,2,3,0,3,2,6,3,3,1,1,3,0,6,6,2,1,4,2,4,2,0,1,1,5,6,3,2,3,3,0,2,5,6,2,1,3,3,1,0,5,5,2,2,3,2,3,4,0], moves: 66},		//phase 13
	{	tube: [0,5,2,4,6,5,3,1,0,5,5,1,2,5,3,2,2,0,2,5,2,5,3,2,1,4,0,4,1,4,6,1,3,1,1,0,1,1,2,1,1,5,2,2,0,2,6,1,6,1,1,4,3,0], moves:	58},		//phase 14
	{	tube: [0,3,2,4,2,4,6,3,0,5,4,1,2,5,3,2,2,0,1,6,4,4,1,2,1,4,0,3,6,6,2,4,2,5,3,0,2,3,3,2,1,3,6,2,0,1,2,4,1,5,1,1,5,0], moves:	56}			//phase 15
];

var getNamePhase = function(phase){	
	switch(phase){
		case 1: return "FIRST";
		case 2: return "SECOND";
		case 3: return "THIRD";
		case 4: return "FOURTH";
		case 5: return "FIFTH";
		case 6: return "SIXTH";
		case 7: return "SEVENTH";
		case 8: return "EIGHTH";
		case 9: return "NINTH";
		case 10: return "TENTH";
		case 11: return "ELEVEN"
		case 12: return "TWELVE"
		case 13: return "THIRTEEN"
		case 14: return "FOURTEEN"
		case 15: return "FIFTEEN"
	}
};

var getFormattedMoves = function(moves){	
	return parseInt(moves/10) + ", " + moves % 10;
};

var createPhase = function(phase, moves, tubesArray){
	var output = "";

	var phaseTxt = getNamePhase(phase);
	
	output+="\n\tcreate" + phaseTxt.charAt(0) + phaseTxt.substring(1).toLowerCase() + "Phase:\n";
	output += "\t\tgetBitmapCache(" + phaseTxt + "_PHASE_CACHE)\n"
	output += "\n\t\tmove $s6, $v0\n";		
	output += "\n\t\tbeq $s6, -1, clear_slots_" + phaseTxt.toLowerCase() + "_phase\n";		
	output += "\n\t\tsendParameters(NOT_CLEAR_SLOTS)\n";		
	output += "\n\t\tj before_clear_slots_" + phaseTxt.toLowerCase() + "_phase\n";
	output += "\n\t\tclear_slots_" + phaseTxt.toLowerCase() + "_phase:\n";
	output += "\t\t\tsendParameters(CLEAR_SLOTS)\n";
	output += "\n\t\tbefore_clear_slots_" + phaseTxt.toLowerCase() + "_phase:\n";
	output += "\n\t\tpushInStack($ra)\n";
	output += "\t\tjal createBasePhase"
	output += "\n\t\tpopFromStack($ra)\n";
	output += "\n\t\tpushInStack($ra)\n";
	
	output += "\t\tsendParameters(10, "+phase+", BLACK_COLOR)\n";	
	output += "\t\tjal drawNumbers\n"
	output += "\t\tpopFromStack($ra)\n\n";	
		
	output += "\t\tsendParameters("+getFormattedMoves(moves)+")\n";	
	output += "\t\tjal crateMovesDisplay\n"
	output += "\t\tpopFromStack($ra)\n";
	
	for (var i = 0; i < tubesArray.length; i++){
		if (tubesArray[i] == 0) continue;	
		
		output += "\n\t\tpushInStack($ra)\n";
		output += "\t\tsendParameters("+(i+1)+", $s6)\n";	
		
		if (tubesArray[i] == 1) output += "\t\tjal createHorizontalTube\n";
		if (tubesArray[i] == 2) output += "\t\tjal createVerticalTube\n";
		if (tubesArray[i] == 3) output += "\t\tjal createFirstTubeElbow\n";
		if (tubesArray[i] == 4) output += "\t\tjal createSecondTubeElbow\n";
		if (tubesArray[i] == 5) output += "\t\tjal createThirdTubeElbow\n";
		if (tubesArray[i] == 6) output += "\t\tjal createFourthTubeElbow\n";
		
		output += "\t\tpopFromStack($ra)\n";		
	}
	
	output += "\n\t\tbeq $s6, -1, updateBitmapAndCache_" + phaseTxt.toLowerCase() + "_phase\n";
	output += "\n\t\tjr $ra\n";
	output += "\n\t\tupdateBitmapAndCache_" + phaseTxt.toLowerCase() + "_phase:\n";
	output += "\t\t\trefreshBitmap()\n";
	output += "\t\t\tsetBitmapCache(" + phaseTxt + "_PHASE_CACHE)\n";
	output += "\tjr $ra\n";
	
	return output;
};

var finalOutput = "";

for (var i = 0; i < allTubes.length; i++){
	finalOutput += createPhase((i+2), allTubes[i].moves, allTubes[i].tube);
}

copy(finalOutput);