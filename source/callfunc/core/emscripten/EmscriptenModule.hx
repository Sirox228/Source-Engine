package callfunc.core.emscripten;

import haxe.DynamicAccess;
import haxe.io.Float64Array;
#if js
import js.lib.Float32Array;
import js.lib.Int16Array;
import js.lib.Int32Array;
import js.lib.Int8Array;
import js.lib.Uint16Array;
import js.lib.Uint32Array;
import js.lib.Uint8Array;
#else
import haxe.io.Float32Array;
import haxe.io.Int32Array;
import haxe.io.UInt16Array;
import haxe.io.UInt32Array;
import haxe.io.UInt8Array;
#end

extern class EmscriptenModule {
    #if js
    public var HEAP8:Int8Array;
    public var HEAP16:Int16Array;
    #else
    public var HEAP8:Array<Int>;
    public var HEAP16:Array<Int>;
    #end
    public var HEAP32:Int32Array;
    #if js
    public var HEAPU8:Uint8Array;
    public var HEAPU16:Uint16Array;
    public var HEAPU32:Uint32Array;
    #else
    public var HEAPU8:UInt8Array;
    public var HEAPU16:UInt16Array;
    public var HEAPU32:UInt32Array;
    #end
    public var HEAPF32:Float32Array;
    public var HEAPF64:Float64Array;

    public function ccall(ident:String, ?returnType:Null<String>,
        ?argTypes:Array<String>, ?args:Array<Any>, ?opts:Any):Any;

    public function cwrap(ident:String, ?returnType:Null<String>,
        ?argTypes:Array<String>, ?opts:Any):haxe.Constraints.Function;

    public function setValue(ptr:Float, value:Any, type:String):Void;

    public function getValue(ptr:Float, type:String):Any;

    public function addFunction(func:haxe.Constraints.Function,
        signature:String):Int;
}
