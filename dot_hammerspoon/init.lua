local function audioDeviceChanged(event)
	if event ~= "dOut" then
		return
	end

	local defaultDevice = hs.audiodevice.defaultOutputDevice()
	local deviceName = defaultDevice and defaultDevice:name() or "Unknown"
	hs.printf("Audio output changed to: %s", deviceName)

	hs.shortcuts.run("Select headphone EQ by output device")
end

hs.audiodevice.watcher.setCallback(audioDeviceChanged)
hs.audiodevice.watcher.start()
