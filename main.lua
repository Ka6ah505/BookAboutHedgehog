local composer = require( "composer" )
local widget = require( "widget" )

--скрытие статус бара 
display.setStatusBar( display.HiddenStatusBar )
system.setIdleTimer( false ) 
--display.setDrawMode( "wireframe", true )

local options5 = { frames = require("animation.sequence6").frames, }
local options6 = { frames = require("animation.sequence7").frames, }
local options10 = { frames = require("animation.sequence10").frames, }
local options13 = { frames = require("animation.sequence13").frames, }
local options14 = { frames = require("animation.sequence14").frames, }

soundBackdround = audio.loadSound( "sound/SoundBackground.mp3" )
soundTable = {}

local backGroup
local centerRect

crW = 1
crH = 1
crX = 1
crY = 1

isCheckSound = true
isCheckSoundSpeak = false
checkMaiPage = true

countPage = 1
countTextImage = 2
isTextView = true

w = display.actualContentWidth
h = display.actualContentHeight
print(w..";"..h)

Main = {}
--loadImageSheet = {}
--loadSoundTable = {}
layoutComponent = {}
createButton = {}
buttonHandler = {}
isCheckPage = {}
layoutText = {}
soundMute = {}
offMute = {}
offMuteSpecial = {}
onMute = {}
changeSoundSpeak = {}
checkBackgroundMute = {}

arrowWidth = 15

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
    elseif countPage == 1 then
        if isCheckSound then
            onMute()
        end
	    buttonStart.isVisible = true
        arrowNext.isVisible = false
        arrowBack.isVisible = false
        inStart.isVisible = false 
    end
end

function layoutText( sceneGroup )
	titles = widget.newButton {
		id = "title",
		x = rightRect.width+leftRect.width/2,
		y = leftRect.contentHeight - leftRect.contentHeight/3.2,
		width = display.contentWidth/9,
		height = display.contentHeight/30,
		defaultFile = "slicing/ui/text_content.png",
		onEvent = buttonHandler
	}

    inStart = widget.newButton {
    	id = "inStart",
		x = rightRect.width+leftRect.width/2,
		y = leftRect.contentHeight - leftRect.contentHeight/4.3,
		width = display.contentWidth/14,
		height = display.contentHeight/30,
		defaultFile = "slicing/ui/text_start.png",
		onEvent = buttonHandler
	}
	inStart.isVisible = false
end

function layoutComponent()

	background = display.newImageRect( "slicing/background/bg_"..countPage..".jpg", h, w )
    background.anchorX, background.anchorY = 0, 0
    background.x, background.y = display.screenOriginY, display.screenOriginX
    backGroup:insert( background )
    background.alpha = 1
    backGroup:toBack()

    rightRect = display.newRect( display.screenOriginX, display.screenOriginY, w, w)
    rightRect.anchorX, rightRect.anchorY = 0, 0
    rightRect:setFillColor( 0.4 )
    rightRect.alpha = 0
    rightRect:toBack()

    leftRect = display.newRect( rightRect.width, display.screenOriginY, h-w, w )
    leftRect.anchorX, leftRect.anchorY = 0, 0
    leftRect:setFillColor( 0.7 )
    leftRect.alpha = 0

    centerRect = display.newRect( rightRect.x+20, rightRect.y+20, rightRect.height-40, rightRect.height-40 )
    centerRect.anchorX, centerRect.anchorY = 0, 0
    centerRect:setFillColor( 0.9 )
    centerRect.alpha = 0

    print(w..":"..h)

    crW = centerRect.width
    crH = centerRect.height
    crX = centerRect.x
    crY = centerRect.y
end

function createButton()
    buttonStart = widget.newButton {
        id = "start",
        x = rightRect.width+leftRect.width/2,
        y = leftRect.contentHeight/2.2,
        width = display.contentWidth/6,
        height = display.contentHeight/12,
        defaultFile = "slicing/ui/btn_read_nonpressed.png",
        overFile = "slicing/ui/btn_read_pressed.png",
        label = "",
        onEvent = buttonHandler
    }
    buttonStart.isVisible = true

    arrowNext = widget.newButton {
        id = "next",
        x = rightRect.width+leftRect.width/2+leftRect.width/4,
        y = w - w/10,
        width = display.contentWidth/arrowWidth,
        height = display.contentWidth/arrowWidth,
        defaultFile = "slicing/ui/btn_next.png",
        overFile = "slicing/ui/btn_next_pressed.png",
        onEvent = buttonHandler
    }
    arrowNext.isVisible = false

    arrowBack = widget.newButton {
        id = "back",
        x = rightRect.width+leftRect.width/2-leftRect.width/4,
        y = w - w/10,
        width = display.contentWidth/arrowWidth,
        height = display.contentWidth/arrowWidth,
        defaultFile = "slicing/ui/btn_back.png",
        overFile = "slicing/ui/btn_back_pressed.png",
        onEvent = buttonHandler
    }
    arrowBack.isVisible = false
end

function buttonHandler( event )
    print ("CLICK")
    if event.phase == "ended" then
        if event.target.id == "start" then
            countPage = 2
            composer.removeScene("pages.mainPage" )
            composer.gotoScene("pages.page2")
            buttonStart.isVisible = false
            arrowNext.isVisible = true
            arrowBack.isVisible = true
            inStart.isVisible = true
            changeBackground()
            changeSoundSpeak()
            isCheckPage()
        end

        if event.target.id == "next" and countPage < 16 then
        	composer.removeScene( "pages.page"..countPage )
        	countPage = countPage + 1
            composer.loadScene("pages.page"..countPage)
            composer.gotoScene( "pages.page"..countPage, "slideLeft", 1500 )
            print("Lua memory size, Kb = "..gcinfo())
            print(countPage)
            changeBackground(true)
            changeSoundSpeak()
            isCheckPage()
        end

        if event.target.id == "back" and countPage > 1 then      
        	composer.removeScene( "pages.page"..countPage )
            countPage = countPage - 1 
            composer.gotoScene( "pages.page"..countPage, "slideRight", 1500 )
            print("Lua memory size, Kb = "..gcinfo())
            print(countPage)
            changeBackground(false)
            changeSoundSpeak()
            isCheckPage()
        end

        if event.target.id == "inStart" then
        	composer.removeScene ( "pages.page"..countPage )
        	composer.gotoScene( "pages.mainPage" )
        	countPage = 1
        	changeBackground()
            changeSoundSpeak()
            isCheckPage()
       	end

        if event.target.id == "title" then
            buttonStart.isVisible = false
            arrowNext.isVisible = false
            arrowBack.isVisible = false
            inStart.isVisible = false
            titles.isVisible = false
            composer.removeScene( "pages.page"..countPage )
            composer.removeScene ( "pages.mainPage" )
            composer:gotoScene( "pages.titlePage" )
            rectSound.isVisible = false
            speakSound.isVisible = false
        end
    end
end

function checkBackgroundMute()
    -- body
    if isCheckSound == false then 
        offMute()
    elseif isCheckSound == true then
        onMute()
    end
end

function changeBackground( isPage )
    -- body
    local tmp
    if isPage then
        tmp = countPage-1
        if countPage == 1 then
            tmp = 1
        end
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

    transition.dissolve( tmpBackground, background, 1000, 200 )
    backGroup:insert( background )
    backGroup:toBack()
end

function checkChanelSpeak( event )
    -- body
    if event.completed then
        speakGroup[1]:removeSelf()
        speakSound = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
        speakSound.anchorX, speakSound.anchorY = 0, 0
        speakSound.x, speakSound.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
        --isCheckSoundSpeak = true
        speakGroup:insert( speakSound )
        --isCheckSoundSpeak = true
        --audio.setVolume( 1.0, {channel = soundChanel} )
    end
end

function changeSoundSpeak()
    -- body
    if isCheckSoundSpeak == false then
        audio.stop( soundChanelSpeak )
        speakGroup[1]:removeSelf()
        speakSound = display.newImageRect( "slicing/ui/icon_speak_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
        speakSound.anchorX, speakSound.anchorY = 0, 0
        speakSound.x, speakSound.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
        
        speakGroup:insert( speakSound )
        --isCheckSoundSpeak = true
        soundChanelSpeak = audio.play( soundTable[--[["sound"..]]countPage], {onComplete=checkChanelSpeak} )
        --audio.setVolume( 0.1, {channel = soundChanel} )
        if(countPage ==1 or countPage == 16) then
            audio.pause(soundChanelSpeak)
        end
    else
        --onSpeakMute() 
    end
end

function offMute( event )
    -- body
    soundGroup[1]:removeSelf()
    rectSound = display.newImageRect( "slicing/ui/icon_music_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    rectSound.x, rectSound.y = rightRect.width+leftRect.width/2-display.contentWidth/18, leftRect.contentHeight/1.7
    isCheckSound = false
    audio.pause( soundChanel )
    soundGroup:insert( rectSound )
end

function onMute( event )
    -- body
    soundGroup[1]:removeSelf()
    rectSound = display.newImageRect( "slicing/ui/icon_music_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    rectSound.x, rectSound.y = rightRect.width+leftRect.width/2-display.contentWidth/18, leftRect.contentHeight/1.7
    isCheckSound = true
    audio.resume( soundChanel )
    soundGroup:insert( rectSound )
end

function soundMute( event )
    -- body
    print("In soundMute: start")
    if event.phase == "ended" then  
        if isCheckSound == true then 
            offMute()
        elseif isCheckSound == false then
            onMute()
        end
    end
    print("In soundMute: end")
end

function onSpeakMute( event )
    -- body
    speakGroup[1]:removeSelf()
    speakSound = display.newImageRect( "slicing/ui/icon_speak_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    speakSound.anchorX, speakSound.anchorY = 0, 0
    speakSound.x, speakSound.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
    speakGroup:insert( speakSound )
    soundChanelSpeak = audio.play( soundTable[countPage], {onComplete=checkChanelSpeak} )
    --offMute()
    --audio.pause(soundChanel)
    --audio.setVolume( 0.1, { channel=soundChanel} )
    --audio.setVolume( 1.0, { channel=soundChanelSpeak} )
    if(countPage ==1 or countPage == 16) then
            audio.pause(soundChanelSpeak)
        end
end

function offSpeakMute( event )
    -- body
    speakGroup[1]:removeSelf()
    speakSound = display.newImageRect( "slicing/ui/icon_speak_off.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    speakSound.anchorX, speakSound.anchorY = 0, 0
    speakSound.x, speakSound.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
    speakGroup:insert( speakSound )
    audio.stop( soundChanelSpeak )
    audio.setVolume( 1.0, { channel=soundChanel} )
    --onMute()
    --audio.resume(soundChanel)
end

function speakText( event )
    -- body
    if event.phase == "ended" then
        if isCheckSoundSpeak == true then
            onSpeakMute()
            --offSpeakMute()
            isCheckSoundSpeak = false
        elseif isCheckSoundSpeak == false then
            offSpeakMute()
            --onSpeakMute()
            isCheckSoundSpeak = true
        end
    end
end

function Main()
	-- body
	backGroup = display.newGroup()
    soundGroup = display.newGroup()
    speakGroup = display.newGroup()
	layoutComponent()
	createButton()
	layoutText()

    rectSound = display.newImageRect( "slicing/ui/icon_music_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    rectSound.x, rectSound.y = rightRect.width+leftRect.width/2-display.contentWidth/18, leftRect.contentHeight/1.7
    soundGroup:insert( rectSound )

    speakSound = display.newImageRect( "slicing/ui/icon_speak_on.png", display.contentHeight/arrowWidth, display.contentHeight/arrowWidth )
    speakSound.anchorX, speakSound.anchorY = 0, 0
    speakSound.x, speakSound.y = rightRect.width+leftRect.width/2 + display.contentWidth/26, leftRect.contentHeight/1.8
    speakGroup:insert( speakSound )

    speakGroup:addEventListener( "touch", speakText )
    soundGroup:addEventListener( "touch", soundMute )
    composer.gotoScene( "pages.loadPage" )
    
end

Main()

