package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxObject;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.FlxState;


/**
 * ...
 * @author ...
 */
class SclollingState extends FlxState 
{
	private var tilemap:FlxTilemap;
	private var persona:Wachin;
	
	override public function create():Void 
	{
		super.create();
		
		//	FONDO QUE SCROLLEA
		var background:FlxBackdrop = new FlxBackdrop(AssetPaths.PruevaScrolling__png);
		var guia:FlxSprite = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.LEVEL__oel);
		tilemap = loader.loadTilemap(AssetPaths.Tiles__png, 16, 16, "Tiles");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		
		guia.makeGraphic(1, 1, 0x00000000);
		guia.velocity.x = Global.camVelocityX;
		FlxG.camera.follow(guia);
		
		persona = new Wachin(24,24, AssetPaths.wachin__png);
		persona.x = 200;
		persona.y = 200;
		persona.velocity.x = guia.velocity.x;
		
		add(background);
		add(tilemap);
		add(guia);
		add(persona);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		FlxG.collide(tilemap,persona);
	}
}