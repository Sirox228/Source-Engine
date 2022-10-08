## Source Engine
![wut](https://raw.githubusercontent.com/Sirox228/Source-Engine/master/icon.png)
---
A game engine, written on haxe that uses hscript as the base, the engine is called 'source' because whole game source code is written in hscript file that is not part of the source code, so this engine allows you to code any game want without compiling source code.
---
## Installation
# Android
1.Open the engine and accept the permission request, there would be an error, because you didn't create game files for now.

2.Go to your phone's storage, enable 'show hidden folders', there would be a folder called ```.Source-Engine```, inside that folder create a file called ```current.txt``` and write in it your game's name, then, create a folder, with the same name, as you wrote in ```current.txt```, inside that folder, create file called ```main.hx```

3.Open the engine, no errors would appear now, congratulations, you installed the engine

# Windows

1.Inside folder with .exe file of the game, create ```current.txt``` file and write in it your game's name, then, create a folder, with the same name, as you wrote in ```current.txt```, inside that folder, create file called ```main.hx```

2.Open the engine, congratulations, you installed the engine

---
## Usage of the Engine
# Available Packages
1. hxvm-luajit and linc_luajit, you are able to make lua scripts from hscript file
2. hxCodec, you are able to play videos in mp4 format
3. spinehaxe (spine port to haxe), you are able to make spine sprites
3. hscript, yoy can call another hscript (.hx) scripts from main.hx
4. extension-androidtools, you are able to use some jni functions (available only in android version for obvious reasons)
5. flixel, flixel-addons and flixel-ui, you can use flixel in it as you want

# Engine's hscript basic functions
all of those are already in hscript and no need to import
1. ```haxe
import('package.class'); // you need to write package and class/enum name of the class/enum you want to import, typedef is unsupported.
```
2. HClass class
```haxe
var class:HClass = new HClass("path/to/hscript/file.hx", [arguements, for, functions]);
```
available functions and variable for script you're connecting to that HClass:
1. ```class``` - current instance of the HClass object that launched this hscript file
2. ```function new(specify here all arguments, you wrote after path in new HClass) {}``` - function that is runned when creating HClass object
3. ```function create(specify here all arguments, you wrote after path in new HClass) {}``` - function that is runned instantly after call of the ```new``` function is completed

3. HObject class !important! this class is an extend of flixel.FlxSprite, so it's a child class of FlxSprite, that means, that you can do same things as with FlxSprite with HObject. (for example, set the frames for the sprite: ```object.frames = FlxAtlasFrames....```)
```haxe
var object:HObject = new HObject(x, y, "path/to/hscript/file.hx");
```
available functions and variable for script you're connecting to that HObject:
1. ```object``` - current instance of the HObject object that launched this hscript file
2. ```function new(x, y) {}``` - function that is runned when creating HClass object
3. ```function create(x, y) {}``` - function that is runned instantly after call of the ```new``` function is completed
4. ```function update(elapsed) {}``` - function that is runned each frame
5. ```function updatePost(elapsed) {}``` - same as ```update``` function, but this one runs after ```update``` and ```super``` call in the source code
6. ```setOffset(animName, x, y)``` - function that sets the offset for animation of the object into an array
7. ```updateOffset()``` - function that applying offsets that are set for current animation, if no offsets set to animation, offset is set to x - 0, y - 0
4. ```function destroy() {}``` - function that is runned when object is going to be destroyed
other functions that don't need explanation
```function draw() {}``` - should ```return true;``` to call ```super``` and ```return false;``` to not call ```super```
```function getGraphicMidpoint(?point:FlxPoint) {}```
```function getRotatedBounds(?newRect:FlxRect) {}```
```function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera) {}```
```function pixelsOverlapPoint(point:FlxPoint, Mask:Int = 0xFF, ?Camera:FlxCamera) {}```
```function loadGraphic(graphic:FlxGraphicAsset, animated:Bool = false, width:Int = 0, height:Int = 0, unique:Bool = false, ?Key:String) {}```  - should ```return true;``` to call ```super``` and ```return false;``` to not call ```super```
```function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera) {}```

