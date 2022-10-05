package;

import flixel.FlxSprite;

class GameState extends FlxState {
	public var battle:HornyScript;
	public var system:HornyScript;
	
	override public function create() {
		super.create();
		battle = new HornyScript("game/battle.hx");
		battle.setVariable("this", this);
		battle.executeFunc("create", []);
		system = new HornyScript("game/system.hx");
		system.setVariable("this", this);
		system.executeFunc("create", []);
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		battle.executeFunc("update", [elapsed]);
		system.executeFunc("update", [elapsed]);
	}
}