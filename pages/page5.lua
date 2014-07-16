local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local imageGroup
local image, chat
local soundBackdround1, soundChanel1
-- -------------------------------------------------------------------------------
function checkChanel( event )
    -- body
    if event.completed then
        imageGroup[1]:removeSelf()
        chat = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
        chat.anchorX, chat.anchorY = 0, 0
        chat.x, chat.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
        imageGroup:insert( chat )
    end
end

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
            soundChanel1 = audio.play( soundBackdround1, {loops = 0, onComplete=checkChanel} )
        end
        imageGroup:insert( chat )
    end
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 6
            composer.removeScene( "pages.page5" )
            composer.gotoScene( "pages.page6", "slideLeft", 1500 )
            changeBackground(true)
        elseif distance < -100 and distance < 0 then
            countPage = 4
            composer.removeScene( "pages.page5" )
            composer.gotoScene( "pages.page4", "slideRight", 1500 )
            changeBackground(false)
        end
        isCheckPage()
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

-- "scene:create()"
function scene:create( event )
    print("5: create")
    group = self.view
    params = event.params
    textGroup = display.newGroup()
    imageGroup = display.newGroup() 
     
    image = display.newImageRect( "images/5.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )  

    local txt = display.newImageRect( "text/5.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    chat = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth)
    chat.anchorX, chat.anchorY = 0, 0
    chat.x, chat.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
    imageGroup:insert( chat )
    soundBackdround1 = audio.loadSound( "sound/4.mp3" )
    imageGroup:addEventListener( "touch", playText )
end


-- "scene:show()"
function scene:show( event )
    print("5: show")
    local sceneGroup = self.view
    local phase = event.phase
    params = event.params

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        
        image:addEventListener( "touch", onPageSwap )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("5: hide")
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
    print("5: destroy")
    local sceneGroup = self.view
    imageGroup:removeSelf()
    textGroup:removeSelf()
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
