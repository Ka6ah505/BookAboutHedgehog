local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local back
-- -------------------------------------------------------------------------------
local function about( event )
    -- body
    if event.phase == "ended" then
        composer.removeScene( "pages.aboutBook" )
        composer.gotoScene( "pages.page16" )
        rectSound.isVisible = true
        speakSound.isVisible = true
        aboutBook.isVisible = true
        arrowBack.isVisible = true
    end
end
-- "scene:create()"
function scene:create( event )
    print("main: create")
    group = self.view

    rectSound.isVisible = false
    speakSound.isVisible = false

    local img = display.newImageRect( "slicing/ui/text_theend.png", crW+20, crH+20 )
    img.anchorX, img.anchorY = 0, 0
    img.x, img.y = crX, crY
    group:insert( img )

    back = display.newImageRect( "slicing/ui/back_btn.png", display.contentWidth/16, display.contentHeight/33 )
    back.x, back.y = rightRect.width+leftRect.width/2, leftRect.contentHeight - leftRect.contentHeight/5.9
    group:insert( back )

    back:addEventListener( "touch", about )
end


-- "scene:show()"
function scene:show( event )
    print("main: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("main: hide")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
    end
end


-- "scene:destroy()"
function scene:destroy( event )
    print("main: destroy")
    local sceneGroup = self.view
    back:removeEventListener( "touch", about )
    group:removeSelf()
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
