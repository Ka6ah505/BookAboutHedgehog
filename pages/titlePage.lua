local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local group
---------------------------------------------------------------------------------

local background
local group
local homePage, onePage, twoPage, threPage
local pages = {}
---------------------------------------------------------------------------------
-- обработчики
local function gotoPage( event )
	-- body
	if event.phase == "ended" then
		--print( pages )
	end
end
---------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:createScene( event )
	group = self.view
	background = display.newImageRect( "slicing/background/bg_1.png", display.contentWidth, display.contentHeight )
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert( background )

	--group:insert( pages )

	homePage = display.newImageRect( "slicing/content-images/contant_image_1.png", display.contentWidth/5, display.contentHeight/5 )
	homePage.x, homePage.y = display.contentWidth/8, display.contentHeight/8

	onePage = display.newImageRect( "slicing/content-images/contant_image_2.png", display.contentWidth/5, display.contentHeight/5 )
	onePage.x, onePage.y = display.contentWidth - 5.2*display.contentWidth/8, display.contentHeight/8

	twoPage = display.newImageRect( "slicing/content-images/contant_image_3.png", display.contentWidth/5, display.contentHeight/5 )
	twoPage.x, twoPage.y = display.contentWidth - 3.4*display.contentWidth/8, display.contentHeight/8

	threPage = display.newImageRect( "slicing/content-images/contant_image_4.png", display.contentWidth/5, display.contentHeight/5 )
	threPage.x, threPage.y = display.contentWidth - 1.6*display.contentWidth/8, display.contentHeight/8

	table.insert(pages, homePage )
	table.insert(pages, onePage )
	table.insert(pages, twoPage )
	print( "\n2: createScene event" .." $ " .. #pages)
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	group = self.view

	onePage:addEventListener( "touch", gotoPage )
	print( "2: enterScene event" )
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	group = self.view
	onePage:removeEventListener( "touch", gotoPage )
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