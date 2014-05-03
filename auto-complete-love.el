;;; auto-complete-love.el --- auto-complete.el sources for the LOVE project  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Rolando Pereira

;; Author: Rolando Pereira <finalyugi@sapo.pt>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provide an auto-complete-source for the builtin löve functions.
;;                                                                              
;; To install this library, add this file in your load-path and then
;; add the following to your .emacs:
;;
;;    (require 'auto-complete-love)
;;    (add-hook 'lua-mode-hook '(lambda ()
;;                                 (setq ac-sources '(ac-source-love))
;;                                 ; Uncomment only if you're using
;;                                 ; `auto-complete-lua' (see below)
;;                                 ;(push ac-source-lua ac-sources)
;;                                 (auto-complete-mode)))
;;
;; 
;;
;; You may also like to use the package `auto-complete-lua', available here:
;;
;;     https://github.com/rolpereira/auto-complete-lua.el
;;

;;; Code:

(defvar auto-complete-love--builtin-functions
  '(("love.audio.getDistanceModel" . "Returns the distance attenuation model.")
     ("love.audio.getSourceCount" . "Returns the number of sources which are currently playing or paused.")
     ("love.audio.getOrientation" . "Returns the orientation of the listener.")
     ("love.audio.getPosition" . "Returns the position of the listener.")
     ("love.audio.getVelocity" . "Returns the velocity of the listener.")
     ("love.audio.getVolume" . "Returns the master volume.")
     ("love.audio.newSource" . "Creates a new Source from a file or SoundData. Sources created from SoundData are always static.")
     ("love.audio.pause" . "Pauses all audio")
     ("love.audio.play" . "Plays the specified Source.")
     ("love.audio.resume" . "Resumes all audio")
     ("love.audio.rewind" . "Rewinds all playing audio.")
     ("love.audio.setDistanceModel" . "Sets the distance attenuation model.")
     ("love.audio.setOrientation" . "Sets the orientation of the listener.")
     ("love.audio.setPosition" . "Sets the position of the listener, which determines how sounds play.")
     ("love.audio.setVelocity" . "Sets the velocity of the listener.")
     ("love.audio.setVolume" . "Sets the master volume.")
     ("love.audio.stop" . "Stops all playing audio.")
     ("love.event.clear" . "Clears the event queue.")
     ("love.event.poll" . "Returns an iterator for messages in the event queue.")
     ("love.event.pump" . "Pump events into the event queue. This is a low-level function, and is usually not called by the user, but by love.run. Note that this does need to be called for any OS to think you're still running, and if you want to handle OS-generated events at all (think callbacks). love.event.pump can only be called from the main thread, but afterwards, the rest of love.event can be used from any other thread.")
     ("love.event.push" . "Adds an event to the event queue.")
     ("love.event.quit" . "Adds the quit event to the queue.

The quit event is a signal for the event handler to close LÖVE. It's possible to abort the exit process with the love.quit callback.")
     ("love.event.wait" . "Like love.event.poll but blocks until there is an event in the queue.")
     ("love.filesystem.append" . "Append data to an existing file.")
     ("love.filesystem.createDirectory" . "Creates a directory.")
     ("love.filesystem.exists" . "Check whether a file or directory exists.")
     ("love.filesystem.getAppdataDirectory" . "Returns the application data directory (could be the same as getUserDirectory)")
     ("love.filesystem.getDirectoryItems" . "Returns a table with the names of files and subdirectories in the specified path. The table is not sorted in any way; the order is undefined.

If the path passed to the function exists in the game and the save directory, it will list the files and directories from both places.")
     ("love.filesystem.getIdentity" . "Gets the write directory name for your game. Note that this only returns the name of the folder to store your files in, not the full location.")
     ("love.filesystem.getLastModified" . "Gets the last modification time of a file.")
     ("love.filesystem.getSaveDirectory" . "Gets the full path to the designated save directory. This can be useful if you want to use the standard io library (or something else) to read or write in the save directory.")
     ("love.filesystem.getSize" . "Gets the size in bytes of a file.")
     ("love.filesystem.getUserDirectory" . "Returns the path of the user's directory.")
     ("love.filesystem.getWorkingDirectory" . "Gets the current working directory.")
     ("love.filesystem.isDirectory" . "Check whether something is a directory.")
     ("love.filesystem.isFile" . "Check whether something is a file.")
     ("love.filesystem.isFused" . "Gets whether the game is in fused mode or not.

If a game is in fused mode, its save directory will be directly in the Appdata directory instead of Appdata/LOVE/. The game will also be able to load C Lua dynamic libraries which are located in the save directory.

A game is in fused mode if the source .love has been fused to the executable (see Game Distribution), or if \"--fused\" has been given as a command-line argument when starting the game.")
     ("love.filesystem.lines" . "Iterate over the lines in a file.")
     ("love.filesystem.load" . "Load a file (but not run it).")
     ("love.filesystem.newFile" . "Creates a new File object. It needs to be opened before it can be accessed.")
     ("love.filesystem.newFileData" . "Creates a new FileData object.")
     ("love.filesystem.read" . "Read the contents of a file.")
     ("love.filesystem.remove" . "Removes a file or directory.")
     ("love.filesystem.setIdentity" . "Sets the write directory for your game. Note that you can only set the name of the folder to store your files in, not the location.")
     ("love.filesystem.write" . "Write data to a file.

If you are getting the error message \"Could not set write directory\", try setting the save directory. This is done either with love.filesystem.setIdentity or by setting the identity field in love.conf.")
     ("love.graphics.arc" . "Draws an arc.")
     ("love.graphics.circle" . "Draws a circle.")
     ("love.graphics.clear" . "Clears the screen to background color and restores the default coordinate system.

This function is called automatically before love.draw in the default love.run function. See the example in love.run for a typical use of this function.

Note that the scissor area bounds the cleared region.")
     ("love.graphics.draw" . "Draws objects on screen. Drawable objects are loaded images, but may be other kinds of Drawable objects, such as a ParticleSystem.

In addition to simple drawing, this function can rotate and scale the object at the same time, as well as offset the image (for example, to center the image at the chosen coordinates).

love.graphics.draw anchors from the top left corner by default.

You can specify a negative value for sx or sy to flip the drawable horizontally or vertically.

The pivotal point is (x, y) on the screen and (ox, oy) in the internal coordinate system of the drawable object, before rotation and scaling. The object is scaled by (sx, sy), then rotated by r around the pivotal point.

The origin offset values are most often used to shift the images up and left by half of its height and width, so that (effectively) the specified x and y coordinates are where the center of the image will end up.")
     ("love.graphics.getBackgroundColor" . "Gets the current background color.")
     ("love.graphics.getBlendMode" . "Gets the blending mode.")
     ("love.graphics.getCanvas" . "Gets the current target Canvas.")
     ("love.graphics.getColor" . "Gets the current color.")
     ("love.graphics.getColorMask" . "Gets the active color components used when drawing. Normally all 4 components are active unless love.graphics.setColorMask has been used.

The color mask determines whether individual components of the colors of drawn objects will affect the color of the screen. They affect love.graphics.clear and Canvas:clear as well.")
     ("love.graphics.getDefaultFilter" . "Returns the default scaling filters used with Images, Canvases, and Fonts.")
     ("love.graphics.getDimensions" . "Gets the width and height of the window.")
     ("love.graphics.getFSAA" . "Gets the number of antialiasing samples used when drawing to the Canvas.

This may be different than the number used as an argument to love.graphics.newCanvas if the system running LÖVE doesn't support that number.")
     ("love.graphics.getFont" . "Gets the current Font object.")
     ("love.graphics.getHeight" . "Gets the height of the window.")
     ("love.graphics.getLineJoin" . "Gets the line join style.")
     ("love.graphics.getLineStyle" . "Gets the line style.")
     ("love.graphics.getLineWidth" . "Gets the current line width.")
     ("love.graphics.getFullscreenModes" . "Gets a list of supported fullscreen modes.")
     ("love.graphics.getShader" . "Returns the current Shader. Returns nil if none is set.")
     ("love.graphics.getSystemLimit" . "Gets the system-dependent maximum value for a love.graphics feature.")
     ("love.graphics.getPointSize" . "Gets the point size.")
     ("love.graphics.getPointStyle" . "Gets the current point style.")
     ("love.graphics.getRendererInfo" . "Gets information about the system's video card and drivers.")
     ("love.graphics.getScissor" . "Gets the current scissor box.")
     ("love.graphics.getWidth" . "Gets the width of the window.")
     ("love.graphics.isSupported" . "Checks if certain graphics functions can be used.

Older and low-end systems do not always support all graphics extensions.")
     ("love.graphics.isWireframe" . "Gets whether wireframe mode is used when drawing.")
     ("love.graphics.line" . "Draws lines between points.")
     ("love.graphics.newCanvas" . "Creates a new Canvas object for offscreen rendering.

Antialiased Canvases have slightly higher system requirements than normal Canvases. Additionally, the supported maximum number of FSAA samples varies depending on the system. Use love.graphics.getSystemLimit to check.

If the number of FSAA samples specified is greater than the maximum supported by the system, the Canvas will still be created but only using the maximum supported amount (this includes 0.)")
     ("love.graphics.newFont" . "Creates a new Font.")
     ("love.graphics.newMesh" . "Creates a new Mesh.")
     ("love.graphics.newImage" . "Creates a new Image.")
     ("love.graphics.newImageFont" . "Creates a new font by loading a specifically formatted image. There can be up to 256 glyphs.

Expects ISO 8859-1 encoding for the glyphs string.")
     ("love.graphics.newParticleSystem" . "Creates a new ParticleSystem.")
     ("love.graphics.newShader" . "Creates a new Shader object for hardware-accelerated vertex and pixel effects. A Shader contains either vertex shader code, pixel shader code, or both.

Vertex shader code must contain at least one function, named position, which is the function that will produce transformed vertex positions of drawn objects in screen-space.

Pixel shader code must contain at least one function, named effect, which is the function that will produce the color which is blended onto the screen for each pixel a drawn object touches.")
     ("love.graphics.newQuad" . "Creates a new Quad.

The purpose of a Quad is to describe the result of the following transformation on any drawable object. The object is first scaled to dimensions sw * sh. The Quad then describes the rectangular area of dimensions width * height whose upper left corner is at position (x, y) inside the scaled object.")
     ("love.graphics.newScreenshot" . "Creates a screenshot and returns the image data.")
     ("love.graphics.newSpriteBatch" . "Creates a new SpriteBatch object.")
     ("love.graphics.origin" . "Resets the current coordinate transformation.

This function is always used to reverse any previous calls to love.graphics.rotate, love.graphics.scale, love.graphics.shear or love.graphics.translate. It returns the current transformation state to its defaults.")
     ("love.graphics.point" . "Draws a point.

The pixel grid is actually offset to the center of each pixel. So to get clean pixels drawn use 0.5 + integer increments.")
     ("love.graphics.polygon" . "Draw a polygon.

Following the mode argument, this function can accept multiple numeric arguments or a single table of numeric arguments. In either case the arguments are interpreted as alternating x and y coordinates of the polygon's vertices.

When in fill mode, the polygon must be convex and simple or rendering artifacts may occur.")
     ("love.graphics.pop" . "Pops the current coordinate transformation from the transformation stack.

This function is always used to reverse a previous push operation. It returns the current transformation state to what it was before the last preceding push. For an example, see the description of love.graphics.push.")
     ("love.graphics.present" . "Displays the results of drawing operations on the screen.

This function is used when writing your own love.run function. It presents all the results of your drawing operations on the screen. See the example in love.run for a typical use of this function.")
     ("love.graphics.print" . "Draws text on screen. If no Font is set, one will be created and set (once) if needed.

When using translation and scaling functions while drawing text, this function assumes the scale occurs first. If you don't script with this in mind, the text won't be in the right position, or possibly even on screen.

love.graphics.print stops at the first '\0' (null) character. This can bite you if you are appending keystrokes to form your string, as some of those are multi-byte unicode characters which will likely contain null bytes.")
     ("love.graphics.printf" . "Draws formatted text, with word wrap and alignment.

See additional notes in love.graphics.print.")
     ("love.graphics.push" . "Copies and pushes the current coordinate transformation to the transformation stack.

This function is always used to prepare for a corresponding pop operation later. It stores the current coordinate transformation state into the transformation stack and keeps it active. Later changes to the transformation can be undone by using the pop operation, which returns the coordinate transform to the state it was in before calling push.")
     ("love.graphics.rectangle" . "Draws a rectangle.")
     ("love.graphics.reset" . "Resets the current graphics settings.

Calling reset makes the current drawing color white, the current background color black, resets any active Canvas or Shader, and removes any scissor settings. It sets the BlendMode to alpha. It also sets both the point and line drawing modes to smooth and their sizes to 1.0.")
     ("love.graphics.rotate" . "Rotates the coordinate system in two dimensions.

Calling this function affects all future drawing operations by rotating the coordinate system around the origin by the given amount of radians. This change lasts until love.draw exits.")
     ("love.graphics.scale" . "Scales the coordinate system in two dimensions.

By default the coordinate system in LÖVE corresponds to the display pixels in horizontal and vertical directions one-to-one, and the x-axis increases towards the right while the y-axis increases downwards. Scaling the coordinate system changes this relation.

After scaling by sx and sy, all coordinates are treated as if they were multiplied by sx and sy. Every result of a drawing operation is also correspondingly scaled, so scaling by (2, 2) for example would mean making everything twice as large in both x- and y-directions. Scaling by a negative value flips the coordinate system in the corresponding direction, which also means everything will be drawn flipped or upside down, or both. Scaling by zero is not a useful operation.

Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.

Scaling lasts until love.draw exits.")
     ("love.graphics.setBackgroundColor" . "Sets the background color.")
     ("love.graphics.setBlendMode" . "Sets the blending mode.")
     ("love.graphics.setCanvas" . "Sets the render target to one or more Canvases. All drawing operations until the next love.graphics.setCanvas call will be redirected to the specified canvases and not shown on the screen.

All canvas arguments must have the same widths and heights and the same texture type. Normally the same thing will be drawn on each canvas, but that can be changed if a pixel shader is used with the \"effects\" function instead of the regular effect.

Not all computers support Canvases, and not all computers which support Canvases will support multiple render targets. Use love.graphics.isSupported to check.

nWhen called without arguments, the render target is reset to the screen.")
     ("love.graphics.setColor" . "Sets the color used for drawing.")
     ("love.graphics.setColorMask" . "Sets the color mask. Enables or disables specific color components when rendering and clearing the screen. For example, if red is set to false, no further changes will be made to the red component of any pixels.

Enables all color components when called without arguments.")
     ("love.graphics.setDefaultFilter" . "Sets the default scaling filters used with Images, Canvases, and Fonts.

This function does not apply retroactively to loaded images.")
     ("love.graphics.setFont" . "Set an already-loaded Font as the current font or create and load a new one from the file and size.

It's recommended that Font objects are created with love.graphics.newFont in the loading stage and then passed to this function in the drawing stage.")
     ("love.graphics.setInvertedStencil" . "Defines an inverted stencil for the drawing operations or releases the active one.

It's the same as love.graphics.setStencil with the mask inverted.

Calling the function without arguments releases the active stencil.")
     ("love.graphics.setLineJoin" . "Sets the line join style.")
     ("love.graphics.setLineStyle" . "Sets the line style.")
     ("love.graphics.setLineWidth" . "Sets the line width.")
     ("love.graphics.setNewFont" . "Creates and sets a new font.")
     ("love.graphics.setShader" . "Sets or resets a Shader as the current pixel effect or vertex shaders. All drawing operations until the next love.graphics.setShader will be drawn using the Shader object specified.

Disables the shaders when called without arguments.")
     ("love.graphics.setPointSize" . "Sets the point size.")
     ("love.graphics.setPointStyle" . "Sets the point style.")
     ("love.graphics.setScissor" . "Sets or disables scissor.

The scissor limits the drawing area to a specified rectangle. This affects all graphics calls, including love.graphics.clear.")
     ("love.graphics.setWireframe" . "Sets whether wireframe lines will be used when drawing.

Wireframe mode should only be used for debugging. The lines drawn with it enabled do not behave like regular love.graphics lines: their widths don't scale with the coordinate transformations or with love.graphics.setLineWidth, and they don't use the smooth LineStyle.")
     ("love.graphics.setStencil" . "Defines or releases a stencil for the drawing operations.

The passed function draws to the stencil instead of the screen, creating an image with transparent and opaque pixels. While active, it is used to test where pixels will be drawn or discarded.

Calling the function without arguments releases the active stencil.

When called without arguments, the active stencil is released.")
     ("love.graphics.shear" . "Shears the coordinate system.")
     ("love.graphics.translate" . "Translates the coordinate system in two dimensions.

When this function is called with two numbers, dx, and dy, all the following drawing operations take effect as if their x and y coordinates were x+dx and y+dy.

Scale and translate are not commutative operations, therefore, calling them in different orders will change the outcome.

This change lasts until love.graphics.clear is called (which is called automatically before love.draw in the default love.run function), or a love.graphics.pop reverts to a previous coordinate system state.

Translating using whole numbers will prevent tearing/blurring of images and fonts draw after translating.")
     ("love.image.isCompressed" . "Determines whether a file can be loaded as CompressedData.")
     ("love.image.newCompressedData" . "Create a new CompressedData object from a compressed image file. LÖVE currently supports DDS files compressed with the DXT1, DXT5, and BC5 / 3Dc formats.")
     ("love.image.newImageData" . "Create a new ImageData object.")
     ("love.joystick.setGamepadMapping" . "Binds a virtual gamepad input to a button, axis or hat for all Joysticks of a certain type. For example, if this function is used with a GUID returned by a Dualshock 3 controller in OS X, the binding will affect Joystick:getGamepadAxis and Joystick:isGamepadDown for all Dualshock 3 controllers used with the game when run in OS X.

LÖVE includes built-in gamepad bindings for many common controllers. This function lets you change the bindings or add new ones for types of Joysticks which aren't recognized as gamepads by default.

The virtual gamepad buttons and axes are designed around the Xbox 360 controller layout.")
     ("love.joystick.getJoystickCount" . "Gets the number of connected joysticks.")
     ("love.joystick.getJoysticks" . "Gets a list of connected Joysticks.")
     ("love.keyboard.hasKeyRepeat" . "Gets whether key repeat is enabled.")
     ("love.keyboard.hasTextInput" . "Gets whether text input events are enabled.")
     ("love.keyboard.isDown" . "Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.")
     ("love.keyboard.setKeyRepeat" . "Enables or disables key repeat. It is disabled by default.

The interval between repeats depends on the user's system settings.")
     ("love.keyboard.setTextInput" . "Enables or disables text input events. It is enabled by default.")
     ("love.math.gammaToLinear" . "Converts a color from gamma-space (sRGB) to linear-space (RGB). This is useful when doing gamma-correct rendering using colors created based on what they look like on-screen.

Gamma-space sRGB has more precision in the lower end than linear RGB. Using this function to convert from sRGB to RGB can result in non-integer color values, which get truncated to integers and lose precision when used with other functions such as love.graphics.setColor.")
     ("love.math.getRandomSeed" . "Gets the seed of the random number generator.

The state is split into two numbers due to Lua's use of doubles for all number values - doubles can't accurately represent integer values above 2^53.")
     ("love.math.getRandomState" . "Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.

This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.

The value of the state string does not depend on the current operating system.")
     ("love.math.isConvex" . "Checks whether a polygon is convex.

PolygonShapes in love.physics, some forms of Mesh, and polygons drawn with love.graphics.polygon must be simple convex polygons.")
     ("love.math.linearToGamma" . "Converts a color from linear-space (RGB) to gamma-space (sRGB). This is useful when storing linear RGB color values in an image, because the linear RGB color space has less precision than sRGB for dark colors, which can result in noticeable color banding when drawing.

In general, colors chosen based on what they look like on-screen are already in gamma-space and should not be double-converted. Colors calculated using math are often in the linear RGB space.")
     ("love.math.newBezierCurve" . "Creates a new BezierCurve object.

The number of vertices in the control polygon determines the degree of the curve, e.g. three vertices define a quadratic (degree 2) Bézier curve, four vertices define a cubic (degree 3) Bézier curve, etc.")
     ("love.math.newRandomGenerator" . "Creates a new RandomGenerator object which is completely independent of other RandomGenerator objects and random functions.")
     ("love.math.noise" . "Generates a Simplex noise value in 1-4 dimensions.

Simplex noise is closely related to Perlin noise. It is widely used for procedural content generation.")
     ("love.math.random" . "Generates a pseudo random number in a platform independent way.")
     ("love.math.randomNormal" . "Get a normally distributed pseudo random number.")
     ("love.math.setRandomSeed" . "Sets the seed of the random number generator using the specified integer number.")
     ("love.math.setRandomState" . "Gets the current state of the random number generator. This returns an opaque implementation-dependent string which is only useful for later use with RandomGenerator:setState.

This is different from RandomGenerator:getSeed in that getState gets the RandomGenerator's current state, whereas getSeed gets the previously set seed number.

The value of the state string does not depend on the current operating system.")
     ("love.math.triangulate" . "Triangulate a simple polygon.")
     ("love.mouse.getCursor" . "Gets the current Cursor.")
     ("love.mouse.getPosition" . "Returns the current position of the mouse.")
     ("love.mouse.getSystemCursor" . "Gets a Cursor object representing a system-native hardware cursor.

 Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.")
     ("love.mouse.getX" . "Returns the current x position of the mouse.")
     ("love.mouse.getY" . "Returns the current y position of the mouse.")
     ("love.mouse.isDown" . "Checks whether a certain mouse button is down. This function does not detect mousewheel scrolling; you must use the love.mousepressed callback for that.")
     ("love.mouse.isGrabbed" . "Checks if the mouse is grabbed.")
     ("love.mouse.isVisible" . "Checks if the cursor is visible.")
     ("love.mouse.newCursor" . "Creates a new hardware Cursor object from an image file or ImageData.

Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low frameratesn

The hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.")
     ("love.mouse.setCursor" . "Sets the current mouse cursor.

Resets the current mouse cursor to the default when called without arguments.")
     ("love.mouse.setGrabbed" . "Grabs the mouse and confines it to the window.")
     ("love.mouse.setPosition" . "Sets the position of the mouse.")
     ("love.mouse.setVisible" . "Sets the visibility of the cursor.")
     ("love.mouse.setX" . "Sets the current X position of the mouse.")
     ("love.mouse.setY" . "Sets the current Y position of the mouse.")
     ("love.physics.getDistance" . "Returns the two closest points between two fixtures and their distance.")
     ("love.physics.getMeter" . "Get the scale of the world.

The world scale is the number of pixels per meter. Try to keep your shape sizes less than 10 times this scale.

This is important because the physics in Box2D is tuned to work well for objects of size 0.1m up to 10m. All physics coordinates are divided by this number for the physics calculations.")
     ("love.physics.newBody" . "Creates a new body.

There are three types of bodies. Static bodies do not move, have a infinite mass, and can be used for level boundaries. Dynamic bodies are the main actors in the simulation, they collide with everything. Kinematic bodies do not react to forces and only collide with dynamic bodies.

The mass of the body gets calculated when a Fixture is attached or removed, but can be changed at any time with Body:setMass or Body:resetMassData.")
     ("love.physics.newChainShape" . "Creates a chain shape.")
     ("love.physics.newCircleShape" . "Create a new CircleShape at (x,y) in local coordinates.

Anchors from the center of the shape by default.")
     ("love.physics.newDistanceJoint" . "Create a distance joint between two bodies.

This joint constrains the distance between two points on two bodies to be constant. These two points are specified in world coordinates and the two bodies are assumed to be in place when this joint is created. The first anchor point is connected to the first body and the second to the second body, and the points define the length of the distance joint.")
     ("love.physics.newEdgeShape" . "Creates a edge shape.")
     ("love.physics.newFixture" . "Creates and attaches a Fixture to a body.")
     ("love.physics.newFrictionJoint" . "Create a friction joint between two bodies. A FrictionJoint applies friction to a body.")
     ("love.physics.newGearJoint" . "Create a gear joint connecting two joints.

The gear joint connects two joints that must be either prismatic or revolute joints. Using this joint requires that the joints it uses connect their respective bodies to the ground and have the ground as the first body. When destroying the bodies and joints you must make sure you destroy the gear joint before the other joints.

The gear joint has a ratio the determines how the angular or distance values of the connected joints relate to each other. The formula coordinate1 + ratio * coordinate2 always has a constant value that is set when the gear joint is created.")
     ("love.physics.newMouseJoint" . "Create a joint between a body and the mouse.

This joint actually connects the body to a fixed point in the world. To make it follow the mouse, the fixed point must be updated every timestep (example below).

The advantage of using a MouseJoint instead of just changing a body position directly is that collisions and reactions to other joints are handled by the physics engine.")
     ("love.physics.newPolygonShape" . "Creates a new PolygonShape.
This shape can have 8 vertices at most, and must form a convex shape.")
     ("love.physics.newPrismaticJoint" . "Create a prismatic joints between two bodies.

A prismatic joint constrains two bodies to move relatively to each other on a specified axis. It does not allow for relative rotation. Its definition and operation are similar to a revolute joint, but with translation and force substituted for angle and torque.")
     ("love.physics.newPulleyJoint" . "Create a pulley joint to join two bodies to each other and the ground.

The pulley joint simulates a pulley with an optional block and tackle. If the ratio parameter has a value different from one, then the simulated rope extends faster on one side than the other. In a pulley joint the total length of the simulated rope is the constant length1 + ratio * length2, which is set when the pulley joint is created.

Pulley joints can behave unpredictably if one side is fully extended. It is recommended that the method setMaxLengths  be used to constrain the maximum lengths each side can attain.")
     ("love.physics.newRectangleShape" . "Shorthand for creating rectangluar PolygonShapes.

The rectangle will be created at (x,y) in local coordinates.

Anchors from the center of the shape by default.")
     ("love.physics.newRevoluteJoint" . "Creates a pivot joint between two bodies.

This joint connects two bodies to a point around which they can pivot.")
     ("love.physics.newRopeJoint" . "Create a joint between two bodies. Its only function is enforcing a max distance between these bodies.")
     ("love.physics.newWeldJoint" . "Create a friction joint between two bodies. A WeldJoint essentially glues two bodies together.")
     ("love.physics.newWheelJoint" . "Creates a wheel joint.")
     ("love.physics.newWorld" . "Creates a new World.")
     ("love.physics.setMeter" . "Sets the pixels to meter scale factor.

All coordinates in the physics module are divided by this number and converted to meters, and it creates a convenient way to draw the objects directly to the screen without the need for graphics transformations.

It is recommended to create shapes no larger than 10 times the scale. This is important because Box2D is tuned to work well with shape sizes from 0.1 to 10 meters.

love.physics.setMeter does not apply retroactively to created objects. Created objects retain their meter coordinates but the scale factor will affect their pixel coordinates.")
     ("love.sound.newSoundData" . "Creates new SoundData from a file. It's also possible to create SoundData with a custom sample rate, channel and bit depth.

The sound data will be decoded to the memory in a raw format. It is recommended to create only short sounds like effects, as a 3 minute song uses 30 MB of memory this way.")
     ("love.system.getClipboardText" . "Gets text from the clipboard.")
     ("love.system.getOS" . "Gets the current operating system. In general, LÖVE abstracts away the need to know the current operating system, but there are a few cases where it can be useful (especially in combination with os.execute.)")
     ("love.system.getPowerInfo" . "Gets information about the system's power supply.")
     ("love.system.getProcessorCount" . "Gets the number of CPU cores in the system.

The number includes the threads reported if technologies such as Intel's Hyper-threading are enabled. For example, on a 4-core CPU with Hyper-threading, this function will return 8.")
     ("love.system.openURL" . "Opens a URL with the user's web or file browser.")
     ("love.system.setClipboardText" . "Puts text in the clipboard.")
     ("love.thread.getChannel" . "Creates or retrieves a named thread channel.")
     ("love.thread.newChannel" . "Create a new unnamed thread channel.

One use for them is to pass new unnamed channels to other threads via Channel:push")
     ("love.thread.newThread" . "Creates a new Thread from a File or Data object.")
     ("love.timer.getAverageDelta" . "Returns the average delta time (seconds per frame) over the last second.")
     ("love.timer.getDelta" . "Returns the time between the last two frames.")
     ("love.timer.getFPS" . "Returns the current frames per second.")
     ("love.timer.getTime" . "Returns the value of a timer with an unspecified starting time. This function should only be used to calculate differences between points in time, as the starting time of the timer is unknown.")
     ("love.timer.sleep" . "Sleeps the program for the specified amount of time.")
     ("love.timer.step" . "Measures the time between two frames. Calling this changes the return value of love.timer.getDelta.")
     ("love.window.getDimensions" . "Gets the width and height of the window.")
     ("love.window.getFullscreen" . "Gets whether the window is fullscreen.")
     ("love.window.getFullscreenModes" . "Gets a list of supported fullscreen modes.")
     ("love.window.getHeight" . "Gets the height of the window.")
     ("love.window.getIcon" . "Gets the window icon.")
     ("love.window.getMode" . "Returns the current display mode.")
     ("love.window.getPixelScale" . "Gets the scale factor associated with the window. In Mac OS X with the window in a retina screen and the highdpi window flag enabled this will be 2.0, otherwise it will be 1.0.

The scale factor is used to display graphics at a size the user is expecting, rather than the size of the pixels. On retina displays with the highdpi window flag enabled, the pixels in the window are 2x smaller than the scale of the normal content on the screen, so love.window.getPixelScale will return 2.

The units of love.graphics.getWidth, love.graphics.getHeight, love.mouse.getPosition, and mouse events are always in terms of pixels.")
     ("love.window.getWidth" . "Gets the width of the window.")
     ("love.window.hasFocus" . "Checks if the game window has keyboard focus.")
     ("love.window.hasMouseFocus" . "Checks if the game window has mouse focus.")
     ("love.window.isCreated" . "Checks if the window has been created.")
     ("love.window.isVisible" . "Checks if the game window is visible.

The window is considered visible if it's not minimized and the program isn't hidden.")
     ("love.window.setFullscreen" . "Enters or exits fullscreen. The display to use when entering fullscreen is chosen based on which display the window is currently in, if multiple monitors are connected.

If fullscreen mode is entered and the window size doesn't match one of the monitor's display modes (in normal fullscreen mode) or the window size doesn't match the desktop size (in 'desktop' fullscreen mode), the window will be resized appropriately. The window will revert back to its original size again when fullscreen mode is exited using this function.")
     ("love.window.setIcon" . "Sets the window icon until the game is quit. Not all operating systems support very large icon images.")
     ("love.window.setMode" . "Changes the display mode.

If width or height is 0, the width or height of the desktop will be used.")
     ("love.window.setTitle" . "Sets the window title."))
  "A list containg the full names of the builtin functions that come with the LÖVE framework.")


(defun auto-complete-love--get-love-builtin-functions ()
  "Return a list containing the list of built-in functions in LÖVE."
  (mapcar #'car auto-complete-love--builtin-functions))

(defun auto-complete-love--get-documentation (love-symbol)
  (let ((symbol (substring-no-properties love-symbol)))
    (cdr (assoc symbol auto-complete-love--builtin-functions))))

(defvar ac-source-love
  '((candidates . auto-complete-love--get-love-builtin-functions)
     (document . auto-complete-love--get-documentation)
     (cache))
  "A auto-complete.el source for the builtin LÖVE functions.")


(provide 'auto-complete-love)
;;; auto-complete-love.el ends here
