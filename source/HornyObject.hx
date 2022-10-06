package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxCamera;
import flixel.math.FlxRect;
import flixel.math.FlxPoint;

class HornyObject extends FlxSprite {
	public var offsets:Map<String, Array<Float>> = [];
	public var script:HornyScript;
	
	public function new(x:Float = 0, y:Float = 0, objName:String) {
		super(x, y);
		script = new HornyScript("game/objects/" + objName + "/script.hx");
		script.setVariable("object", this);
		script.executeFunc("new", [x, y]);
		script.executeFunc("create", [x, y]);
	}
	
	public function setOffset(animName:String, x:Float = 0, y:Float = 0) {
		offsets[animName] = [x, y];
	}
	
	public function updateOffset(animName:String, x:Float = 0, y:Float = 0) {
		if (animOffsets.exists(animation.curAnim.name)) {
		    offset.set(offsets.get(animation.curAnim.name)[0], offsets.get(animation.curAnim.name)[1]);
		} else {
			offset.set(0, 0);
		}
	}
	
	// thank you, yoshicrafter29
	public override function draw() {
        if (script.executeFunc("draw") != false) {
            super.draw();
        }
    }

    public override function getGraphicMidpoint(?point:FlxPoint):FlxPoint {
        var v:FlxPoint = script.executeFunc("getGraphicMidpoint", [point]);
        if (v != null) return v;
        return super.getGraphicMidpoint(point);
    }

    public override function getRotatedBounds(?newRect:FlxRect):FlxRect {
        var v:FlxRect = script.executeFunc("getRotatedBounds", [newRect]);
        if (v != null) return v;
        return super.getRotatedBounds(newRect);
    }

    public override function getScreenBounds(?newRect:FlxRect, ?camera:FlxCamera):FlxRect {
        var v:FlxRect = script.executeFunc("getScreenBounds", [newRect, camera]);
        if (v != null) return v;
        return super.getScreenBounds(newRect, camera);
    }

    public override function pixelsOverlapPoint(point:FlxPoint, Mask:Int = 0xFF, ?Camera:FlxCamera):Bool {
        var v:Null<Bool> = script.executeFunc("pixelsOverlapPoint", [point, Mask, Camera]);
        if (v != null) return v;
        return super.pixelsOverlapPoint(point, Mask, Camera);
    }

    public override function loadGraphic(graphic:FlxGraphicAsset, animated:Bool = false, width:Int = 0, height:Int = 0, unique:Bool = false, ?Key:String):FlxSprite {
        if (script.executeFunc("draw", [graphic, animated, width, height, unique, Key]) != false) {
            super.loadGraphic(graphic, animated, width, height, unique, Key);
        }
        return this;
    }

    public override function destroy() {
        script.executeFunc("destroy");
        super.destroy();
    }
	
	override public function update(elapsed:Float) {
		script.executeFunc("update", [elapsed]);
		super.update(elapsed);
		script.executeFunc("updatePost", [elapsed]);
	}
}