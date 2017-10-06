



//ESTE ESTADO NO SE ESTA USANDO PORQUE EL MAIN LLAMA A : SclollingState


package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.FlxState;
//ESTE ESTADO NO SE ESTA USANDO PORQUE EL MAIN LLAMA A : SclollingState
class PlayState extends FlxState
{
	private var wachin:Wachin;
	private var tilemap:FlxTilemap;
	private var Camarita:BigBrother;
	//ESTE ESTADO NO SE ESTA USANDO PORQUE EL MAIN LLAMA A : SclollingState
	override public function create():Void
	{
		//ESTE ESTADO NO SE ESTA USANDO PORQUE EL MAIN LLAMA A : SclollingState
		super.create();
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.lvlproto__oel);
		tilemap = loader.loadTilemap(AssetPaths.fideo__png, 16, 16, "tiles");
		wachin = new Wachin(FlxG.width / 2 - 15, FlxG.height / 2, AssetPaths.wachin__png);
		tilemap.setTileProperties(0, FlxObject.ANY);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.ANY);
		tilemap.setTileProperties(6, FlxObject.ANY);
		tilemap.setTileProperties(7, FlxObject.ANY);
		tilemap.setTileProperties(8, FlxObject.ANY);
		//add(Camarita);
		add(tilemap);
		add(wachin);
	}
//ESTE ESTADO NO SE ESTA USANDO PORQUE EL MAIN LLAMA A : SclollingState
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}