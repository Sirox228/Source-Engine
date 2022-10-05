package macros;

import haxe.macro.Compiler;
import haxe.macro.Expr;

class Includes
{
	public static macro function run():Expr
	{
		#if !display
		Compiler.include('flixel');
		#if !web
		Compiler.include('sys');
		#end
		Compiler.include('haxe.crypto');
		Compiler.include('spinehaxe');
		#if android
		Compiler.include('android');
		#end
		Compiler.include('haxe.crypto');
		Compiler.include('DateTools');
		Compiler.include('Reflect');
		Compiler.include('EReg');
		Compiler.include('Lambda');
		Compiler.include('StringBuf');
		Compiler.include('StringTools');
		#end
                var shit = "shit3lol";
                var iloveshit = "iloveshit9393+&$##(/";
                var eeeeeee = shit ^ iloveshit;
                trace(eeeeeee);
                var aa = eeeeeee ^ iloveshit;
                trace(aa);
		return macro $v{null};
	}
}
