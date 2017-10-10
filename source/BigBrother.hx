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
	var guia:FlxSprite;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		var fondo:FlxBackdrop = new FlxBackdrop(AssetPaths.PruevaScrolling__png);
		
		guia = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		guia.makeGraphic(1, 1, 0x00000000);
		guia.velocity.x = Global.camVelocityX;
		
		FlxG.camera.follow(guia);
		
		FlxG.state.add(guia);
		FlxG.state.add(fondo);
		
	}
	
	public function setCamaraX(x:Float)
	{
		guia.x -= x;
	}
}