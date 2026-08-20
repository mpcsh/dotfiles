----------------
-- hot reloading
----------------
hs.pathwatcher
	.new(os.getenv("HOME") .. "/.hammerspoon/", function(files)
		for _, file in pairs(files) do
			if file:sub(-4) == ".lua" then
				hs.reload()
				hs.printf("Reloading due to change in: %s", file)
				break
			end
		end
	end)
	:start()

-------------------------------------
-- sync headphone EQ to output device
-------------------------------------
local function audioDeviceChanged(event)
	if event ~= "doubt" then
		return
	end

	local defaultDevice = hs.audiodevice.defaultOutputDevice()
	local deviceName = defaultDevice and defaultDevice:name() or "Unknown"
	hs.printf("Audio output changed to: %s", deviceName)

	hs.shortcuts.run("Select headphone EQ by output device")
end

hs.audiodevice.watcher.setCallback(audioDeviceChanged)
hs.audiodevice.watcher.start()

--------------------------------------------
-- disable display filters for photo editing
--------------------------------------------
local photoApps = {
	["ASTAP"] = true,
	["Capture One"] = true,
	["MetaImage"] = true,
	["Photos"] = true,
	["PowerPhotos"] = true,
	["Professional Print & Layout"] = true,
	["Siril"] = true,
}

local nightshift = table.concat({ os.getenv("HOME"), ".local", "bin", "nightshift" }, "/")
local truetone = table.concat({ os.getenv("HOME"), ".local", "bin", "truetone" }, "/")

local function appWatcher(_, event, app)
	if event == hs.application.watcher.activated and photoApps[app:name()] then
		hs.execute(table.concat({ nightshift, "off" }, " "))
		hs.execute(table.concat({ truetone, "off" }, " "))
	elseif
		event == hs.application.watcher.deactivated
		and not (
			photoApps[hs.application.frontmostApplication():name()]
			or hs.application.frontmostApplication():name() == "Finder"
		)
	then
		hs.execute(table.concat({ nightshift, "schedule", "sunset" }, " "))
		hs.execute(table.concat({ truetone, "on" }, " "))
	end
end

hs.application.watcher.new(appWatcher):start()
