local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()
 
---------------------------------------------------------------------------------
-- Место  для объявления локальных переменных
local background
local group
local swipeThreshNext = 100
local images
local titles, separate, inStart
local PagesGroup
local buttonStart
local arrowNext, arrowBack

---------------------------------------------------------------------------------
-- Обработчики событий
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

local buttonHandler = function( event )
	print ("CLICK")

	if event.target.id == "start" then
		print( "start" )
		buttonStart.isVisible = false
		arrowNext.isVisible = true
		arrowBack.isVisible = true
		inStart.isVisible = true
	end
end

local function gotoTitle( event )
	-- body
	print( "go to title" )

	if event.phase == "ended" then
		storyboard.removeScene( "pages.homePage")
		--storyboard.gotoScene()
	display.getCurrentStage():setFocus( nil )
	end
end

-----------------------------------------------------------------------------------
-- Вызывается когда сцена ещё не существует:
function scene:createScene( event )
	group = self.view
	PagesGroup = self.view
 
	background = display.newImageRect( "slicing/background/bg_1.png", display.contentWidth, display.contentHeight )
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	PagesGroup:insert( background )
	--group:insert( background )

	images = display.newImageRect( "images/1.jpg", display.contentWidth/1.3, display.contentHeight/1.1 )
	images.x, images.y = display.contentWidth/2.4, display.contentHeight/2
	PagesGroup:insert( images )
	
	titles = display.newImageRect( "slicing/ui/text_content.png", display.contentWidth/6, display.contentHeight/20 )
	titles.x = display.contentWidth - display.contentWidth/10
	titles.y = display.contentHeight - display.contentHeight/3,
	group:insert( titles )

	separate = display.newImageRect( "slicing/ui/decor_elem.png", display.contentWidth/6, display.contentHeight/40 )
	separate.x = display.contentWidth - display.contentWidth/10
	separate.y = display.contentHeight - display.contentHeight/3.5
	group:insert( separate )

	inStart = display.newImageRect( "slicing/ui/text_start.png", display.contentWidth/6, display.contentHeight/20)
	inStart.x = display.contentWidth - display.contentWidth/10
	inStart.y = display.contentHeight - display.contentHeight/4
	inStart.isVisible = false
	group:insert( inStart )	
	
	buttonStart = widget.newButton {
		id = "start",
		x = display.contentWidth - display.contentWidth/10,
		y = display.contentHeight/2,
		width = display.contentWidth/6,
	    height = display.contentHeight/12,
		defaultFile = "slicing/ui/btn_read_nonpressed.png",
		overFile = "slicing/ui/btn_read_pressed.png",
		label = "",
		emboss = true,
		onEvent = buttonHandler
	}
	group:insert( buttonStart )

	arrowNext = widget.newButton {
		id = "next",
		x = display.contentWidth - display.contentWidth/20,
		y = display.contentHeight - display.contentHeight/11,
		width = display.contentWidth/12,
		height = display.contentHeight/12,
		defaultFile = "slicing/ui/btn_next.png",
		overFile = "slicing/ui/btn_next.png",
		label = "",
		onEvent = buttonHandler
	}
	arrowNext.isVisible = false
	group:insert( arrowNext )

	arrowBack = widget.newButton {
		id = "back",
		x = display.contentWidth - display.contentWidth/7,
		y = display.contentHeight - display.contentHeight/11,
		width = display.contentWidth/12,
		height = display.contentHeight/12,
		defaultFile = "slicing/ui/btn_back.png",
		overFile = "slicing/ui/btn_back.png",
		label = "",
		onEvent = buttonHandler
	}
	arrowBack.isVisible = false
	group:insert( arrowBack )
	print( "\nhomePage: createScene event")

	separate = d
end
 
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	group = self.view
	
	print( "homePage: enterScene event" )

	background:addEventListener( "touch", onPageSwap )
	titles:addEventListener( "touch", gotoTitle)
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