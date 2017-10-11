package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Chimi
 */
class Wachin extends FlxSprite 
{
	private var velocidad:Int;
	private var bulletTime :Float;
	private var bala:Bala;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		velocity.x = 0;
		velocity.y = 0;
		bulletTime = 0;
		pixelPerfectPosition = false;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movimiento();
		limite();
		shoot();
		bulletTime++;
		if (bulletTime == 25) 
		{
			bulletTime = 0;
		}
	}

	private function movimiento():Void
	{
		velocidad = 4;
		if(FlxG.keys.pressed.D){
			x = x + velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.A){
			x = x - velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.S){
			y = y + velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
		if(FlxG.keys.pressed.W){
			y = y - velocidad * FlxG.elapsed * FlxG.updateFramerate;
		}
	}
	private function limite():Void
	{
		if (x >= FlxG.camera.scroll.x + 241)
		{
			x = FlxG.camera.scroll.x + 241;
		}
		
		if (y >= FlxG.camera.scroll.y + 232)
		{
			velocity.y = 0;
			y = FlxG.camera.scroll.y + 232;
		}
		
		if (x <= FlxG.camera.scroll.x)
		{
			x = FlxG.camera.scroll.x;
		}
		
		if (y <= FlxG.camera.scroll.y)
		{
			velocity.y = FlxG.camera.y;
			y = FlxG.camera.scroll.y;
		}
		
	}
	
	private function shoot():Void
	{
		if (FlxG.keys.pressed.J && bulletTime == 0) 
		{
			bala = new Bala(x + width / 2, y + height / 2, AssetPaths.Bala__png);
			FlxG.state.add(bala);
		}
		
	}
}
