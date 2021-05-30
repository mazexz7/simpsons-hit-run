local Path = "/GameData/" .. GetPath()
local File = ReadFile(Path)
local Excluded = {}

function returnBool(bool)
local bill = nil
	if bool == false then
		bill = 0
	elseif bool == true then
		bill = 1
	end
return bill
end

local function CreateCon(file)
	local mass = string.format('SetMass(%s);', GetSetting('mass'))
	local gas = string.format('SetGasScale(%s);', GetSetting('gas'))
	local slipGas = string.format('SetSlipGasScale(%s);', GetSetting('slipGas'))
	local highGas = string.format('SetHighSpeedGasScale(%s);', ('highGas'))
	local gasTr = string.format('SetGasScaleSpeedThreshold(%s);', GetSetting('gasTr'))
	local brake = string.format('SetBrakeScale(%s);', GetSetting('brake'))
	local topSpeed = string.format('SetTopSpeedKmh(%s);', GetSetting('topSpeed'))
	local turnAngle = string.format('SetMaxWheelTurnAngle(%s);', GetSetting('turnAngle'))
	local steerDrop = string.format('SetHighSpeedSteeringDrop(%s);', GetSetting('steerDrop'))
	local grip = string.format('SetTireGrip(%s);', GetSetting('grip'))
	local steering = string.format('SetNormalSteering(%s);', GetSetting('steering'))
	local slipSteer = string.format('SetSlipSteering(%s);', GetSetting('slipSteer'))
	local eBrake = string.format('SetEBrakeEffect(%s);', GetSetting('eBrake'))
	local steerNoEB = string.format('SetSlipSteeringNoEBrake(%s);', GetSetting('steerNoEB'))
	local effectNoEB = string.format('SetSlipEffectNoEBrake(%s);', GetSetting('effectNoEB'))
	local cmX = string.format('SetCMOffsetX(%s);', GetSetting('cmX'))
	local cmY = string.format('SetCMOffsetY(%s);', GetSetting('cmY'))
	local cmZ = string.format('SetCMOffsetZ(%s);', GetSetting('cmZ'))
	local suspensionLimit = string.format('SetSuspensionLimit(%s);', GetSetting('suspensionLimit'))
	local springK = string.format('SetSpringK(%s);', GetSetting('springK'))
	local damperC = string.format('SetDamperC(%s);', GetSetting('damperC'))
	local suspensionY = string.format('SetSuspensionYOffset(%s);', GetSetting('suspensionY'))
	local hitPoint = string.format('SetHitPoint(%s);', GetSetting('hitPoint'))
	local burnout = string.format('SetBurnoutRange(%s);', GetSetting('burnout'))
	local weeble = string.format('SetWeebleOffset(%s);', GetSetting('weeble'))
	local burst = string.format('SetMaxSpeedBurstTime(%s);', GetSetting('burst'))
	local donut = string.format('SetDonutTorque(%s);', GetSetting('donut')) -- mm d'oh-nuts...
	local wheelie = string.format('SetWheelieRange(%s);', GetSetting('wheelie'))
	local wheelieY = string.format('SetWheelieOffsetY(%s);', GetSetting('wheelieY'))
	local wheelieZ = string.format('SetWheelieOffsetZ(%s);', GetSetting('wheelieZ'))
	local charScale = string.format('SetCharacterScale(%s);', GetSetting('charScale'))
	local odds = string.format('SetGamblingOdds(%s);', GetSetting('odds'))
	local shine = string.format('SetShininess(%s);', GetSetting('shine'))
	local roof = string.format('SetHighRoof(%s);', returnBool(GetSetting('roof')))
	local doors = string.format('SetHasDoors(%s);', returnBool(GetSetting('doors')))
	local charVisible = string.format('SetCharactersVisible(%s);', returnBool(GetSetting('charVisible')))
	local iris = string.format('SetIrisTransition(%s);', returnBool(GetSetting('iris')))
	local driver = string.format('SetDriver(%s);', GetSetting('driver'))
	local s = {
		-- Front
		GetSetting('x'),
		GetSetting('y'),
		GetSetting('z'),
		GetSetting('w'),
		-- Back
		GetSetting('x2'),
		GetSetting('y2'),
		GetSetting('z2'),
		GetSetting('w2'),
		}
	local shadow = 'SetShadowAdjustments( '..s[1]..', '..s[2]..', '..s[3]..', '..s[4]..', '..s[5]..', '..s[6]..', '..s[7]..', '..s[8]..' );'

	
	
	file=file..[[
	]]..mass..[[
	]]..gas..[[
	]]..slipGas..[[
	]]..highGas..[[
	]]..gasTr..[[
	]]..brake..[[
	]]..topSpeed..[[
	]]..turnAngle..[[
	]]..steerDrop..[[
	]]..grip..[[
	]]..steering..[[
	]]..slipSteer..[[
	]]..eBrake..[[
	]]..steerNoEB..[[
	]]..effectNoEB..[[
	]]..cmX..[[
	]]..cmY..[[
	]]..cmZ..[[
	]]..suspensionLimit..[[
	]]..springK..[[
	]]..damperC..[[
	]]..suspensionY..[[
	]]..hitPoint..[[
	]]..burnout..[[
	]]..weeble..[[
	]]..burst..[[
	]]..donut..[[
	]]..wheelie..[[
	]]..wheelieY..[[
	]]..wheelieZ..[[
	]]..charScale..[[
	]]..odds..[[
	]]..shine..[[
	]]..roof..[[
	]]..doors..[[
	]]..charVisible..[[
	]]..iris..[[
	]]..driver..[[
	]]..shadow
	Output(file)
end
if GetSetting('affectedAll') == 0 then
	for _ in string.gmatch(GetSetting('excluded'), "%S+") do
		if string.format('/GameData/scripts\\cars\\%s.con', _) == Path then
			print(string.format("[Con Modifier]: %s is excluded.", Path))
			return nil
		end
	end
print(string.format("[Con Modifier]: setting configurations for %s.", Path))
CreateCon(File)
elseif GetSetting('affectedAll') == 1 then
	for _ in string.gmatch(GetSetting('affected'), "%S+") do
		if string.format('/GameData/scripts\\cars\\%s.con', _) == Path then
			print(string.format("[Con Modifier]: setting configurations for %s.", Path))
			CreateCon(File)
		end
	end
end
