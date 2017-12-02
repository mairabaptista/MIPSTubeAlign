var tubes = [0,2,1,2,0,0,0,0,0,1,6,4,2,3,0,0,0,0,6,1,5,2,2,0,2,0,0,2,1,0,3,6,0,4,5,0,0,1,0,2,2,5,5,6,0,0,0,3,4,2,3,4,0,0];  //phase 1
    
var output = "";

for (var i = 0; i < tubes.length; i++){
	if (tubes[i] == 0) continue;
	
	output += "\n\t\tpushInStack($ra, $a1)\n";
	output += "\t\tsendParameters("+(i+1)+", $a1)\n";	
	
	if (tubes[i] == 1) output += "\t\tjal createHorizontalTube\n";
	if (tubes[i] == 2) output += "\t\tjal createVerticalTube\n";
	if (tubes[i] == 3) output += "\t\tjal createFirstTubeElbow\n";
	if (tubes[i] == 4) output += "\t\tjal createSecondTubeElbow\n";
	if (tubes[i] == 5) output += "\t\tjal createThirdTubeElbow\n";
	if (tubes[i] == 6) output += "\t\tjal createFourthTubeElbow\n";
	
	output += "\t\tpopFromStack($ra, $a1)\n";		
}

copy(output);
