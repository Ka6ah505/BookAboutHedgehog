local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local instance, scaleEzik
-- -------------------------------------------------------------------------------

function createAnimation()
    -- body
    instance = display.newSprite( sheet13, { name="ezik", start=1, count=8, time=10000 } )
    instance.anchorX, instance.anchorY = 1, 1
    instance.x = image.width
    instance.y = image.height-20
    instance.xScale = scaleEzik*2
    instance.yScale = scaleEzik*2
    group:insert( instance )
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 14
            composer.removeScene( "pages.page13" )
            composer.gotoScene( "pages.page14", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 12
            composer.removeScene( "pages.page13" )
            composer.gotoScene( "pages.page12", "slideRight", 1500 )
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
    print("13: create")
    group = self.view
    textGroup = display.newGroup()

    scaleEzik = w/1124--w/1150

    image = display.newImageRect( "images/13.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    local txt = display.newImageRect( "text/13.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    createAnimation()
end


-- "scene:show()"
function scene:show( event )
    print("13: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        instance:play()
        image:addEventListener( "touch", onPageSwap )
        arrowNext:setEnabled(true)
        arrowBack:setEnabled(true)
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("13: hide")
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
    print("13: destroy")
    textGroup:removeSelf()
    group:removeSelf()
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
