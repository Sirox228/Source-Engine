package;

import flixel.FlxSprite;

class GameObject extends FlxSprite {
	public var offsets:Map<String, Array<Float>> = [];
	public var script:HornyScript;
	
	public function new(x:Float = 0, y:Float = 0, objName:String) {
		super(x, y);
		script = new HornyScript("game/objects/" + objName + "/script.hx");
		script.setVariable("this", this);
		script.executeFunc("create", [elapsed]);
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
	
	override public function update(elapsed:Float) {
		script.executeFunc("update", [elapsed]);
		super.update(elapsed);
	}
}