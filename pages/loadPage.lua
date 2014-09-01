local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local newProgressView, backgroundLogo, splash
local options5 = { frames = require("animation.sequence6").frames, }
local options6 = { frames = require("animation.sequence7").frames, }
local options10 = { frames = require("animation.sequence10").frames, }
local options13 = { frames = require("animation.sequence13").frames, }
local options14 = { frames = require("animation.sequence14").frames, }
-- -------------------------------------------------------------------------------
local function loadMainPage()
    -- body
    composer.gotoScene("pages.mainPage")
    composer.removeScene("pages.loadPage")
end
local function ds( ... )
    -- body
    transition.fadeOut( splash, { time=2500 } )
end
local function showlogo()
    -- body
    if (newProgressView:getProgress() == 1.0 ) then
        backgroundLogo = display.newImageRect("logo.png", h, w )
        backgroundLogo.anchorX, backgroundLogo.anchorY = 0, 0
        backgroundLogo.x, backgroundLogo.y = 0, 0
        backgroundLogo.alpha = 1
        group:insert(backgroundLogo)

        splash = display.newImageRect("slicing/ui/splash.png", w/2, w/12 )
        splash.anchorX, splash.anchorY = 0.5, 0.5
        splash.x, splash.y = h/2, w/2
        splash.alpha = 0
        transition.fadeIn( splash, { time=2500 } )
        group:insert(splash)
        timer.performWithDelay( 3500, ds, 1)
        timer.performWithDelay( 7000, loadMainPage )
    end
end
local function updateProgressBar(value)
    newProgressView:setProgress(value)
    if (newProgressView:getProgress() == 1.0 ) then
        timer.performWithDelay(500, showlogo)
    end
end
local function blockBC()
    updateProgressBar(1.0)
    sheet101 = graphics.newImageSheet( "animation/animation_10_1.png", { x=0, y=0, width=540, height=512, numFrames=5 } )
    sheet102 = graphics.newImageSheet( "animation/animation_10_2.png", options10 )
    sheet13 = graphics.newImageSheet( "animation/animation_13.png", options13 )
    sheet14 = graphics.newImageSheet( "animation/animation_14.png", options14 )
    sheet15 = graphics.newImageSheet( "animation/animation_15.png", { x=0, y=0, width=540, height=512, numFrames=4 } ) 
end

local function blockBB()
    -- body
    
    sheet8 = graphics.newImageSheet( "animation/animation_8.png", { x=0, y=0, width=435, height=85, numFrames=2 } )
    sheet81 = graphics.newImageSheet( "animation/animation_8_1.png", { x=0, y=0, width=435, height=85, numFrames=2 } )
    sheet91 = graphics.newImageSheet( "animation/animation_9_12.png", { x=0, y=0, width=539, height=512, numFrames=3 } )
    sheet92 = graphics.newImageSheet( "animation/animation_9.png", { x=0, y=0, width=539, height=512, numFrames=3 } )
    sheet6 = graphics.newImageSheet( "animation/animation_7.png", options6 )
    --updateProgressBar(0.9)
    timer.performWithDelay(500, blockBC)
end
local function blockB()
    -- body    
    sheet1 = graphics.newImageSheet( "animation/animation_2.png", { x=0, y=0, width=536, height=219, numFrames=3 } )
    sheet31 = graphics.newImageSheet( "animation/animation_4.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    sheet32 = graphics.newImageSheet( "animation/animation_4-2.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    sheet33 = graphics.newImageSheet( "animation/animation_4-3.png", { x=0, y=0, width=1200, height=1139, numFrames=3 } )
    sheet4 = graphics.newImageSheet( "animation/animation_5.png", { x=0, y=0, width=512, height=558, numFrames=4 } )
    sheet5 = graphics.newImageSheet( "animation/animation_6.png", options5 )
    --updateProgressBar(0.7)
    timer.performWithDelay(500, blockBB)
end
local function blockAC()
    
    table.insert(soundTable, audio.loadSound( "sound/10.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/11.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/12.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/13.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/14.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/15.mp3" ))
    updateProgressBar(0.99)
    timer.performWithDelay(500, blockB)
end
local function blockAB()
    -- body
    
    table.insert(soundTable, audio.loadSound( "sound/4.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/5.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/6.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/7.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/8.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/9.mp3" ))
    updateProgressBar(0.3)
    timer.performWithDelay(500, blockAC)
end 
local function blockA()
    -- body
    table.insert(soundTable, audio.loadSound( "sound/start.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/1.mp3" ))
    table.insert(soundTable, audio.loadSound( "sound/2.mp3" ))
    table.insert(soundTable, audio.loadSound("sound/3.mp3" ))
    updateProgressBar(0.2)
    timer.performWithDelay(500, blockAB)
end
local function loadBackground()
    --load background
    updateProgressBar(0.1)
    timer.performWithDelay(100,blockA)
end

-- "scene:create()"
function scene:create( event )
    print("load: create")
    group = self.view
    buttonStart.isVisible = false
    speakSound.isVisible = false
    rectSound.isVisible = false
    titles.isVisible = false
    inStart.isVisible = false 

    local loader = display.newImageRect( "loader.png", w/3, w/4 )
    loader.anchorX, loader.anchorY = 0.5, 0.5
    loader.x, loader.y = h/2, w/2
    group:insert(loader)

    local options = {
        width = 16,
        height = 16,
        numFrames = 6,
    }
    local progressSheet = graphics.newImageSheet( "progress.png", options )

    -- Create the widget
    newProgressView = widget.newProgressView
    {
        left = h/2-200,
        top = h/2-30,
        width = 400,
        sheet = progressSheet,
        fillOuterLeftFrame = 1,
        fillOuterMiddleFrame = 2,
        fillOuterRightFrame = 3,
        fillInnerLeftFrame = 4,
        fillInnerMiddleFrame = 5,
        fillInnerRightFrame = 6,
        fillOuterWidth = 16,
        fillOuterHeight = 16,
        fillWidth = 16,
        fillHeight = 16,
        isAnimated = true
    }

    group:insert(newProgressView)

    --[[newProgressView = widget.newProgressView {
        left = 30,
        top = 240,
        width = 260,
        isAnimated = true,
    }
    group:insert(newProgressView)]]

    updateProgressBar(0)
    timer.performWithDelay(100, loadBackground)
end


-- "scene:show()"
function scene:show( event )
    print("load: show")
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        --timer.performWithDelay( 100, increaseProgressView, 1 )
    end
end


-- "scene:hide()"
function scene:hide( event )
    print("load: hide")
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
    print("load: destroy")
    local sceneGroup = self.view
    group:remove()
    soundChanelSpeak = audio.play( soundTable[1], {onComplete=checkChanelSpeak} )
    audio.pause( soundChanelSpeak ) 
    --onSpeakMute()
    soundChanel = audio.play( soundBackdround, {loops = -1} )
    audio.setVolume( 0.1, {channel = soundChanel} )
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
