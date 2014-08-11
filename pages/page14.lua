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
local sheetImage, instance, scaleEzik
-- -------------------------------------------------------------------------------

function createAnimation()
    -- body
    instance = display.newSprite( sheet14, { name="ezik", start=1, count=5, time=5000, loopDirection = "bounce" } )
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
            countPage = 15
            composer.removeScene( "pages.page14" )
            composer.gotoScene( "pages.page15", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 13
            composer.removeScene( "pages.page14" )
            composer.gotoScene( "pages.page13", "slideRight", 1500 )
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
    print("14: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()
    imageGroup = display.newGroup()

    scaleEzik = w/1100

    image = display.newImageRect( "images/14.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )
    
    local txt = display.newImageRect( "text/14.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("14: show")
    local sceneGroup = self.view
    local phase = event.phase
    local params = event.params

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        instance:play()
        image:addEventListener( "touch", onPageSwap )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("14: hide")
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
    print("14: destroy")
    local sceneGroup = self.view
    group:removeSelf()
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
