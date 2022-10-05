#if android
package;

import flixel.util.FlxColor;
import flixel.addons.ui.FlxUIButton;
import flixel.text.FlxText;
import android.Permissions;
import flixel.FlxState;
import flixel.FlxG;

class PermsState extends FlxState {
	var permsbutton:FlxUIButton;
	var continuebutton:FlxUIButton;
	var text:FlxText;
	override public function create():Void
	{
		text = new FlxText(0,0, FlxG.width, "PERMISSIONS" + "\n" + "this game needs storage permissions to work" + "\n" + "press 'Ask Permissions' to ask them" + "\n" + "press 'continue' to run the game", 32);
		text.setFormat("VCR OSD Mono", 32);
		text.screenCenter(XY);
		text.y -= FlxG.height / 4;
		text.alignment = CENTER;
		add(text);
		permsbutton = new FlxUIButton(0,0,"Ask Permissions", () -> {
                    Permissions.requestPermissions([Permissions.WRITE_EXTERNAL_STORAGE, Permissions.READ_EXTERNAL_STORAGE]);
                });
                permsbutton.screenCenter(XY);
                permsbutton.x -= 400;
                permsbutton.y += 100;
                permsbutton.resize(250,50);
		permsbutton.setLabelFormat("VCR OSD Mono",24,FlxColor.BLACK,"center");
		add(permsbutton);
                continuebutton = new FlxUIButton(0,0,"continue", () -> {
        	    FlxG.switchState(Type.createInstance(Main.initialState, []));
                });
                continuebutton.screenCenter(XY);
                continuebutton.x += 300;
                continuebutton.y += 100;
		continuebutton.resize(250,50);
		continuebutton.setLabelFormat("VCR OSD Mono",24,FlxColor.BLACK,"center");
		add(continuebutton);
		super.create();
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
#end