package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;


/**
 * ...
 * @author ...
 */
class SclollingState extends FlxState 
{
	override public function create():Void 
	{
		super.create();
		
		//	FONDO QUE SCROLLEA
		var background:FlxBackdrop = new FlxBackdrop(AssetPaths.PruevaScrolling__png);
		
		var p:Wachin = new Wachin(24,24, AssetPaths.wachin__png);
		p.x = 200;
		p.y = 200;
		var guia:FlxSprite = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		guia.makeGraphic(1, 1, 0x00000000);
		guia.velocity.x = Global.camVelocityX;
		
		p.velocity.x = guia.velocity.x;
		
		FlxG.camera.follow(guia);
		
		add(background);
		add(guia);
		add(p);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
}