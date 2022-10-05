package;

import flixel.FlxGame;
import openfl.display.Sprite;
#if android
import android.Permissions;
import android.Hardware;
#end
import haxe.CallStack.StackItem;
import haxe.CallStack;
import lime.app.Application;
import sys.FileSystem;
import sys.io.File;
import openfl.events.UncaughtErrorEvent;
import openfl.system.System;
import flixel.FlxState;
import openfl.Lib;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		initCrashHandler();
		
		var initial:Class<FlxState> = InitState;
		#if android
		if (!Permissions.getGrantedPermissions().contains(Permissions.WRITE_EXTERNAL_STORAGE) || !Permissions.getGrantedPermissions().contains(Permissions.READ_EXTERNAL_STORAGE)) {
            initial = PermsState;
        }
		#end
		
		addChild(new FlxGame(0, 0, initial, 1, 60, 60, true));
	}
	
	/**
	 * crash handler (it works only with exceptions thrown by haxe, for example glsl death or fatal signals wouldn't be saved using this)
     * @author: sqirra-rng
     * @edit: Saw (M.A. Jigsaw)
	 */
	public static function initCrashHandler()
	{
		Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, function(u:UncaughtErrorEvent)
		{
			var callStack:Array<StackItem> = CallStack.exceptionStack(true);
			var errMsg:String = '';

			for (stackItem in callStack)
			{
				switch (stackItem)
				{
					case CFunction:
						errMsg += 'a C function\n';
					case Module(m):
						errMsg += 'module ' + m + '\n';
					case FilePos(s, file, line, column):
						errMsg += file + ' (line ' + line + ')\n';
					case Method(cname, meth):
						errMsg += cname == null ? "<unknown>" : cname + '.' + meth + '\n';
					case LocalFunction(n):
						errMsg += 'local function ' + n + '\n';
				}
			}

			errMsg += u.error;

			try
			{
				    var lmao:String = Paths.gamePath();
					if (!FileSystem.exists(lmao + 'logs')) {
						FileSystem.createDirectory(lmao + 'logs');
					}
				    File.saveContent(lmao
					+ 'logs/'
					+ Application.current.meta.get('file')
					+ '-'
					+ Date.now().toString().replace(' ', '-').replace(':', "'")
					+ '.log',
					errMsg
					+ '\n');
			}
			#if android
			catch (e:Dynamic)
			Hardware.toast("Error!\nClouldn't save the crash dump because:\n" + e, ToastType.LENGTH_LONG);
			#end

			Sys.println(errMsg);
			Application.current.window.alert(errMsg, 'Error!');

			System.exit(1);
		});
	}
}
