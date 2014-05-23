local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
 
---------------------------------------------------------------------------------
-- Место  для объявления локальных переменных
local background
local group
local swipeThreshNext = 100

---------------------------------------------------------------------------------
local function onPageSwap( event )
	local distance
    if event.phase == "moved" then
        print( "moved phase" )
        
    elseif event.phase == "ended" or event.phase == "cancelled" then
    	distance = event.xStart - event.x
    	if distance > swipeThreshNext then
	    	storyboard.removeScene( "pages.homePage" )
			storyboard.gotoScene( "pages.page1", "zoomOutIn", 400  )
        display.getCurrentStage():setFocus( nil )
    	end
    end
    
    return true
end

-- Вызывается когда сцена ещё не существует:
function scene:createScene( event )
	 group = self.view
 
	background = display.newImageRect( "images/1.jpg", display.contentWidth, display.contentHeight )
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert( background )

	print( "\nhomePage: createScene event")
	
end
 
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	 group = self.view
	
	print( "homePage: enterScene event" )

	background:addEventListener( "touch", onPageSwap)

end
 
-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	 group = self.view

	background:removeEventListener( "touch", onPageSwap)

	--display.remove( group )
	group:remove( background )
	--background:removeSelf()
	--background = nil
	print( "homePage: destroyScene")

end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
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