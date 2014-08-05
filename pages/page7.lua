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
local sheetImage, instance
-- -------------------------------------------------------------------------------

function createAnimation()
    -- body
    sheetImage = graphics.newImageSheet( "animation/animation_6.png", { x=0, y=0, width=1079, height=1024, numFrames=4 } )
    
    instance = display.newSprite( sheetImage, { name="ezik", start=1, count=4, time=2000 } )
    instance.anchorX, instance.anchorY = 0, 0
    instance.x = crX
    instance.y = crY
    instance.xScale = scaleEzik
    instance.yScale = scaleEzik
    group:insert( instance )
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 8
            composer.removeScene( "pages.page7" )
            composer.gotoScene( "pages.page8", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 6
            composer.removeScene( "pages.page7" )
            composer.gotoScene( "pages.page6", "slideRight", 1500 )
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
    print("7: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()
    imageGroup = display.newGroup()

    scaleEzik = w/1100

    image = display.newImageRect( "images/7.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )
    
    local txt = display.newImageRect( "text/7.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("7: show")
    local sceneGroup = self.view
    local phase = event.phase
    local params = event.params

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        image:addEventListener( "touch", onPageSwap )
        instance:play()
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("7: hide")
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
    print("7: destroy")
    local sceneGroup = self.view

    imageGroup:removeSelf()
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
