local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local group
local mainPage, onePage, twoPage, threePage, fourPage, fivePage, sixPage
local sevenPage, eightPage, ninePage, tenPage, twelvePage, elevenPage, thirteenPage, fourteenPage, fifteenPage
-- -------------------------------------------------------------------------------

local function buttonHandler( event )
    if event.phase == "ended" then
        if event.target.id == "home"         then countPage = 1 
        elseif event.target.id == "one"      then countPage = 2
        elseif event.target.id == "two"      then countPage = 3
        elseif event.target.id == "three"    then countPage = 4
        elseif event.target.id == "four"     then countPage = 5
        elseif event.target.id == "five"     then countPage = 6
        elseif event.target.id == "six"      then countPage = 7
        elseif event.target.id == "seven"    then countPage = 8
        elseif event.target.id == "eight"    then countPage = 9 
        elseif event.target.id == "nine"     then countPage = 10
        elseif event.target.id == "ten"      then countPage = 11
        elseif event.target.id == "eleven"   then countPage = 12
        elseif event.target.id == "twelve"   then countPage = 13
        elseif event.target.id == "thirteen" then countPage = 14
        elseif event.target.id == "fourteen" then countPage = 15
        elseif event.target.id == "end"      then countPage = 16
        end
        isTextView = true
        composer.removeScene( "pages.titlePage" )
        composer.gotoScene("pages.homePage")
    end
    return true
end

local function createButton()

    mainPage = widget.newButton {
        id = "home",
        x = display.contentWidth/8,
        y = display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_1.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    mainPage.isVisible = true
    group:insert( mainPage )


    onePage = widget.newButton {
        id = "one",
        x = display.contentWidth - 5.3*display.contentWidth/8,
        y = display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_2.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    onePage.isVisible = true
    group:insert( onePage )

    twoPage = widget.newButton {
        id = "two",
        x = display.contentWidth - 3.6*display.contentWidth/8,
        y = display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_3.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    twoPage.isVisible = true
    group:insert( twoPage )

    threePage = widget.newButton {
        id = "three",
        x = display.contentWidth - 1.9*display.contentWidth/8,
        y = display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_4.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    threePage.isVisible = true
    group:insert( threePage )
------------------------------------------------------------------------------------------------------

    fourPage = widget.newButton {
        id = "four",
        x = display.contentWidth/8,
        y = display.contentHeight - 5.2*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_5.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    fourPage.isVisible = true
    group:insert( fourPage )


    fivePage = widget.newButton {
        id = "five",
        x = display.contentWidth - 5.3*display.contentWidth/8,
        y = display.contentHeight - 5.2*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_6.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    fivePage.isVisible = true
    group:insert( fivePage )

    sixPage = widget.newButton {
        id = "six",
        x = display.contentWidth - 3.6*display.contentWidth/8,
        y = display.contentHeight - 5.2*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_7.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    sixPage.isVisible = true
    group:insert( sixPage )

    sevenPage = widget.newButton {
        id = "seven",
        x = display.contentWidth - 1.9*display.contentWidth/8,
        y = display.contentHeight - 5.2*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_8.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    sevenPage.isVisible = true
    group:insert( sevenPage )
------------------------------------------------------------------------------------------------------

    eightPage = widget.newButton {
        id = "eight",
        x = display.contentWidth/8,
        y = display.contentHeight - 3.2*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_9.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    eightPage.isVisible = true
    group:insert( eightPage )

    ninePage = widget.newButton {
        id = "nine",
        x = display.contentWidth - 5.3*display.contentWidth/8,
        y = display.contentHeight - 3.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_10.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    ninePage.isVisible = true
    group:insert( ninePage )

    tenPage = widget.newButton {
        id = "ten",
        x = display.contentWidth - 3.6*display.contentWidth/8,
        y = display.contentHeight - 3.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_11.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    tenPage.isVisible = true
    group:insert( tenPage )

    elevenPage = widget.newButton {
        id = "eleven",
        x = display.contentWidth - 1.9*display.contentWidth/8,
        y = display.contentHeight - 3.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_12.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    elevenPage.isVisible = true
    group:insert( elevenPage )
------------------------------------------------------------------------------------------------------

    twelvePage = widget.newButton {
        id = "twelve",
        x = display.contentWidth/8,
        y = display.contentHeight - 1.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_13.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    twelvePage.isVisible = true
    group:insert( twelvePage )

    thirteenPage = widget.newButton {
        id = "thirteen",
        x = display.contentWidth - 5.3*display.contentWidth/8,
        y = display.contentHeight - 1.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_14.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    thirteenPage.isVisible = true
    group:insert( thirteenPage )

    fourteenPage = widget.newButton {
        id = "fourteen",
        x = display.contentWidth - 3.6*display.contentWidth/8,
        y = display.contentHeight - 1.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_15.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    fourteenPage.isVisible = true
    group:insert( fourteenPage )

    fifteenPage = widget.newButton {
        id = "end",
        x = display.contentWidth - 1.9*display.contentWidth/8,
        y = display.contentHeight - 1.3*display.contentHeight/8,
        width = display.contentWidth/5,
        height = display.contentHeight/5,
        defaultFile = "slicing/content-images/contant_image_16.png",
        label = "",
        emboss = true,
        onEvent = buttonHandler
    }
    fifteenPage.isVisible = true
    group:insert( fifteenPage )
end

-- "scene:create()"
function scene:create( event )

    group = self.view

    background = display.newImageRect( "slicing/background/bg_1.png", h, w )
    background.anchorX, background.anchorY = 0, 0
    background.x, background.y = display.screenOriginY, display.screenOriginX
    group:insert( background )
    print("w: "..h )
    print("h: "..w )

    createButton() 
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

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

    local sceneGroup = self.view

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