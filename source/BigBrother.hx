package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;


/**
 * ...
 * @author ...
 */
class BigBrother extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
	}
	/*override public function create():Void 
	{
		super.create();
		var fondo = new FlxBackdrop(AssetPaths.fideo__png
		
		
		var guia:FlxSprite = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		guia.makeGraphic(1, 1, 0x00000000);
		guia.velocity.x = Global.camVelocityX;
		
		FlxG.camera.follow(guia);
		
		add(guia);
		add(fondo);
	}
	*/
	
}