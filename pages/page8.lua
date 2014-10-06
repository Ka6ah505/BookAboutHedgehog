local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local instance, moveTimer, moveTimer1
local imageMask, xMaskScale, yMaskScale
local scaleEzik
-- -------------------------------------------------------------------------------

function createAnimation()
    -- body
    instance = display.newSprite( sheet8, { name="ezik", start=1, count=2, time=1000 } )
    instance.x = w + 220
    instance.y = display.contentHeight/2 + 20
    instance.xScale = scaleEzik*2
    instance.yScale = scaleEzik*2
    group:insert( instance )

    instance1 = display.newSprite( sheet8, { name="ezik", start=1, count=2, time=1000 } )
    instance1.x = -290
    instance1.y = display.contentHeight - display.contentHeight/4
    instance1.xScale = scaleEzik*2
    instance1.yScale = scaleEzik*2
    instance1:scale(-1, 1)
    group:insert( instance1 )

end

local function update( event )
    -- body
    instance.x = instance.x - 3
    if instance.x < -220 then
        instance.x = w+220
    end
end

local function update1()
    -- body
    instance1.x = instance1.x + 3
    instance1.y = instance1.y - 0.37
    if instance1.x > crW+220 then
        instance1.x = -290
        instance1.y = display.contentHeight - display.contentHeight/4
    end
end

local function StartUpdate()
    timer.resume(moveTimer1)
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 9
            composer.removeScene( "pages.page8" )
            composer.gotoScene( "pages.page9", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 7
            composer.removeScene( "pages.page8" )
            composer.gotoScene( "pages.page7", "slideRight", 1500 )
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
    print("8: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()

    xMaskScale, yMaskScale, scaleEzik = w/118-0.1, 100, w/1024

    image = display.newImageRect( "images/8.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    imageMask = graphics.newMask( "images/mask7.png")

    group:setMask( imageMask )
    group.maskScaleX, group.maskScaleY = xMaskScale, yMaskScale
    group.maskX, group.maskY = display.actualContentWidth/2, group.height
    
    local txt = display.newImageRect( "text/8.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
    moveTimer = timer.performWithDelay(20, update, 0)
    moveTimer1 = timer.performWithDelay(20, update1, 0)
    timer.pause(moveTimer1)
    timer.performWithDelay(4200, StartUpdate, 1)
end


-- "scene:show()"
function scene:show( event )
    print("8: show")
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
        instance1:play()
        arrowNext:setEnabled(true)
        arrowBack:setEnabled(true)
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("8: hide")
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
    print("8: destroy")
    local sceneGroup = self.view
    group:removeSelf()
    textGroup:removeSelf()
    timer.pause( moveTimer )
    timer.cancel( moveTimer1 ) 
    image:removeEventListener( "touch", onPageSwap )
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
