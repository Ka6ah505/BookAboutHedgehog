local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local sheetImage, instance, scaleEzik, sequenceData, _timer
-- -------------------------------------------------------------------------------
local function createAnimation()
    -- body
    --sheetImage = graphics.newImageSheet( "animation/animation_6.png", { x=0, y=0, width=738, height=220, numFrames=7 } )
    sequenceData = {
        { name = "walk", sheet = sheet5, start = 1, count = 7, time = 2000, loopCount = 1 },
        { name = "hearz", sheet = sheet5, start = 5, count = 3, time = 1000, loopCount = 0 }
    }
    --instance = display.newSprite( sheet5, { name="eziki", start=1, count=7, time=2000 } )
    instance = display.newSprite( sheet5, sequenceData )
    instance.anchorX, instance.anchorY = 0, 0
    instance.x = image.width/4
    instance.y = crH/2+crH/6
    instance.xScale = scaleEzik-0.2
    instance.yScale = scaleEzik-0.2
    group:insert( instance )
end

local function swapSheet()
        instance:setSequence( "hearz" )
        instance:play()
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 7
            composer.removeScene( "pages.page6" )
            composer.gotoScene( "pages.page7", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 5
            composer.removeScene( "pages.page6" )
            composer.gotoScene( "pages.page5", "slideRight", 1500 )
            changeBackground(false)
            changeSoundSpeak()
        end
        isCheckPage()
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

-- "scene:create()"
function scene:create( event )
    print("6: create")
    group = self.view
    textGroup = display.newGroup()

    scaleEzik = w/1024

    image = display.newImageRect( "images/6.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    local txt = display.newImageRect( "text/6.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("6: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.   
        image:addEventListener( "touch", onPageSwap )
        instance:play()
        --_timer = timer.performWithDelay( 2000, swapSheet )
        timer.performWithDelay( 2000, swapSheet )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("6: hide")
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
    print("6: destroy")
    local sceneGroup = self.view
    image:removeEventListener( "touch", onPageSwap )
    textGroup:removeSelf()
    --timer.cancel( _timer )
    --group:removeSelf()
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
