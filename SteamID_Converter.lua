local STEAM_COMMUNITY_ID = 76561197960265728
function SteamIDToSteamID64(strID)
	assert(strID, 'strID = nil')

	local x, y, z = string.match(strID, "STEAM_(%d+):(%d+):(%d+)")

	if (x and y and z) then
		return STEAM_COMMUNITY_ID + tonumber(y) + tonumber(z)*2
	else
		return strID
	end
end

function SteamID64ToSteamID(strID64)
	assert(strID64, 'strID64 = nil')

	local x = tonumber(strID64)
	local y = x % 2 == 0 and 0 or 1
	local z = (x - STEAM_COMMUNITY_ID - y) / 2

	return "STEAM_0:"..y..":"..string.sub(z, 1, -3)
end

--[[ EXAMPLE ]]
--[[ local SteamID = SteamID64ToSteamID('76561198019479709')
local CommunityID = SteamIDToSteamID64(SteamID)

print('SteamID = '..SteamID, 'CommunityID = '..CommunityID) ]]