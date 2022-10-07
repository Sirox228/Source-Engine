package;

import hscript.Interp;
import hscript.Parser;
import openfl.Lib;
import flixel.FlxBasic;
using StringTools;

/*
* Based on Hscript api from fnf wednesdays infidelity by lunarcleint, crefots to him
*/
class HornyScript extends FlxBasic {
	
	public var hscript:Interp;
	public var parser:Parser;
        var code:String = '';

	public function new(path:String)
	{
                super();
		code = sys.io.File.getContent(#if android Paths.gamePath() + #end path);
		
		hscript = new Interp();
		
		parser = new Parser();
		parser.allowJSON = true;
		parser.allowTypes = true;
		parser.allowMetadata = true;
		
		setVariable('script', this);
		setVariable('import', function(daClass:String)
		{
			final splitClassName:Array<String> = [for (e in daClass.split('.')) e.trim()];
			final className:String = splitClassName.join('.');
			final daClass:Class<Dynamic> = Type.resolveClass(className);
			final daEnum:Enum<Dynamic> = Type.resolveEnum(className);

			if (daClass == null && daEnum == null)
				Lib.application.window.alert('Class / Enum at $className does not exist.', 'Hscript Error!');
			else
			{
				if (daEnum != null)
				{
					for (daConstructor in daEnum.getConstructors())
						Reflect.setField({}, daConstructor, daEnum.createByName(daConstructor));
					setVariable(splitClassName[splitClassName.length - 1], {});
				}
				else
					setVariable(splitClassName[splitClassName.length - 1], daClass);
			}
		});
		setVariable('Reflect', Reflect);
		setVariable('Sys', Sys);
		setVariable('Array', Array);
		setVariable('Type', Type);
		setVariable('Std', Std);
		setVariable('globals', Globals.globals);
		setVariable('FlxColor', FlxColor_hscript);
		setVariable('HClass', HornyClass);
		setVariable('HState', HornyState);
		setVariable('HSubState', HornySubState);
		setVariable('HObject', HornyObject);
		setVariable('HScript', HornyScript);
                setVariable('WrenConfiguration', {
                    "initialHeapSize":Int,
                    "minHeapSize":Int,
                    "heapGrowthPercent":Int
                });
		
	}

        public function run()
        {
                try
		{
			var ast:Any = parser.parseString(code);

			hscript.execute(ast);
		}
		catch (e)
		{
			Lib.application.window.alert(e.message, "HSCRIPT ERROR!1111");
		}
        }

	public function setVariable(name:String, val:Dynamic)
	{
		hscript.variables.set(name, val);
	}

	public function getVariable(name:String):Dynamic
	{
		return hscript.variables.get(name);
	}

	public function executeFunc(funcName:String, ?args:Array<Any>):Dynamic
	{
		if (hscript == null)
			return null;

		if (hscript.variables.exists(funcName))
		{
			var func = hscript.variables.get(funcName);
			if (args == null)
			{
				var result = null;
				try
				{
					result = func();
				}
				catch (e)
				{
					trace('$e');
				}
				return result;
			}
			else
			{
				var result = null;
				try
				{
					result = Reflect.callMethod(null, func, args);
				}
				catch (e)
				{
					trace('$e');
				}
				return result;
			}
		}
		return null;
	}

	override public function destroy()
	{
		hscript = null;
		parser = null;
		super.destroy();
	}
}
