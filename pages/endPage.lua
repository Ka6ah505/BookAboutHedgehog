local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------

local background, text 
local swipeThreshNext = 100
local swipeThreshPrev = -100
local group
local optionText = {
	text = "",
	x = 1100,
	y = 1380,
	width = 2000,
	font = native.systemFont,
	fontSize = 108,
	align = "center"
}
---------------------------------------------------------------------------------

local function onPageSwap( event )
	local distance
    if event.phase == "moved" then
        print( "moved phase" )
        
    elseif event.phase == "ended" or event.phase == "cancelled" then
    	distance = event.xStart - event.x
    	if distance < swipeThreshPrev and distance < 0 then
			storyboard.removeScene( "pages.endPage" )
			storyboard.gotoScene( "pages.page14", "slideUp", 400  )
	    end
	            display.getCurrentStage():setFocus( nil )

	end
    
    return true
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	group = self.view

	background = display.newImageRect( "images/16.jpg", display.contentWidth, display.contentHeight)
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert( background )

	text = display.newText( optionText )
	text:setFillColor( 255, 255, 255)
	group:insert( text )

	print( "\nend: createScene event")

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	group = self.view
	print( "end: enterScene event" )

	background:addEventListener( "touch", onPageSwap)

end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	group = self.view

	background:removeEventListener( "touch", onPageSwap)

	print( "end: destroyScene event" )

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