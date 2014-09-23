local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local imageGroup
local image
local vkBtn
-- -------------------------------------------------------------------------------
local function onPageSwap( event )
    local distance
    if event.phase == "moved" then       
    elseif event.phase == "ended" then
        distance = event.xStart - event.x
        if distance < -100 and distance < 0 then
            countPage = 15
            composer.removeScene( "pages.page16" )
            composer.gotoScene( "pages.page15", "slideRight", 1500  )
            changeBackground(false)
            changeSoundSpeak()
        end
        isCheckPage()
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

local function gotoVK( event )
    -- body
    if event.phase == "ended" then
        if event.target.id == "vk" then
            system.openURL( "http://vk.com/gleblok" )
        end
    end
end

-- "scene:create()"
function scene:create( event )
    print("16: create")
    group = self.view
    local params = event.params
    imageGroup = display.newGroup()

    image = display.newImageRect( "images/16.jpg", crW, crH )
    image.anchorX, image.anchorY = 0, 0
    image.x, image.y = crX, crY
    group:insert( image )

    vkBtn = widget.newButton {
        id = "vk",
        x = crW/1.6,
        y = crH/3+ crH/3,
        width = crW/1.8,
        height = crH/8,
        defaultFile = "slicing/ui/vk_btn.png",
        label = "",
        onEvent = gotoVK
    }
    group:insert( vkBtn )
    transition.blink(vkBtn, {time = 2000})
end


-- "scene:show()"
function scene:show( event )
    print("16: show")
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
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("16: hide")
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
    print("16: destroy")
    local sceneGroup = self.view
    group:removeSelf()
    imageGroup:removeSelf()
    image:removeEventListener( "touch", onPageSwap)
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
