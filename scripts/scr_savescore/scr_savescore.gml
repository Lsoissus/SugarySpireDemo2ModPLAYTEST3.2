function scr_isprank() {
	return global.secretsfound >= 3 && global.treasurefound && global.lap && !global.combodropped;
}