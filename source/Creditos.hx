package;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
/**
 * ...
 * @author Theo leyenda
 */
class Creditos extends FlxSubState 
{
	private var creditos:FlxText;
	private var byTheoLeyenda:FlxText;
	private var Z:FlxText;
	override public function create():Void 
	{
		super.create();
		creditos = new FlxText(FlxG.width / 2 - 128, 0, 0, "CREDITOS", 48);
		creditos.color = FlxColor.YELLOW;
		byTheoLeyenda = new FlxText(FlxG.width / 2 - 150, FlxG.height / 2, 0, "By: Theo Leyenda", 32);
		Z = new FlxText(FlxG.width - 64, FlxG.height - 48, 0, "Z", 32);
		add(creditos);
		add(byTheoLeyenda);
		add(Z);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.Z)
		{
			FlxG.switchState( new Menu());
		}
	}
	
}