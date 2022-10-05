package;

import flixel.FlxState;
import flixel.FlxG;

class InitState extends FlxState
{
	override public function create() {
		super.create();
		
		#if cpp
		cpp.NativeGc.enable(true);
		cpp.NativeGc.run(true);
		#end
		
		FlxG.switchState(new GameState());
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
