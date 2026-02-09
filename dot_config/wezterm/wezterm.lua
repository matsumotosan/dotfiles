local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

config.leader = { key = "a", mods = "CTRL" }

config.font_size = 13.0
config.font = wezterm.font("MonaspiceNe Nerd Font Mono", { weight = "Medium", italic = false })

config.color_scheme = "Gruvbox Material (Gogh)"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, path, label)
	local workspace_state = resurrect.workspace_state

	workspace_state.restore_workspace(resurrect.state_manager.load_state(label, "workspace"), {
		window = window,
		relative = true,
		restore_text = true,
		on_pane_restore = resurrect.tab_state.default_on_pane_restore,
	})
end)

-- Saves the state whenever I select a workspace
wezterm.on("smart_workspace_switcher.workspace_switcher.selected", function(window, path, label)
	local workspace_state = resurrect.workspace_state
	resurrect.state_manager.save_state(workspace_state.get_workspace_state())
end)

-- save workspace state
resurrect.state_manager.periodic_save({
	interval_seconds = 15 * 60,
	save_workspaces = true,
	save_windows = true,
	save_tabs = true,
})

-- nordic (https://github.com/AlexvZyl/nordic.nvim/blob/78387ba46fe72c7f137b4efdafd424dea526d52c/platforms/wezterm/nordic.toml)
-- config.colors = {
--     foreground    = '#D8DEE9',
--     background    = '#242933',
--     cursor_bg     = '#D8DEE9',
--     cursor_border = '#D8DEE9',
--     cursor_fg     = '#242933',
--     selection_fg  = '#D8DEE9',
--     selection_bg  = '#2E3440',
--
--     ansi          = {
--         '#191D24',
--         '#BF616A',
--         '#A3BE8C',
--         '#EBCB8B',
--         '#81A1C1',
--         '#B48EAD',
--         '#8FBCBB',
--         '#D8DEE9',
--     },
--
--     brights       = {
--         '#3B4252',
--         '#D06F79',
--         '#B1D196',
--         '#F0D399',
--         '#88C0D0',
--         '#C895BF',
--         '#93CCDC',
--         '#E5E9F0',
--     },
--
--     tab_bar       = {
--     }
-- }

config.use_fancy_tab_bar = true
config.window_frame = {
	font = wezterm.font({ family = "MonaspcieNe Nerd Font Mono", weight = "Bold" }),
	font_size = 11.0,
	-- active_titlebar_bg = '#242933',
}

config.keys = {

	-- MODES
	{ key = "]", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "P", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	{ key = " ", mods = "LEADER", action = act.QuickSelect },

	-- PANES
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "V", mods = "LEADER", action = act.SplitPane({ direction="Left", command = {} }) },

	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "S", mods = "LEADER", action = act.SplitPane({ direction="Up", command={} }) },

	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

	-- TABS
	{ key = "t", mods = "LEADER", action = act.SpawnTab("DefaultDomain") },
	-- { key = 'w', mods = 'LEADER',     action = act.CloseCurrentTab({ confirm = true }) },

	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },

	{ key = "<", mods = "LEADER", action = act.MoveTabRelative(-1) },
	{ key = ">", mods = "LEADER", action = act.MoveTabRelative(1) },

	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	{
		key = ".",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_activate_workspace(), line)
				end
			end),
		}),
	},

	-- WINDOWS
	-- { key = 'p', mods = 'LEADER', action = act.ActivateWindowRelative(-1) },
	-- { key = 'n', mods = 'LEADER', action = act.ActivateWindowRelative(1) },

	-- WORKSPACES

	-- Show the launcher in fuzzy selection mode and have it list all workspaces
	-- and allow activating one.
	-- { key = 'w', mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
	{
		key = "w",
		mods = "LEADER",
		action = workspace_switcher.switch_workspace(),
	},

	-- {
	-- 	key = "w",
	-- 	mods = "CTRL|SHIFT",
	-- 	action = act.PromptInputLine({
	-- 		description = wezterm.format({
	-- 			{ Attribute = { Intensity = "Bold" } },
	-- 			{ Foreground = { AnsiColor = "Fuchsia" } },
	-- 			{ Text = "Enter name for new workspace" },
	-- 		}),
	-- 		action = wezterm.action_callback(function(window, pane, line)
	-- 			if line then
	-- 				window:perform_action(
	-- 					act.SwitchToWorkspace({
	-- 						name = line,
	-- 					}),
	-- 					pane
	-- 				)
	-- 			end
	-- 		end),
	-- 	}),
	-- },

	-- RESURRECT

	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
		end),
	},
	{
		key = "r",
		mods = "LEADER",
		action = resurrect.window_state.save_window_action(),
	},
	{
		key = "T",
		mods = "ALT",
		action = resurrect.tab_state.save_tab_action(),
	},
	{
		key = "s",
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
			resurrect.window_state.save_window_action()
		end),
	},
}

wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)

return config
