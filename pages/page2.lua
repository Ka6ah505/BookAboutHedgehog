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
    params = event.params

    image = display.newImageRect( "images/2"..typeFile..".jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = (crX), crY
    --imageGroup:insert( image )
    group:insert( image )

    print(crW..";"..crH)

    --[[if params.var == "next" then
        image1 = display.newImageRect( "images/1.jpg", crW, crH )
    elseif params.var == "back" then
        image1 = display.newImageRect( "images/3.jpg", crW, crH )
    else
        image1 = display.newImageRect( "images/2.jpg", crW, crH )
    end
    image1.anchorX, image1.anchorY = 0, 0
    image1.x, image1.y = crX, crY
    imageGroup:insert( image1 )
    group:insert( imageGroup )]]

    local txt = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

end

-- "scene:show()"
function scene:show( event )
    print("two: show")
    local sceneGroup = self.view
    local phase = event.phase
    params = event.params

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        --[[if params.var == "next" then
            transition.to(group, {time=1500, x=crW+crX } )
            transition.to(imageGroup, {time=3000, x=crW } )
        elseif params.var == "back" then
            image.x = crW+crX+crW
            image1.x = crX
            transition.to(group, {time=1500, x=-(crW+crW) } )
            transition.to(imageGroup, {time=3000, x=-crW } )
        else
        end]]
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
    group:removeSelf()
    textGroup:removeSelf()
    imageGroup:removeSelf()
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