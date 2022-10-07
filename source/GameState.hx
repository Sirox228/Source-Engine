package;

import flixel.FlxState;
import flixel.FlxBasic;

class GameState extends FlxState {
	public var script:HornyScript;
	
	public function new() {
		super();
		script = new HornyScript("game/main.hx");
		script.setVariable("state", this);
		script.setVariable("add", function(obj:FlxBasic) {add(obj);});
        script.setVariable("remove", function(obj:FlxBasic) {remove(obj);});
        script.setVariable("insert", function(i:Int, obj:FlxBasic) {insert(i, obj);});
        script.run();
        script.executeFunc("new");
	}
	
	public override function onFocus() {
        script.executeFunc("onFocus");
        super.onFocus();
    }

    public override function onFocusLost() {
        script.executeFunc("onFocusLost");
        super.onFocusLost();
    }

    public override function onResize(width:Int, height:Int) {
        script.executeFunc("onResize", [width, height]);
        super.onResize(width, height);
    }

    public override function draw() {
        script.executeFunc("draw");
        super.draw();
        script.executeFunc("drawPost");
    }

    public override function create() {
        super.create();
        script.executeFunc("create");
    }
	
	override public function update(elapsed:Float) {
		script.executeFunc("update", [elapsed]);
		super.update(elapsed);
		script.executeFunc("updatePost", [elapsed]);
	}
	
	public override function destroy() {
        script.executeFunc("destroy");
        super.destroy();
    }
}
