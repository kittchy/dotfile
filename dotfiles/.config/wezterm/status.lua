local wezterm = require("wezterm")

local DEFAULT_FG = { Color = "#9a9eab" }
local DEFAULT_BG = { Color = "#333333" }

-- Right status
local HEADER_KEY_NORMAL = { Foreground = DEFAULT_FG, Text = "abc" }
local HEADER_LEADER = { Foreground = { Color = "#ffffff" }, Text = "LEADER" }

local function AddIcon(elems, icon)
	table.insert(elems, { Foreground = icon.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = " " .. icon.Text .. "   " })
end

local function GetKeyboard(elems, window)
	if window:leader_is_active() then
		AddIcon(elems, HEADER_LEADER)
		return
	end

	AddIcon(elems, window:composition_status() or HEADER_KEY_NORMAL)
end

wezterm.on("update-status", function(window, pane)
	local elems = {}
	GetKeyboard(elems, window)
	window:set_left_status(wezterm.format(elems))
end)

-- Left status
local HEADER_HOST = { Foreground = { Color = "#75b1a9" }, Text = "" }
local HEADER_CWD = { Foreground = { Color = "#92aac7" }, Text = "" }
local HEADER_DATE = { Foreground = { Color = "#ffccac" }, Text = "󱪺" }
local HEADER_TIME = { Foreground = { Color = "#bcbabe" }, Text = "" }
local HEADER_BATTERY = { Foreground = { Color = "#dfe166" }, Text = "" }

local function AddElement(elems, header, str)
	table.insert(elems, { Foreground = header.Foreground })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = header.Text .. " " })

	table.insert(elems, { Foreground = DEFAULT_FG })
	table.insert(elems, { Background = DEFAULT_BG })
	table.insert(elems, { Text = str .. "   " })
end
local function GetHostAndCwd(elems, pane)
	local uri = pane:get_current_working_dir()

	if not uri then
		return
	end

	local cwd_uri = uri:sub(8)
	local slash = cwd_uri:find("/")

	if not slash then
		return
	end

	local host = cwd_uri:sub(1, slash - 1)
	local dot = host:find("[.]")

	AddElement(elems, HEADER_HOST, dot and host:sub(1, dot - 1) or host)
	AddElement(elems, HEADER_CWD, cwd_uri:sub(slash))
end

local function GetDate(elems)
	AddElement(elems, HEADER_DATE, wezterm.strftime("%a %b %-d"))
end

local function GetTime(elems)
	AddElement(elems, HEADER_TIME, wezterm.strftime("%H:%M:%S"))
end

local function GetBattery(elems, window)
	if not window:get_dimensions().is_full_screen then
		return
	end

	for _, b in ipairs(wezterm.battery_info()) do
		AddElement(elems, HEADER_BATTERY, string.format("%.0f%%", b.state_of_charge * 100))
	end
end

wezterm.on("update-right-status", function(window, pane)
	local elems = {}

	GetHostAndCwd(elems, pane)
	GetDate(elems)
	-- GetBattery(elems, window)
	GetTime(elems)

	window:set_right_status(wezterm.format(elems))
end)

return {}
