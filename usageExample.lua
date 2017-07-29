--**************imports**************
--init pathfinder first and as "pathfinder"
pathfinder = require"Pathfinder.MoveToApp"

--other imports
local battleManiac = require "battleManiac.battleManiac"   
local Map = require "battleManiac.enum.maps"


--**************battle maniac example**************
--test route: viridian forest (early game, so most bots can run it)
local destination = Map.ROUTE_2_STOP2
local origin = Map.ROUTE_2_STOP

--patrol between those points
function switchMoveDirection()
  local tmp = destination
  destination = origin
  origin = tmp
end


function onPathAction()

  local map = getMapName()


  if map==destination then
    switchMoveDirection()


  --if battleManiac is battling, don't do other stuff, frame is already staffed 
  elseif not battleManiac.isBattling() then
  
    --if frame is free, do your intended stuff
    pathfinder.moveTo(map, destination)
  end
  
end

--battling
function onBattleAction()
  return attack() or sendUsablePokemon() or run() or sendAnyPokemon()
end
