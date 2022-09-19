function GetSteamId64FromHex(hex_id)
	return tonumber("0x" .. hex_id)
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local steamid  = nil
    for k,v in pairs(GetPlayerIdentifiers(source)) do     
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end
	steamid = string.gsub(steamid, "steam:", "")
    steamid = GetSteamId64FromHex(steamid)
    deferrals.handover({
		Test = tostring(steamid),
    })
	print(steamid)
end)