var text = "GREAT";
var initialSlot = 18;
var jumpLines = 5;
var color = "WHITE_COLOR";

var slotsInLine = 42;
var relativeSlot = initialSlot + (slotsInLine * jumpLines)

var output = "";

for(var i = 0; i < text.length; i++){
	output += "\n\t\tpushInStack($ra)\n";
	output += "\t\tsendParameters(" + (relativeSlot++) + ", " + text[i].charCodeAt(0) + ", " + color + ")\n";
	output += "\t\tjal drawLetters\n"
	output += "\t\tpopFromStack($ra)\n";		
}

copy (output);