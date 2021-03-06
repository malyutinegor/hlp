--- Set of helper libraries for developing games with LÖVE.
-- @submodule hlp.asset
-- @submodule hlp.event
-- @module hlp
current = (...)

load = (path) ->
	succ, loaded = pcall require, path
	unless succ
		LC_PATH = current .. '.' .. path
		succ, loaded = pcall require, LC_PATH
		unless succ
			LC_PATH =  current\gsub("%.[^%..]+$", "") .. '.' .. path
			succ, loaded = pcall require, LC_PATH
			unless succ
				error loaded

	return loaded

return {
	asset:   load 'asset'
	locale:  load 'locale'
	ps:      load 'ps'
	csv:     load 'csv'
	Finder:  load 'finder'
}
