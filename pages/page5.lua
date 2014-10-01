local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local instance, moveTimer
local imageMask, xMaskScale, yMaskScale
local scaleEzik
-- -------------------------------------------------------------------------------

local function createAnimation()
    -- body
    --sheetImage = graphics.newImageSheet( "animation/animation_5.png", { x=0, y=0, width=512, height=558, numFrames=3 } )
    instance = display.newSprite( sheet4, { name="ezik", start=1, count=4, time=1000 } )
    instance.anchorX, instance.anchorY = 0, 0
    instance.x = crW+20
    instance.y = crH-150
    instance.xScale = scaleEzik*2
    instance.yScale = scaleEzik*2
    group:insert( instance )
end

local function update( event )
    -- body
    instance.x = instance.x - 2
    instance.y = instance.y - 2
    if instance.x < -368 then
        instance.x = crW+20
        instance.y = crH-150
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
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 4
            composer.removeScene( "pages.page5" )
            composer.gotoScene( "pages.page4", "slideRight", 1500 )
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
    print("5: create")
    group = self.view
    textGroup = display.newGroup()
        
    xMaskScale, yMaskScale, scaleEzik = w/118-0.1, h/118-0.1, w/1024

    image = display.newImageRect( "images/5.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )  

    imageMask = graphics.newMask( "images/mask7.png")

    group:setMask( imageMask )
    group.maskScaleX, group.maskScaleY = xMaskScale, yMaskScale-2.29
    group.maskX, group.maskY = display.actualContentWidth/2, display.actualContentHeight/2-138

    local txt = display.newImageRect( "text/5.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
    moveTimer = timer.performWithDelay(20, update, 0)
    instance:play()
end


-- "scene:show()"
function scene:show( event )
    print("5: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        image:addEventListener( "touch", onPageSwap )
        --instance:play()
        arrowNext:setEnabled(true)
        arrowBack:setEnabled(true)
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
    image:removeEventListener( "touch", onPageSwap )
    textGroup:removeSelf()
    group:removeSelf()
    timer.cancel( moveTimer )
    arrowNext:setEnabled(false)
    arrowBack:setEnabled(false)
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
