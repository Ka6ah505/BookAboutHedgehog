local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local instance, sheetImage, instance1, sheetImage1, sheetImage2, instance2
-- -------------------------------------------------------------------------------

local function createAnimation()
    -- body
    --sheetImage = graphics.newImageSheet( "animation/animation_4.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    --instance = display.newSprite( sheetImage, { name="door1", start=1, count=3, time=2500 } )
    instance = display.newSprite( sheet31, { name="door1", start=1, count=3, time=2500 } )
    instance.x, instance.y = crX, crY
    instance.anchorX, instance.anchorY = 0, 0
    instance.xScale = (w/1200-0.1)*2
    instance.yScale = (w/1200)*2
    group:insert( instance )

    --sheetImage1 = graphics.newImageSheet( "animation/animation_4-2.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    --instance1 = display.newSprite( sheetImage1, { name="door2", start=1, count=3, time=3500 } )
    instance1 = display.newSprite( sheet32, { name="door1", start=1, count=3, time=3500 } )
    instance1.x, instance1.y = crX+30, crY
    instance1.anchorX, instance1.anchorY = 0, 0
    instance1.xScale = (w/1200-0.1)*2
    instance1.yScale = (w/1200)*2
    group:insert( instance1 )

    --sheetImage2 = graphics.newImageSheet( "animation/animation_4-3.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    --instance2 = display.newSprite( sheetImage2, { name="door3", start=1, count=3, time=4500 } )
    instance2 = display.newSprite( sheet33, { name="door3", start=1, count=3, time=4500 } )
    instance2.x, instance2.y = crX+30, crY
    instance2.anchorX, instance2.anchorY = 0, 0
    instance2.xScale = (w/1200-0.1)*2
    instance2.yScale = (w/1200)*2
    group:insert( instance2 )
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 5
            composer.removeScene( "pages.page4" )
            composer.gotoScene( "pages.page5", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 3
            composer.removeScene( "pages.page4" )
            composer.gotoScene( "pages.page3", "slideRight", 1500 )
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
    print("4: create")
    group = self.view
    textGroup = display.newGroup()

    image = display.newImageRect( "images/4.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    local txt = display.newImageRect( "text/4.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("4: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
        
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.   
        instance:play()
        instance1:play()
        instance2:play()
        image:addEventListener( "touch", onPageSwap )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("4: hide")
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
    print("4: destroy")
    local sceneGroup = self.view
    image:removeEventListener( "touch", onPageSwap )
    textGroup:removeSelf()
    --group:removeSelf()
    instance:pause()
    instance1:pause()
    instance2:pause()
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
