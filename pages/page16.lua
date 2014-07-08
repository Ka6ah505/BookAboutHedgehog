local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local imageGroup
local image, chat
local soundBackdround1, soundChanel1
-- -------------------------------------------------------------------------------

function playText( event )
    -- body
    if event.phase == "ended" then
        local result = audio.usedChannels
        print( "chanels"..result )
        if result > 1 then
            audio.stop( soundChanel1 )
        else
            soundChanel1 = audio.play( soundBackdround1, {loops = 0} )
        end
    end
end

-- "scene:create()"
function scene:create( event )
    print("two: create")
    group = self.view
    local params = event.params
    imageGroup = display.newGroup()

    image = display.newImageRect( "images/16.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )
    
    chat = display.newImageRect( "slicing/ui/chat.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
    chat.anchorX, chat.anchorY = 0, 0
    chat.x, chat.y = rightRect.width+leftRect.width/knopka+leftRect.width/4, display.contentHeight/2.3
    imageGroup:insert( chat )
    soundBackdround1 = audio.loadSound( "sound/15.mp3" )
end

-- "scene:show()"
function scene:show( event )
    print("two: show")
    local sceneGroup = self.view
    local phase = event.phase
    local params = event.params

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        chat:addEventListener( "touch", playText )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("two: hide")
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
    print("two: destroy")
    local sceneGroup = self.view
    imageGroup:removeSelf()
    chat:removeEventListener( "touch", playText )
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