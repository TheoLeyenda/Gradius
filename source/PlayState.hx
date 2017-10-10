package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
class PlayState extends FlxState
{
	private var wachin:Wachin;
	private var tilemap:FlxTilemap;
	private var camarita:BigBrother;
	private var textVidas:FlxText;
	private var tibu:Tiburonsin1;
	override public function create():Void
	{
		super.create();
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.lvlproto__oel);
		tilemap = loader.loadTilemap(AssetPaths.fideo__png, 16, 16, "tiles");
		wachin = new Wachin(FlxG.width / 2 - 15, FlxG.height / 2, AssetPaths.wachin__png);
		camarita = new BigBrother(0, 0);
		Global.vidas = 3;
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.ANY);
		tilemap.setTileProperties(6, FlxObject.ANY);
		tilemap.setTileProperties(7, FlxObject.ANY);
		tilemap.setTileProperties(8, FlxObject.ANY);
		textVidas = new FlxText(0, 0, 0, "", 16);
		textVidas.pixelPerfectPosition = false;
		tibu = new Tiburonsin1(249, 80);
		
		add(camarita);
		add(tilemap);
		add(wachin);
		add(textVidas);
		add(tibu);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height); // expandir la colision a todo el tilemap
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(wachin, tilemap, collideWachinTilemap);
		textVidas.setPosition(FlxG.camera.scroll.x , FlxG.height - 20);
		textVidas.text = "VIDAS " + Global.vidas;
		
		if (wachin.alive == false)
		{
			camarita.setCamaraX(200);
			wachin.reset(1, FlxG.height / 2);
		}
		
		if (Global.vidas == 0)
		{
			FlxG.switchState(new PlayState());
		}
	}
	
	private function collideWachinTilemap(w:Wachin,t:FlxTilemap):Void
	{
		Global.vidas -= 1;
		wachin.kill();	
	}
}