package;

import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;
/**
 * ...
 * @author Theo leyenda
 */
class Nivel_3_texto extends FlxSubState 
{
	private var Timer:Float;
	private var Nivel3:FlxText;
	override public function create():Void 
	{
		super.create();
		Nivel3 = new FlxText(FlxG.width / 2 - 65, FlxG.height / 2-50, 0, "NIVEL 3", 32);
		add(Nivel3);
		Timer = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Timer = Timer + elapsed;
		if (Timer >= 2)
		{
			FlxG.switchState( new Nivel_3());
		}

	}
	
	
}