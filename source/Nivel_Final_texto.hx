package;

import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class Nivel_Final_texto extends FlxSubState 
{

	private var Timer:Float;
	private var NivelFinal:FlxText;
	override public function create():Void 
	{
		super.create();
		NivelFinal = new FlxText(FlxG.width / 2 - 120, FlxG.height / 2 - 50, 0, "ULTIMO NIVEL...", 32);
		NivelFinal.color = FlxColor.ORANGE;
		add(NivelFinal);
		Timer = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Timer = Timer + elapsed;
		if (Timer >= 2)
		{
			FlxG.switchState( new Nivel_10());
		}
	}
	
}