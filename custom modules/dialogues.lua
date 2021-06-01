dialogues = {}

  -- To add a custom character, you must make sure they have custom sounds first;
  --[[
      HOMER & BART EXAMPLE:
      You must have 5 files with this name in 'CustomFiles/Conversations' of your mod
      (5 is just a random number I picked for this example. It can be as many as you want)
      c_hom1_1_noboxconv_hom_l1.rsd
      c_hom2_1_noboxconv_hom_l1.rsd
      c_hom3_1_noboxconv_hom_l1.rsd
      c_brt1_2_noboxconv_brt_l1.rsd
      c_brt2_2_noboxconv_brt_l1.rsd
  --]]
	dialogues['homer'] = 3 -- Number of allowed "dialogues" for character. Number must not be more than files for the character, only less or equal.
  dialogues['bart'] = 2
	function dialogues.speak(name)
		if dialogues[name] then
			local number = math.random(1, dialogues[name])
			Game.SetCompletionDialog(name..number, name)
		end
	end

return dialogues
