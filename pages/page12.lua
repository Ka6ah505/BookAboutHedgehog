local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local image
local ezik, _timer
local bamm = true
-- -------------------------------------------------------------------------------

local function flyEzik()
    ezik = display.newImageRect( "animation/animation_12.png", crW/2, crH/2 )
    ezik.x, ezik.y = crW/2, crH/2
    ezik.anchorX, ezik.anchorY = .5, .5
    ezik.yspeed = 2
    group:insert( ezik )
end

local function update( event )
     -- body
    if ezik.y < crH/3 then
        bamm = true
    elseif ezik.y > crH-crH/3 then
        bamm = false
    end

    if bamm then
       local dy = ezik.y + ezik.yspeed
        ezik.y = dy
    else
        local dy = ezik.y - ezik.yspeed
        ezik.y = dy
    end
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 13
            composer.removeScene( "pages.page12" )
            composer.gotoScene( "pages.page13", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 11
            composer.removeScene( "pages.page12" )
            composer.gotoScene( "pages.page11", "slideRight", 1500 )
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
    print("12: create")
    group = self.view
    local params = event.params
    textGroup = display.newGroup()

    image = display.newImageRect( "images/12.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    local txt = display.newImageRect( "text/12.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    flyEzik()
    _timer = timer.performWithDelay(20, update, 0)
end


-- "scene:show()"
function scene:show( event )
    print("12: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc. 
        image:addEventListener( "touch", onPageSwap )
        arrowNext:setEnabled(true)
        arrowBack:setEnabled(true)
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("12: hide")
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
    print("12: destroy")
    local sceneGroup = self.view
    --_timer = nil
    group:removeSelf()
    textGroup:removeSelf()
    image:removeEventListener( "touch", onPageSwap )
    arrowNext:setEnabled(false)
    arrowBack:setEnabled(false)
    timer.cancel( _timer )
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
