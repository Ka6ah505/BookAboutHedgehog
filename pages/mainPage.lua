local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local soundBackdround1, soundChanel1
local chat, imageGroup
-- -------------------------------------------------------------------------------

function playText( event )
    -- body
    if event.phase == "ended" then
        local result = audio.usedChannels
        print( "chanels"..result )
        imageGroup[1]:removeSelf()
        if result > 1 then
            chat = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
            chat.anchorX, chat.anchorY = 0, 0
            chat.x, chat.y = rightRect.width+leftRect.width/2+display.contentWidth/26, leftRect.contentHeight/1.8
            audio.stop( soundChanel1 )
        else
            chat = display.newImageRect( "slicing/ui/icon_speak_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
            chat.anchorX, chat.anchorY = 0, 0
            chat.x, chat.y = rightRect.width+leftRect.width/2+display.contentWidth/26, leftRect.contentHeight/1.8
            soundChanel1 = audio.play( soundBackdround1, {loops = 0} )
        end
        imageGroup:insert( chat )
    end
end

-- "scene:create()"
function scene:create( event )
    print("main: create")
    group = self.view
    local params = event.params
    imageGroup = display.newGroup()
    local image = display.newImageRect( "images/1.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    chat = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
    chat.anchorX, chat.anchorY = 0, 0
    chat.x, chat.y = rightRect.width+leftRect.width/2+display.contentWidth/26, leftRect.contentHeight/1.8
    imageGroup:insert( chat )
    soundBackdround1 = audio.loadSound( "sound/start.mp3" )
end


-- "scene:show()"
function scene:show( event )
    print("show: create")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        imageGroup:addEventListener( "touch", playText )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("hide: create")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )
    print("destroy: create")
    local sceneGroup = self.view
    imageGroup:removeSelf()
    imageGroup:removeEventListener( "touch", playText )
    audio.stop( soundChanel1 )
    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end

-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
