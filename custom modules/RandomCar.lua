randomCar = {}	
	--[[ 
		Here we make the table that has the cars.
		to add a car, just type it in 'carname',
		also make sure to add a comma after it.
		(if it is not the last object that is.)
		eg. { 'carA', 'carB', 'taxiB' }
	--]]
	randomCar.Cars = {
	'ambul', 'apu_v', 'atv_v', 'bart_v', 
	'bbman_v', 'bookb_v', 'burns_v', 'burnsarm',
	'carhom', 'cArmor', 'cBlbart', 'cBone', 
	'cCellA', 'cCellB', 'cCellC', 'cCellD',
	'cCola', 'cCube', 'cCurator', 'cDonut', 
	'cDuff', 'cFire_v', 'cHears', 'cKlimo',
	'cletu_v', 'cLimo', 'cMilk', 'cNerd',
	'cNonup', 'coffin', 'comic_v', 'compactA',
	'cPolice', 'cSedan', 'cVan', 'dune_v',
	'elect_v', 'famil_v', 'fistruc', 'fone_v',
	'frink_v', 'garbage', 'glastruc', 'gramp_v',
	'gramR_v', 'hallo', 'hbike_v', 'homer_v',
	'honor_v', 'huskA', 'hyper_v', 'icecream',
	'IStruck', 'knigh_v', 'krust_v', 'lisa_v',
	'marge_v', 'minivanA', 'moe_v', 'mono_v', 
	'mrplo_v', 'nuctruck', 'oblit_v', 'otto_v',
	'pickupA', 'pizza', 'plowk_v', 'redbrick',
	'rocke_v', 'schoolbu', 'scorp_v', 'sedanA',
	'sedanB', 'ship', 'skinn_v', 'smith_v', 
	'snake_v', 'sportsA', 'sportsB', 'SUVA',
	'taxiA', 'tt', 'votetruc', 'wagonA',
	'wiggu_v', 'willi_v', 'witchcar', 'zombi_v'
	}
	
	local excluded = { -- Add excluded cars in here ['carname'] = true,
		['tt'] = true,
		['huskA'] = true,
	}

	function randomCar.GetCar()
	--[[
		This function will return a random car. If the car is in the
		excluded list, the function will repeat until it returns a
		car that is not in the excluded.
	--]]
		local car = randomCar.Cars[math.random(1, #randomCar.Cars)]
		if excluded[car] then
			car = randomCar.GetCar() -- family sean (no)
		end
		return car
	end
	
	function randomCar.GetAllCars() -- This script will return the array of all the cars in the game.
									-- Might be useful for the m*l files when loading all the cars.
		return randomCar.Cars
	end

	function LD(x)
		Game.LoadDisposableCar('art\\cars\\'..x..'p3d', x, 'DEFAULT')
	end

	function randomCar.L()
		for _, car in pairs(randomCar.Cars) do
			LD(car)
		end
	end
	
return randomCar
