local composer = require( "composer" )
local widget = require ( "widget" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

local background, rightRect, leftRect
local images, imagesGroup, textGroup
local buttonStart, arrowNext, arrowBack
local imageTexts, titles, separate, inStart
local arrowNext, arrowBack
local soundBackdround, soundChanel

----------------------------------------------------------------------------------
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
        images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", rightRect.width, rightRect.height )
        images.x, images.y = rightRect.x, rightRect.y
        images.anchorX, images.anchorY = 0, 0
        imagesGroup:insert( images )
        --audio.stop( soundChanel )
        audio.play( soundBackdround )
    end
    return true
end

function layoutComponent( sceneGroup, imagesGroup )
    background = display.newImageRect( "slicing/background/bg_1.png", h, w )
    background.anchorX, background.anchorY = 0, 0
    background.x, background.y = display.screenOriginY, display.screenOriginX
    sceneGroup:insert( background )

    rightRect = display.newRect( display.screenOriginX, display.screenOriginY, widthRightRect, w)
    rightRect.anchorX, rightRect.anchorY = 0, 0
    rightRect:setFillColor( 0.5 )
    rightRect.alpha = 0
    sceneGroup:insert( rightRect )

    leftRect = display.newRect( display.screenOriginX+rightRect.height+rightRect.height/4, display.screenOriginY, widthLeftRect, w )
    leftRect.anchorX, leftRect.anchorY = 0, 0
    leftRect:setFillColor( 0 )
    leftRect.alpha = 0
    sceneGroup:insert( leftRect )

    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", rightRect.width, rightRect.height )
    images.anchorX, images.anchorY = 0, 0
    images.alpha = 1
    imagesGroup:insert( images )
    images.x, images,y = rightRect.x, rightRect.y   
end

function layoutText( sceneGroup )
    titles = display.newImageRect( "slicing/ui/text_content.png", display.contentWidth/9, display.contentHeight/30 )
    titles.x = display.screenOriginX+rightRect.width+leftRect.width/2
    titles.y = leftRect.contentHeight - leftRect.contentHeight/3--display.contentHeight - display.contentHeight/3
    sceneGroup:insert( titles )

    separate = display.newImageRect( "slicing/ui/decor_elem.png", display.contentWidth/16, display.contentHeight/80 )
    separate.x = display.screenOriginX+rightRect.width+leftRect.width/2
    separate.y = leftRect.contentHeight - leftRect.contentHeight/3.5
    sceneGroup:insert( separate )

    inStart = display.newImageRect( "slicing/ui/text_start.png", display.contentWidth/11, display.contentHeight/30)
    inStart.x = display.screenOriginX+rightRect.width+leftRect.width/2
    inStart.y = leftRect.contentHeight - leftRect.contentHeight/4
    inStart.isVisible = false
    sceneGroup:insert( inStart )

    if countPage == 1 then
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
        soundChanel = audio.play( soundBackdround, {loop = -1} )
    elseif countPage > 15 then
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3
    textGroup:insert( imageTexts )
end

function gotoTitle( event )
    print( "go to title" )

    if event.phase == "ended" then  
        imagesGroup:removeSelf()
        textGroup:removeSelf()
        composer.removeScene( "pages.homePage" )
        composer:gotoScene( "pages.titlePage", "slideRight", 400 )
        display.getCurrentStage():setFocus( nil )
        audio.stop( soundChanel )
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
        emboss = true,
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
        overFile = "slicing/ui/btn_next.png",
        label = "",
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
        overFile = "slicing/ui/btn_back.png",
        label = "",
        onEvent = buttonHandler
    }
    arrowBack.isVisible = false
    sceneGroup:insert( arrowBack )
end

function buttonHandler( event )
    print ("CLICK")
    if event.phase == "ended" then
        if event.target.id == "start" then
            countPage = 2

            textGroup[1]:removeSelf()
            imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
            imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3
            imageTexts.alpha = 1
            textGroup:insert( imageTexts )

            imagesGroup[1]:removeSelf()
            images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", rightRect.width, rightRect.height )
            images.x, images.y = rightRect.x, rightRect.y
            images.anchorX, images.anchorY = 0, 0

            images.alpha = 1
            imagesGroup:insert( images )

            buttonStart.isVisible = false
            arrowNext.isVisible = true
            arrowBack.isVisible = true
            inStart.isVisible = true
            audio.stop( soundChanel )
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
end

function gotoPageNext()
    countPage = countPage + 1

    local tmp = countPage - 1
    tmpimages = display.newImageRect( "images/"..tmp..""..typeFile..".jpg", rightRect.width, rightRect.height )
    tmpimages.x, tmpimages.y = display.contentWidth/2.5, display.contentHeight/2
    tmpimages.alpha = 1
    transition.to( tmpimages, { time=2500, alpha=0, x=-(500), y=display.contentHeight/2} )

    textGroup[1]:removeSelf()
    if countPage > 15 then
        imageTexts = display.newImageRect( "text/15.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 1
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3
    textGroup:insert( imageTexts )

    print("typeFile: "..typeFile )
    imagesGroup[1]:removeSelf()
    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", rightRect.width, rightRect.height )
    images.alpha = 0
    transition.dissolve( copyImage, images, 1000, 200 )
    images.anchorX, images.anchorY = 0, 0
    images.x, images.y = rightRect.x, rightRect.y
    imagesGroup:insert( images )

    isTextView = true
end

function gotoPagePrev( event )
    countPage = countPage - 1
    local tmp = countPage
    print( countPage )

    local tmp = countPage + 1
    tmpimages = display.newImageRect( "images/"..tmp..""..typeFile..".jpg", rightRect.width, rightRect.height )
    tmpimages.x, tmpimages.y = display.contentWidth/2.5, display.contentHeight/2
    tmpimages.alpha = 1
    transition.moveBy( tmpimages, { time=2500, alpha = 0, x = 1000, y = 0} )

    textGroup[1]:removeSelf()
    if countPage == 1 then 
        imageTexts = display.newImageRect( "text/2.png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 0
        soundChanel = audio.play( soundBackdround, { loop = -1 } )
    else
        imageTexts = display.newImageRect( "text/"..countPage..".png", display.contentWidth/2, display.contentHeight/2 )
        imageTexts.alpha = 1
    end
    imageTexts.x, imageTexts.y = display.contentWidth-display.contentWidth/7.3, display.contentHeight/3
    textGroup:insert( imageTexts )

    imagesGroup[1]:removeSelf()
    images = display.newImageRect( "images/"..countPage..""..typeFile..".jpg", rightRect.width, rightRect.height )
    images.x, images.y = rightRect.width, rightRect.height
    images.alpha = 0
    transition.dissolve(copyImage, images, 1000, 200) 
    images.anchorX, images.anchorY = 1, 1
    imagesGroup:insert( images )

    if countPage == 1 then
        buttonStart.isVisible = true
        arrowNext.isVisible = false
        arrowBack.isVisible = false
        inStart.isVisible = false
    end

    isTextView = true
end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    imagesGroup = display.newGroup()
    textGroup = display.newGroup()

    soundBackdround = audio.loadSound( "SoundBackground.mp3" )

    layoutComponent( sceneGroup, imagesGroup )
    layoutText( sceneGroup )
    createButton( sceneGroup )
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
    --titles.removeEventListener( "touch", gotoTitle )
    --inStart.removeEventListener( "touch", gotoStart )
    --textGroup:removeEventListener( "touch", transitionRight )
    audio.stop()
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