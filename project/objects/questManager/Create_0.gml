questList = ds_list_create()
questCount = -1

questNames = []
questNames[quests.intro] = "Intro"
questNames[quests.spendFinalCoin] = "Spend Final Coin"
questNames[quests.streetDance] = "Street Dance"
questNames[quests.watch] = "Get Brothers Watch Back"


function quest_check() {
	for(var i=0;i<questCount;i++) {
		var Quest = questList[| i]
	
		//	Run the quest script
		var finished = quest_script(Quest)
		if finished {
			_remove_quest(i)
			i = questCount
		}
	
	}
}

function add_quest(_quest_index) {
	var Quest = new _add_quest(_quest_index)
	ds_list_add(questList, Quest)
	
	debug.log("Added quest: "+string_upper(questNames[_quest_index]))
	
	questCount = ds_list_size(questList)
}

function _add_quest(_quest_index) constructor {
	index = _quest_index
	stage = -1
}

function _remove_quest(list_index) {
	ds_list_delete(questList, list_index)
	questCount = ds_list_size(questList)
}