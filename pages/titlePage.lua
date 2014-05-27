local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------

local background, text 
local group
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	print( "\n2: createScene event")
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	 group = self.view
	print( "2: enterScene event" )
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	group = self.view
	print( "2: destroyScene event" )
end

---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene