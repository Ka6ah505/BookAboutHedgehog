local storyboard = require( "storyboard" )
local widget = require( "widget" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------

local background, text 
local group
local mainPage, onePage, twoPage, threePage, fourPage, fivePage, sixPage, sevenPage
local eightPage, ninePage, tenPage, elevenPage
---------------------------------------------------------------------------------

local function buttonHandler( event )
	-- body
	if event.phase == "ended" then
		if event.target.id == "home"      	 then countPage = 1 
		elseif event.target.id == "one"   	 then countPage = 2
		elseif event.target.id == "two"   	 then countPage = 3
		elseif event.target.id == "three" 	 then countPage = 4
		elseif event.target.id == "four"  	 then countPage = 5
		elseif event.target.id == "five"  	 then countPage = 6
		elseif event.target.id == "six"   	 then countPage = 7
		elseif event.target.id == "seven" 	 then countPage = 8
		elseif event.target.id == "eight" 	 then countPage = 9	
		elseif event.target.id == "nine"  	 then countPage = 10
		elseif event.target.id == "ten"      then countPage = 11
		elseif event.target.id == "eleven"   then countPage = 12
		elseif event.target.id == "twelve"   then countPage = 13
		elseif event.target.id == "thirteen" then countPage = 14
		elseif event.target.id == "fourteen" then countPage = 15
		elseif event.target.id == "end"      then countPage = 16
		end

		storyboard.removeScene("pages.titlePage")
		storyboard.gotoScene("pages.homePage")
	end
	return true

end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	print( "\ntitle: createScene event")
	storyboard.removeScene("pages.homePage")
	group = self.view
	--background = display.newImageRect( "file.gif", display.contentWidth, display.contentHeight )

	background = display.newImageRect( "slicing/background/bg_1.png", display.contentWidth, display.contentHeight )
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert( background )

----------------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------

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


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	 group = self.view
	print( "title: enterScene event" )
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	group = self.view
	print( "title: destroyScene event" )
end

---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene