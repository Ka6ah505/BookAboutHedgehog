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
local sheetImage, instance, scaleEzi, instance1
-- -------------------------------------------------------------------------------

function createAnimation()
    -- body
    instance = display.newSprite( sheet101, { name="ezik", start=1, count=5, time=1000, loopDirection = "bounce" } )
    instance.anchorX, instance.anchorY = 0, 0
    instance.x = crX
    instance.y = crY
    instance.xScale = scaleEzik*2
    instance.yScale = scaleEzik*2
    group:insert( instance )

    instance1 = display.newSprite( sheet102, { name="ezik", start=1, count=10, time=4000 } )
    instance1.anchorX, instance1.anchorY = 0, 0
    instance1.x = crX
    instance1.y = crY
    instance1.xScale = scaleEzik*2
    instance1.yScale = scaleEzik*2
    group:insert( instance1 )
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 11
            composer.removeScene( "pages.page10" )
            composer.gotoScene( "pages.page11", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 9
            composer.removeScene( "pages.page10" )
            composer.gotoScene( "pages.page9", "slideRight", 1500 )
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
    print("10: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()
    imageGroup = display.newGroup()

    scaleEzik = w/1100

    image = display.newImageRect( "images/10.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )
    
    local txt = display.newImageRect( "text/10.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("10: show")
    local sceneGroup = self.view
    local phase = event.phase
    local params = event.params

    if ( phase == "will" ) then
        print("10: show: will")
        -- Called when the scene is still off screen (but is about to come on screen).
        
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        print("10: show: did")
        instance:play()
        instance1:play()
        image:addEventListener( "touch", onPageSwap )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("10: hide")
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
    print("10: destroy")
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
