local composer = require( "composer" )
local widget = require ( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

local background, rightRect, leftRect, centerRect, rectSound
local images, imagesGroup, textGroup, soundGroup, backGroup
local buttonStart, arrowNext, arrowBack
local imageTexts, titles, inStart
local arrowNext, arrowBack


----------------------------------------------------------------------------------
function isCheckPage()
    -- body
    if countPage > 2 and countPage < 16 then
        buttonStart.isVisible = false
        arrowNext.isVisible = true
        arrowBack.isVisible = true
        inStart.isVisible = true 
    elseif countPage == 2 then
        buttonStart.isVisible = false
        arrowNext.isVisible = true
        arrowBack.isVisible = false
        inStart.isVisible = true  
    elseif countPage == 16 then
        buttonStart.isVisible = false
        arrowNext.isVisible = false
        arrowBack.isVisible = true
        inStart.isVisible = true      
    end
end

function transitionRight( event )
    print("tap on imageTexts")

    if event.phase == "ended" then
        print("bilo: ")
        print(isTextView )
        if isTextView == true then
            isTextView = false
            transition.moveTo(textGroup, {x = display.contentWidth-display.contentWidth/1.5, y = 0, time = 2000 } )
            --transition.moveTo(textGroup, {x = leftRect.width+leftRect.width/3, y = 0, time = 1500 } )
            print("stalo: ")
            print(isTextView)
        else
            isTextView = true
            transition.moveTo(textGroup, {x = -(display.contentWidth/120), y = 0, time = 2000 } )
            --transition.moveTo(textGroup, {x = -(leftRect.width - leftRect.width/3), y = 0, time = 1500 } )
            print("stalo: ")
            print(isTextView)
        end
    end
end

local function gotoStart( event )
    if event.phase == "ended" then
        print("gotoStart")
        countPage = 1
        buttonStart.isVisible = true
        arrowNext.isVisible = false
        arrowBack.isVisible = false
        inStart.isVisible = false
        imagesGroup[1]:removeSelf()
        imageTexts.alpha = 0
        images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", centerRect.width, centerRect.height )
        images.x, images.y = centerRect.x, centerRect.y
        images.anchorX, images.anchorY = 0, 0
        imagesGroup:insert( images )
        changeBackground(false)
    end
    return true
end

function layoutComponent( sceneGroup, imagesGroup )
    background = display.newImageRect( "slicing/background/bg_"..countPage..".jpg", h, w )
    background.anchorX, background.anchorY = 0, 0
    background.x, background.y = display.screenOriginY, display.screenOriginX
    backGroup:insert( background )
    backGroup:toBack()


    rightRect = display.newRect( display.screenOriginX, display.screenOriginY, widthRightRect, w)
    rightRect.anchorX, rightRect.anchorY = 0, 0
    rightRect:setFillColor( 0 )
    rightRect.alpha = 0
    sceneGroup:insert( rightRect )

    leftRect = display.newRect( display.screenOriginX+rightRect.height+rightRect.height/4, display.screenOriginY, widthLeftRect, w )
    leftRect.anchorX, leftRect.anchorY = 0, 0
    leftRect:setFillColor( 0 )
    leftRect.alpha = 0
    sceneGroup:insert( leftRect )

    centerRect = display.newRect( rightRect.x+20, rightRect.y+20, rightRect.width-40, rightRect.height-40 )
    centerRect.anchorX, centerRect.anchorY = 0, 0
    centerRect:setFillColor( 0.9 )
    centerRect.alpha = 0
    sceneGroup:insert( centerRect )

    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", centerRect.width, centerRect.height )
    images.anchorX, images.anchorY = 0, 0
    images.alpha = 1
    imagesGroup:insert( images )
    images.x, images.y = centerRect.x, centerRect.y
end

function layoutText( sceneGroup )
    titles = display.newImageRect( "slicing/ui/text_content.png", display.contentWidth/9, display.contentHeight/30 )
    titles.x = display.screenOriginX+rightRect.width+leftRect.width/2
    titles.y = leftRect.contentHeight - leftRect.contentHeight/3
    sceneGroup:insert( titles )

    inStart = display.newImageRect( "slicing/ui/text_start.png", display.contentWidth/11, display.contentHeight/30)
    inStart.x = display.screenOriginX+rightRect.width+leftRect.width/2
    inStart.y = leftRect.contentHeight - leftRect.contentHeight/4.3
    inStart.isVisible = false
    sceneGroup:insert( inStart )

    if countPage == 1 then
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
    elseif countPage > 15 then
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( imageTexts )
end

function gotoTitle( event )
    print( "go to title" )
    if event.phase == "ended" then 
        backGroup:removeSelf() 
        imagesGroup:removeSelf()
        soundGroup:removeSelf()
        textGroup:removeSelf()
        composer.removeScene( "pages.homePage" )
        composer:gotoScene( "pages.titlePage", "fade", 400 )
        display.getCurrentStage():setFocus( nil )
    end
    return true
end

function createButton( sceneGroup )
    buttonStart = widget.newButton {
        id = "start",
        x = display.screenOriginX+rightRect.width+leftRect.width/2,
        y = leftRect.contentHeight/2,
        width = display.contentWidth/8,
        height = display.contentHeight/16,
        defaultFile = "slicing/ui/btn_read_nonpressed.png",
        overFile = "slicing/ui/btn_read_pressed.png",
        label = "",
        onEvent = buttonHandler
    }
    buttonStart.isVisible = true
    sceneGroup:insert( buttonStart )

    arrowNext = widget.newButton {
        id = "next",
        x = display.screenOriginX+rightRect.width+leftRect.width-leftRect.width/4,
        y = w - w/10,
        width = display.contentWidth/arrowWidth,
        height = display.contentHeight/arrowHeight,
        defaultFile = "slicing/ui/btn_next.png",
        overFile = "slicing/ui/btn_next_pressed.png",
        onEvent = buttonHandler
    }
    arrowNext.isVisible = false
    sceneGroup:insert( arrowNext )

    arrowBack = widget.newButton {
        id = "back",
        x = display.screenOriginX+rightRect.width+leftRect.width/4,
        y = w - w/10,
        width = display.contentWidth/arrowWidth,
        height = display.contentHeight/arrowHeight,
        defaultFile = "slicing/ui/btn_back.png",
        overFile = "slicing/ui/btn_back_pressed.png",
        onEvent = buttonHandler
    }
    arrowBack.isVisible = false
    sceneGroup:insert( arrowBack )
    sceneGroup:toFront()
end

function changeBackground( isPage )
    -- body
    local tmp
    if isPage then
        tmp = countPage-1
    else 
        tmp = countPage+1
    end
    local tmpBackground = display.newImageRect( "slicing/background/bg_"..tmp..".jpg", h, w )
    tmpBackground.x, tmpBackground.y = display.screenOriginY, display.screenOriginX
    tmpBackground.anchorX, tmpBackground.anchorY = 0, 0
    tmpBackground.alpha = 1
    tmpBackground:toBack()

    backGroup[1]:removeSelf()
    background = display.newImageRect( "slicing/background/bg_"..countPage..".jpg", h, w )
    background.x, background.y = display.screenOriginY, display.screenOriginX
    background.anchorX, background.anchorY = 0, 0
    background.alpha = 0

    transition.dissolve( tmpBackground, background, 1000, 200)
    backGroup:insert( background )
    backGroup:toBack()
end

function buttonHandler( event )
    print ("CLICK")
    if event.phase == "ended" then
        if event.target.id == "start" then
            countPage = 2

            textGroup[1]:removeSelf()
            imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
            imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
            imageTexts.alpha = 1
            textGroup:insert( imageTexts )

            imagesGroup[1]:removeSelf()
            images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", centerRect.width, centerRect.height )
            images.x, images.y = centerRect.x, centerRect.y
            images.anchorX, images.anchorY = 0, 0
            images.alpha = 1
            imagesGroup:insert( images )

            buttonStart.isVisible = false
            arrowNext.isVisible = true
            arrowBack.isVisible = true
            inStart.isVisible = true

            changeBackground()
            --system.openURL("http://www.coronalabs.com")
        end

        if event.target.id == "next" and countPage < 16 then
            gotoPageNext()
            print("Lua memory size, Kb = "..gcinfo())
        end

        if event.target.id == "back" and countPage > 1 then
            gotoPagePrev()
        end
    end
    if isTextView == false then
        transition.moveTo(textGroup, {x = -(display.contentWidth/120), y = 0, time = 2000 } )
    end
    isCheckPage(true)
end

function gotoPageNext()
    countPage = countPage + 1

    local tmp = countPage - 1
    local tmpimages = display.newImageRect( "images/"..tmp..""..typeFile..".jpg", centerRect.width, centerRect.height )
    tmpimages.x, tmpimages.y = display.contentWidth/2.9, display.contentHeight/2
    tmpimages.alpha = 1
    tmpimages:toBack()
    transition.moveBy(tmpimages, { time=1000, alpha=0, x=-(1000), y=0})

    textGroup[1]:removeSelf()
    if countPage > 15 then
        imageTexts = display.newImageRect( "text/15.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
        arrowNext.isVisible = false
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 1
        arrowNext.isVisible = true
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( imageTexts )

    print("typeFile: "..typeFile )
    imagesGroup[1]:removeSelf()
    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", centerRect.width, centerRect.height )
    images.alpha = 1
    images.anchorX, images.anchorY = 0, 0
    images.x, images.y = centerRect.x+1300, centerRect.y
    images:toBack()
    transition.moveBy( images, {time = 1000, x=-(1300), y=0} )
    transition.dissolve(  copyImage, images, 1000, 20 )
    imagesGroup:insert( images )

    isCheckPage()
    isTextView = true
    changeBackground(true)
end

function gotoPagePrev( event )
    countPage = countPage - 1
    local tmp = countPage
    print( countPage )

    local tmp = countPage + 1
    local tmpimages = display.newImageRect( "images/"..tmp..""..typeFile..".jpg", centerRect.width, centerRect.height )
    tmpimages.x, tmpimages.y = display.contentWidth/2.5, display.contentHeight/2
    tmpimages.alpha = 1
    tmpimages:toBack()
    transition.moveBy( tmpimages, { time=1000, alpha = 0, x = 1000, y = 0} )

    textGroup[1]:removeSelf()
    if countPage == 1 then 
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
        soundChanel = audio.play( soundBackdround, { loop = -1 } )
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 1
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3.7
    textGroup:insert( imageTexts )

    imagesGroup:toBack()
    imagesGroup[1]:removeSelf()
    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", centerRect.width, centerRect.height )
    images.alpha = 0
    images.anchorX, images.anchorY = 0, 0
    images.x, images.y = centerRect.x-1100, centerRect.y
    transition.moveBy( images, {time = 1000, x=1100, y=0} )
    transition.dissolve(copyImage, images, 1000, 20) 
    imagesGroup:insert( images )

    if countPage == 1 then
        buttonStart.isVisible = true
        arrowNext.isVisible = false
        arrowBack.isVisible = false
        inStart.isVisible = false
    end
    isCheckPage()
    isTextView = true
    changeBackground(false)
end

function soundMute( event )
    -- body
    print("In soundMute: start")
    if event.phase == "ended" then
        soundGroup[1]:removeSelf()
        if isCheckSound == true then 
            rectSound = display.newImageRect( "slicing/ui/off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
            rectSound.x, rectSound.y = display.screenOriginX+rightRect.width+leftRect.width/2, leftRect.contentHeight/1.7
            isCheckSound = false
            audio.pause( soundChanel )
        elseif isCheckSound == false then
            rectSound = display.newImageRect( "slicing/ui/on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
            rectSound.x, rectSound.y = display.screenOriginX+rightRect.width+leftRect.width/2, leftRect.contentHeight/1.7
            isCheckSound = true
            audio.resume( soundChanel )
        end
        soundGroup:insert( rectSound )
    end
        print("In soundMute: end")
end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    imagesGroup = display.newGroup()
    textGroup = display.newGroup()
    soundGroup = display.newGroup()
    backGroup = display.newGroup()

    layoutComponent( sceneGroup, imagesGroup )
    layoutText( sceneGroup )
    createButton( sceneGroup )

    sceneGroup:toFront()
    if isCheckSound then
        rectSound = display.newImageRect( "slicing/ui/on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    else
        rectSound = display.newImageRect( "slicing/ui/off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    end
    rectSound.x, rectSound.y = display.screenOriginX+rightRect.width+leftRect.width/2, leftRect.contentHeight/1.7
    soundGroup:insert( rectSound )
    print( "create homePage" )    
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if countPage ~= 1 then
        buttonStart.isVisible = false
        arrowNext.isVisible = true
        arrowBack.isVisible = true
        inStart.isVisible = true
    end

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        isCheckPage()
        soundGroup:addEventListener( "touch", soundMute )
        textGroup:addEventListener( "touch", transitionRight )
        titles:addEventListener( "touch", gotoTitle )
        inStart:addEventListener( "touch", gotoStart )
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

    print("destroy")
    --rectSound:removeEventListener("touch", soundMute)
    --titles.removeEventListener( "touch", gotoTitle )
    --inStart.removeEventListener( "touch", gotoStart )
    --textGroup:removeEventListener( "touch", transitionRight )
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