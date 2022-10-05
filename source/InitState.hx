package;

import flixel.FlxState;
import flixel.FlxG;
#if android
import android.os.Build;
#end

class InitState extends FlxState
{
	override public function create() {
		super.create();
		
		#if cpp
		cpp.NativeGc.enable(true);
		cpp.NativeGc.run(true);
		#end

                #if android
                if (VERSION.SDK_INT >= VERSION_CODES.M) Permissions.requestPermissions([Permissions.WRITE_EXTERNAL_STORAGE, Permissions.READ_EXTERNAL_STORAGE]);
                #end
		
		FlxG.switchState(new GameState());
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
