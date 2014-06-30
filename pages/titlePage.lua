local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local group, slideGroup, rectSlider, scrollView
local mainPage, onePage, twoPage, threePage, fourPage, fivePage, sixPage
local sevenPage, eightPage, ninePage, tenPage, twelvePage, elevenPage, thirteenPage, fourteenPage, fifteenPage
-- -------------------------------------------------------------------------------

local function buttonHandler( event )

    if event.phase == "moved" then
        local dy = math.abs( ( event.y - event.yStart ) )
        if ( dy > 20 ) then
            scrollView:takeFocus( event )
        end
    elseif event.phase == "ended" then
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
        optios = {
            params = {
                var = ""
            }
        }
        isTextView = true
        composer.removeScene( "pages.titlePage" )
        if countPage == 1 then
            composer.gotoScene("pages.mainPage" )
        else
            composer.gotoScene("pages.page"..countPage, optios )
        end
        titles.isVisible = true
        rectSound.isVisible = true
        isCheckPage()
        changeBackground(true)
    end
    return true
end

local function createButton()
-----------------------------------------------------------------------------------------------------
    mainPage = widget.newButton {
        id = "home",
        x = display.contentWidth/4,
        y = display.contentHeight/4 + 40,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_1.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "Home Page",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    mainPage.isVisible = true
    slideGroup:insert( mainPage )

    onePage = widget.newButton {
        id = "one",
        x = display.contentWidth*0.75,
        y = display.contentHeight/4+40,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_2.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "1",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    onePage.isVisible = true
    slideGroup:insert( onePage )


    twoPage = widget.newButton {
        id = "two",
        x = display.contentWidth/4,
        y = 2*display.contentHeight/4 + display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_3.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "2",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    twoPage.isVisible = true
    slideGroup:insert(twoPage)

    threePage = widget.newButton {
        id = "three",
        x = display.contentWidth*.75,
        y = 2*display.contentHeight/4 + display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_4.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "3",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    threePage.isVisible = true
    slideGroup:insert(threePage)
------------------------------------------------------------------------------------------------------

    fourPage = widget.newButton {
        id = "four",
        x = display.contentWidth/4,
        y = 3*display.contentHeight/4 + 2*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_5.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "4",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    fourPage.isVisible = true
    slideGroup:insert(fourPage)

    fivePage = widget.newButton {
        id = "five",
        x = display.contentWidth*.75,
        y = 3*display.contentHeight/4 + 2*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_6.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "5",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    fivePage.isVisible = true
    slideGroup:insert( fivePage )

    sixPage = widget.newButton {
        id = "six",
        x = display.contentWidth/4,
        y = 4*display.contentHeight/4 + 3*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_7.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "6",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    sixPage.isVisible = true
    slideGroup:insert( sixPage )

    sevenPage = widget.newButton {
        id = "seven",
        x = display.contentWidth*.75,
        y = 4*display.contentHeight/4 + 3*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_8.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "7",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    sevenPage.isVisible = true
    slideGroup:insert( sevenPage )
------------------------------------------------------------------------------------------------------

    eightPage = widget.newButton {
        id = "eight",
        x = display.contentWidth/4,
        y = 5*display.contentHeight/4 + 4*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_9.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "8",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    eightPage.isVisible = true
    slideGroup:insert( eightPage )

    ninePage = widget.newButton {
        id = "nine",
        x = display.contentWidth*.75,
        y = 5*display.contentHeight/4 + 4*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_10.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "9",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    ninePage.isVisible = true
    slideGroup:insert( ninePage )

    tenPage = widget.newButton {
        id = "ten",
        x = display.contentWidth/4,
        y = 6*display.contentHeight/4 + 5*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_11.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "10",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    tenPage.isVisible = true
    slideGroup:insert( tenPage )

    elevenPage = widget.newButton {
        id = "eleven",
        x = display.contentWidth*.75,
        y = 6*display.contentHeight/4 + 5*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_12.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "11",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    elevenPage.isVisible = true
    slideGroup:insert( elevenPage )
------------------------------------------------------------------------------------------------------

    twelvePage = widget.newButton {
        id = "twelve",
        x = display.contentWidth/4,
        y = 7*display.contentHeight/4 + 6*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_13.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "12",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    twelvePage.isVisible = true
    slideGroup:insert( twelvePage )

    thirteenPage = widget.newButton {
        id = "thirteen",
        x = display.contentWidth*.75,
        y = 7*display.contentHeight/4 + 6*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_14.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "13",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    thirteenPage.isVisible = true
    slideGroup:insert( thirteenPage )

    fourteenPage = widget.newButton {
        id = "fourteen",
        x = display.contentWidth/4,
        y = 8*display.contentHeight/4 + 7*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_15.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "14",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    fourteenPage.isVisible = true
    slideGroup:insert( fourteenPage )

    fifteenPage = widget.newButton {
        id = "end",
        x = display.contentWidth*.75,
        y = 8*display.contentHeight/4 + 7*display.contentHeight/2,
        width = display.contentHeight/2,
        height = display.contentHeight/2,
        defaultFile = "slicing/content-images/contant_image_16.jpg",
        emboss = true,
        onEvent = buttonHandler,
        label = "End Page",
        labelYOffset = display.contentHeight/4+20,
        labelColor = { default={ 1, 1, 1 } },
        fontSize = display.contentHeight/20,
        font = native.systemFontBold
    }
    fifteenPage.isVisible = true
    slideGroup:insert( fifteenPage )
end

function createText()
    -- body
    local mainText = display.newText("Main Page", display.contentWidth/4, display.contentHeight/4+display.contentHeight/4+40, native.systemFont, display.contentHeight/20)
    slideGroup:insert(mainText)
    local oneText = display.newText("1", display.contentWidth*.75, display.contentHeight/4+display.contentHeight/4+40, native.systemFont, display.contentHeight/20)
    slideGroup:insert(oneText)
    local twoText = display.newText("2", display.contentWidth/4, 2*display.contentHeight/4 + display.contentHeight/2+display.contentHeight/4+20, native.systemFont, display.contentHeight/20)
    slideGroup:insert(twoText)
    local threeText = display.newText("3", display.contentWidth*.75, 2*display.contentHeight/4 + display.contentHeight/2+display.contentHeight/4+20, native.systemFont, display.contentHeight/20)
    slideGroup:insert(threeText)
    local fourText = display.newText("4", display.contentWidth/4, 3*display.contentHeight/4 + 2*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(fourText)
    local fiveText = display.newText("5", display.contentWidth*.75, 3*display.contentHeight/4 + 2*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(fiveText)
    local sixText = display.newText("6", display.contentWidth/4, 4*display.contentHeight/4 + 3*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(sixText)
    local sevenText = display.newText("7", display.contentWidth*.75, 4*display.contentHeight/4 + 3*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(sevenText)
    local eightText = display.newText("8", display.contentWidth/4, 5*display.contentHeight/4 + 4*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(eightText)
    local nineText = display.newText("9", display.contentWidth*.75, 5*display.contentHeight/4 + 4*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(nineText)
    local tenText = display.newText("10", display.contentWidth/4, 6*display.contentHeight/4 + 5*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(tenText)
    local twelveText = display.newText("11", display.contentWidth*.75, 6*display.contentHeight/4 + 5*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(twelveText)
    local elevenText = display.newText("12", display.contentWidth/4, 7*display.contentHeight/4 + 6*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(elevenText)
    local thirteenText = display.newText("13", display.contentWidth*.75, 7*display.contentHeight/4 + 6*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(thirteenText)
    local fourteenText = display.newText("14", display.contentWidth/4, 8*display.contentHeight/4 + 7*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(fourteenText)
    local endText = display.newText("End Page", display.contentWidth*.75, 8*display.contentHeight/4 + 7*display.contentHeight/2+20+display.contentHeight/4, native.systemFont, display.contentHeight/20)
    slideGroup:insert(endText)
end

function gotoMainPage( event )
    -- body
    if event.phase == "began" then
        print("sfsasfdsgah")
        isTextView = true
        countPage = 1
        composer.removeScene("pages.titlePage")
        composer.gotoScene( "pages.mainPage", "fade", 100 )
        titles.isVisible = true
        rectSound.isVisible = true
        isCheckPage()
        changeBackground()
    elseif event.phase == "moved" then
        
    end
end

-- "scene:create()"
function scene:create( event )

    group = self.view
    slideGroup = display.newGroup()

    background = display.newImageRect( "slicing/background/bg_1.jpg", h, w )
    background.anchorX, background.anchorY = 0, 0
    background.x, background.y = display.screenOriginY, display.screenOriginX
    group:insert( background )

    scrollView = widget.newScrollView
    {
        left = 0,
        top = 0,
        width = display.contentWidth,
        height = display.contentHeight,
        bottomPadding = 40,--display.contentHeight/2,
        id = "onBottom",
        horizontalScrollDisabled = true,
        verticalScrollDisabled = false,
        hideBackground = true, 
    }
    scrollView:setScrollWidth( 900 )
    scrollView:setScrollHeight( 900 )

    createButton() 
    --createText()
    scrollView:insert(slideGroup)
    group:insert(scrollView)
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
        mainPage:addEventListener( "touch", gotoMainPage )
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
    group:removeSelf()
    mainPage:removeEventListener( "touch", gotoMainPage )
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