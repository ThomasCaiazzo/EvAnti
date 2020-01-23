
-- Example Anti-Backdoor Gmod Lua
-- Ev Anti BackDoor 0.3a
-- by [>.<]Ev1L|Cracka 
-- 01/21/2020
-- Detour underlying functions with blacklist 

print("Loading EvAnti 0.3a");

local EvAnti  = {};
EvAnti.PrintConsole = true;
EvAnti.PrintExtras = false;
EvAnti.BlackList = {
	"FEUfTTZgREUmJMEHccceOEpGSXZAnR",
	"execc.online",
	"haylay.tk",
	"u06q9wb8c9dbrxxz0ddz"
};


function ContainBlackList(dat)
	local data = tostring(dat)
	for id, item in pairs(EvAnti.BlackList) do
		if string.find(data, item) then
			return true;
		end
	end
	return false;
end


EvAnti.OldHookAdd = hook.Add;

function hook.Add(hookname, name, func)
	if EvAnti.PrintExtras then print("EvAnti:\n", hookname, name) end
	if ContainBlackList(name) then print("Stopped hook.Add backdoor") return false; end
	EvAnti.OldHookAdd(hookname, name, func)
end


EvAnti.OldHttpFetch = http.Fetch;

function http.Fetch(url, func)
	if EvAnti.PrintExtras then print("EvAnti:\n", url) end
	if ContainBlackList(url) then print("Stopped http.Fetch backdoor") return false; end
	EvAnti.OldHttpFetch(url, func)
end


EvAnti.OldHttpPost = http.Post;

function http.Post(url, paratable, onsuc, onfail, headers)
	if EvAnti.PrintExtras then print("EvAnti:\n", url, paratable, onsuc, onfail, headers) end
	if ContainBlackList(url) then print("Stopped http.Post backdoor") return false; end
	EvAnti.OldHttpPost(url, postdata, returnfunc)
end


EvAnti.OldRunString = RunString;

function RunString(...)
	if EvAnti.PrintConsole then print("EvAnti:\n", ...) end-- Spew string to console
	EvAnti.OldRunString(...)
end
