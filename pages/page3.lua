local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local textGroup
local imageGroup
local image
local collection = {}

local screenTop = crW/2
local screenBottom = crW/2+crW/3
local screenLeft = crH/3+display.contentWidth/16
local screenRight = crH/2+crH/3.2
-- -------------------------------------------------------------------------------

local function newFish()
    for i = 1, 3, 1 do
        local fish = display.newImageRect( "animation/fish"..i..".png", display.contentWidth/20, display.contentWidth/20 )
        fish.x, fish.y = crW/2+i*10, crH/2+crH/4
        fish.xdir = 1
        fish.ydir = 1
        fish.xspeed = 0.1+i + w/1024
        fish.yspeed = .2+i
        fish.radius = (display.contentWidth/arrowWidth)/2
        imageGroup:insert( fish )
    end
    group:insert(imageGroup)
end

function collection:enterFrame( event )
    for i = 1, 3, 1 do
        local dx = ( imageGroup[i].xspeed * imageGroup[i].xdir );
        local dy = ( imageGroup[i].yspeed * imageGroup[i].ydir );
        local xNew, yNew = imageGroup[i].x + dx, imageGroup[i].y + dy

        local radius = imageGroup[i].radius
        if ( xNew > screenRight - radius or xNew < screenLeft + radius ) then
            imageGroup[i].xdir = -imageGroup[i].xdir    
            imageGroup[i]:scale( -1, 1 )
        end
        if ( yNew > screenBottom - radius or yNew < screenTop + radius ) then
            imageGroup[i].ydir = -imageGroup[i].ydir
        end

        imageGroup[i]:translate( dx, dy )
    end
end

local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" or event.phase == "cancelled" then
        distance = event.xStart - event.x
        if distance > 100 then
            countPage = 4
            composer.removeScene( "pages.page3" )
            composer.gotoScene( "pages.page4", "slideLeft", 1500 )
            changeBackground(true)
            changeSoundSpeak()
        elseif distance < -100 and distance < 0 then
            countPage = 2
            composer.removeScene( "pages.page3" )
            composer.gotoScene( "pages.page2", "slideRight", 1500 )
            changeBackground(false)
            countPage = 2
            changeSoundSpeak()
        end
        isCheckPage()
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

-- "scene:create()"
function scene:create( event )
    print("3: create")
    group = self.view
    textGroup = display.newGroup()
    imageGroup = display.newGroup()

    image = display.newImageRect( "images/3.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )
    
    local txt = display.newImageRect( "text/3.png", display.contentWidth/2, display.contentHeight/2 )
    txt.x, txt.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( txt )

    newFish()
    Runtime:addEventListener( "enterFrame", collection );
end


-- "scene:show()"
function scene:show( event )
    print("3: show")
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
    print("3: hide")
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
    print("3: destroy")
    local sceneGroup = self.view
    image:removeEventListener( "touch", onPageSwap )
    textGroup:removeSelf()
    imageGroup:removeSelf()
    --group:removeSelf()
    arrowNext:setEnabled(false)
    arrowBack:setEnabled(false)
    Runtime:removeEventListener( "enterFrame", collection );
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
