## Source Engine
![wut](https://raw.githubusercontent.com/Sirox228/Source-Engine/master/icon.png)
---
A game engine, written on haxe that uses hscript as the base, the engine is called 'source' because whole game code is written in hscript file that is not part of the source code, so this engine allows you to code any game want without compiling source code.
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
```script``` - current instance of the HScript class that runs this file

all of those are already in hscript and no need to import

1.
```haxe 
import('package.class'); // you need to write package and class/enum name of the class/enum you want to import, typedef is unsupported.
```

2. HClass class

available functions and variable for script you're connecting to that HClass:

```haxe
var class:HClass = new HClass("path/to/hscript/file.hx", [arguements, for, functions]);
```

1. ```class``` - current instance of the HClass object that launched this hscript file

2. 
```haxe
function new(specify here all arguments, you wrote after path in new HClass) {}
```
- function that is runned when creating HClass object

3. 
```haxe
function create(specify here all arguments, you wrote after path in new HClass) {}
```
- function that is runned instantly after call of the ```new``` function is completed

3. HObject class 
***!important!*** this class is an extend of flixel.FlxSprite, so it's a child class of FlxSprite,
that means, that you can do same things as with FlxSprite with HObject.
(for example, set the frames for the sprite: ```object.frames = FlxAtlasFrames....```)

available functions and variable for script you're connecting to that HObject:

```haxe
var object:HObject = new HObject(x, y, "path/to/hscript/file.hx");
```

1. ```object``` - current instance of the HObject object that launched this hscript file

2. 
```haxe
function new(x, y) {}
```
- function that is runned when creating HClass object

3.
```haxe
function create(x, y) {}
```
- function that is runned instantly after call of the ```new``` function is completed

4.
```haxe
function update(elapsed) {}
```
- function that is runned each frame

5.
```haxe
function updatePost(elapsed) {}
```
- same as ```update``` function, but this one runs after ```update``` and ```super``` call in the source code

6.
```haxe
setOffset(animName, x, y)
```
- function that sets the offset for animation of the object into an array

7.
```haxe
updateOffset()
```
- function that applying offsets that are set for current animation, if no offsets set to animation, offset is set to x - 0, y - 0

8.
```haxe
function destroy() {}
```
- function that is runned when object is going to be destroyed

other functions that don't need explanation:

```haxe
function draw() {}
```
- should ```return true;``` to call ```super``` and ```return false;``` to not call ```super```

```haxe
function getGraphicMidpoint(?point:FlxPoint) {}
```

```haxe
function getRotatedBounds(?newRect:FlxRect) {}
```

```haxe
function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera) {}
```

```haxe
function pixelsOverlapPoint(point:FlxPoint, Mask:Int = 0xFF, ?Camera:FlxCamera) {}
```

```haxe
function loadGraphic(graphic:FlxGraphicAsset, animated:Bool = false, width:Int = 0, height:Int = 0, unique:Bool = false, ?Key:String) {}
``` 
- should ```return true;``` to call ```super``` and ```return false;``` to not call ```super```

```haxe
function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera) {}
```

4. HScript class

available functions and variable for script you're connecting to that HClass:

```haxe
var script:HScript = new HScript("path/to/hscript/file.hx");
```

1. 
```haxe
function run() {}
```
- function that runs and parses the script, you can't set variables to script after calling this

2. 
```haxe
function setVariable(name:String, val:Dynamic) {}
```
- function that sets ```val``` class/variable as ```name``` to script

3. 
```haxe
function getVariable(name:String) {}
```
- function that returns a variable from script, specified by ```name```

4. 
```haxe
function executeFunc(funcName:String, ?args:Array<Any>) {}
```
- function that executes a function from script slecified by ```funcName``` with ```args``` arguments

5. HState class
***!important!*** this class is an extend of flixel.FlxState, so it's a child class of FlxState,
that means, that you can do same things as with FlxState with HState.

available functions and variable for script you're connecting to that HClass:

```haxe
var state:HState = new HState("path/to/hscript/file.hx", [arguements, for, functions]);
```

1. ```state``` - current instance of the HState object that launched this hscript file

2. 
```haxe
function insert(i:Int, obj:FlxBasic) {}
```
- function that adds an object ```obj``` to layer ```i```

3.
```haxe
function destroy() {}
```
- function that is runned when object is going to be destroyed

4. 
```haxe
function new(specify here all arguments, you wrote after path in new HState) {}
```
- function that is runned when creating HState object

5.
```haxe
function create() {}
```
- function that is runned instantly after call of the ```new``` function is completed

6.
```haxe
function update(elapsed) {}
```
- function that is runned each frame

7.
```haxe
function updatePost(elapsed) {}
```
- same as ```update``` function, but this one runs after ```update``` and ```super``` call in the source code

other functions that don't need explanation:

```haxe
function add(obj:FlxBasic) {}
```

```haxe
function remove(obj:FlxBasic) {}
```

```haxe
function onFocus() {}
```

```haxe
function onFocusLost() {}
```

```haxe
function onResize(width:Int, height:Int) {}
```

```haxe
function draw() {}
```

5. HSubState class
literally same as HState, but this one is child class of flixel.FlxSubState

1. ```substate``` - current instance of the HSubState object that launched this hscript file

2.
```haxe
function close() {}
```
- function that is runned when substate is closing

