local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image, chat
local soundBackdround1, soundChanel1
local sheetImage, instance, moveTimer
local imageMask, xMaskScale, yMaskScale
local scaleEzik
-- -------------------------------------------------------------------------------
function createAnimation()
    -- body
    sheetImage = graphics.newImageSheet( "animation/animation_2.png", { x=0, y=0, width=536, height=219, numFrames=3 } )
    instance = display.newSprite( sheetImage, { name="ezik", start=1, count=3, time=500 } )
    instance.x = w+268
    instance.y = display.contentHeight/2 +20
    instance.xScale = scaleEzik
    instance.yScale = scaleEzik
    group:insert( instance )
end

function update( event )
    -- body
    instance.x = instance.x - 3
    if instance.x < -268 then
        print("pause")
        instance.x = w+268--display.contentWidth/2 +200
    end
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 3
            composer.removeScene( "pages.page2" )
            composer.gotoScene( "pages.page3", "slideLeft", 1500  )
            changeBackground(true)
            changeSoundSpeak()
        end
        isCheckPage()
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

-- "scene:create()"
function scene:create( event )
    print("2: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()

    --[[if w == 800 and h == 1280 then
        xMaskScale, yMaskScale, scaleEzik = 6.7, 13, 0.7
    elseif w == 1200 and h == 1920 then
        xMaskScale, yMaskScale, scaleEzik = 10.2, 20, 1
    elseif w == 1536 and h == 2048 then
        xMaskScale, yMaskScale, scaleEzik = 13, 100, 1.5
    elseif w == 768 and h == 1024 then
        xMaskScale, yMaskScale, scaleEzik = 6.5, 13, 0.7
    elseif w == 752 and h == 1280 then
        xMaskScale, yMaskScale, scaleEzik = 6.3, 13, 0.7
    end]]
    xMaskScale, yMaskScale, scaleEzik = w/118-0.1, 100, w/1024

    image = display.newImageRect( "images/2.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = (crX), crY
    group:insert( image )

    imageMask2 = graphics.newMask( "images/mask7.png")

    group:setMask( imageMask2 )
    group.maskScaleX, group.maskScaleY = xMaskScale, yMaskScale
    group.maskX, group.maskY = display.actualContentWidth/2, group.height
-----------------------------------------------
    local txt = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("2: show")
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
        moveTimer = timer.performWithDelay(20, update, 0)
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("2: hide")
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
    print("2: destroy")
    local sceneGroup = self.view
    group:removeSelf()
    textGroup:removeSelf()
    image:removeEventListener( "touch", onPageSwap )
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
