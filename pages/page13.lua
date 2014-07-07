local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local imageGroup
local image1, image
-- -------------------------------------------------------------------------------
function transitionRight( event )
    print("tap on imageTexts")

    if event.phase == "ended" then
        print("bilo: ")
        print(isTextView )
        if isTextView == true then
            isTextView = false
            transition.moveTo(textGroup, {x = display.contentWidth-display.contentWidth/1.5, y = 0, time = 2000 } )
            --transition.moveTo(textGroup, {x = leftRect.width+leftRect.width/3, y = 0, time = 1500 } )
            print("stalo: ")
            print(isTextView)
        else
            isTextView = true
            transition.moveTo(textGroup, {x = -(display.contentWidth/120), y = 0, time = 2000 } )
            --transition.moveTo(textGroup, {x = -(leftRect.width - leftRect.width/3), y = 0, time = 1500 } )
            print("stalo: ")
            print(isTextView)
        end
    end
end
-- "scene:create()"
function scene:create( event )
    print("two: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()
    imageGroup = display.newGroup()

    image = display.newImageRect( "images/13.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    local txt = display.newImageRect( "text/13.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )
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
        textGroup:addEventListener( "touch", transitionRight )
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
    textGroup:removeSelf()
    textGroup:removeEventListener( "touch", transitionRight )
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