  function M_Game.Talk(ICON, TEXT)
		M_Game.StartCountdown('count')
		M_Game.AddToCountdownSequence('', 4000)
		M_Game.SetHUDIcon(ICON)
		M_Game.SetStageMessageIndex(TEXT)
		M_Game.AddObjective('timer')
			M_Game.SetDurationTime(3)
		M_Game.CloseObjective()
  end
	
	function M_Game.TalkNPC(ICON, TEXT, NPC, LOCATOR)
		M_Game.StartCountdown('count')
		M_Game.AddToCountdownSequence('', 4000)
		M_Game.SetHUDIcon(ICON)
		M_Game.SetStageMessageIndex(TEXT)
		M_Game.AddObjective('timer')
			M_Game.AddNPC(NPC, LOCATOR)
			M_Game.SetDurationTime(3)
		M_Game.CloseObjective()
	end
	
	function M_Game.TalkDrive(ICON, TEXT)
		M_Game.SetHUDIcon(ICON)
		M_Game.SetStageMessageIndex(TEXT)
		M_Game.AddObjective('timer')
			M_Game.SetDurationTime(3)
		M_Game.CloseObjective()
	end
	
	function M_Game.Wait(TIME)
		M_Game.AddObjective('timer')
			M_Game.SetDurationTime(TIME)
		M_Game.CloseObjective()
	end
	
	function M_Game.WaitNPC(TIME, NPC, LOCATOR)
		M_Game.AddObjective('timer')
			M_Game.AddNPC(NPC, LOCATOR)
			M_Game.SetDurationTime(TIME)
		M_Game.CloseObjective()
	end
	
	function M_Game.LoadCar(car, type)
		M_Game.LoadDisposableCar('art\\cars\\'..car..'.p3d',car,type)
	end
	
	function M_Game.LoadAICar(car)
		M_Game.LoadCar(car, 'AI')
	end
	
	function M_Game.Dummy()
		M_Game.AddObjective('dummy')
		M_Game.CloseObjective()
	end
	
	function M_Game.LoadMainCar(car)
		M_Game.LoadDisposableCar('art\\cars\\'..car..'.p3d', car, 'DEFAULT')
	end
	
	function M_Game.SetBMP(bmp)
		M_Game.SetPresentationBitmap('art\\frontend\\dynaload\\images\\'..bmp..'.p3d')
	end
	
	function M_Game.LoadIcon(name, type)
		local msnicons = 'art\\frontend\\dynaload\\images\\msnicons\\'
		if type then
			if type == 'c' then
				M_Game.LoadP3DFile(msnicons..'char\\'..name..'.p3d')
			elseif type == 'l' then
				M_Game.LoadP3DFile(msnicons..'location\\'..name..'.p3d')
			elseif type == 'o' then
				M_Game.LoadP3DFile(msnicons..'object\\'..name..'.p3d')
			elseif type == 'v' then
				M_Game.LoadP3DFile(msnicons..'vehicle\\'..name..'.p3d')
			else return nil
			end
		end
	end
	
	function M_Game.LoadProp(number, name)
		M_Game.LoadP3DFile('art\\missions\\level0'..tostring(number)..'\\'..name..'.p3d')
	end

	function M_Game.AddMorty(vehicle) --- NOTICE, THIS ONLY WORKS WITH 'morty' CHARACTER; MAKE SURE YOU HAVE IT BEFORE USING IT
		return M_Game.AddStageVehicleCharacter(vehicle, 'morty', 'ml' or nil)
	end
