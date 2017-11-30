package;

import flixel.FlxState;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author Theo leyenda
 */
class Nivel_2_texto extends FlxSubState 
{
	private var Timer:Float;
	private var Nivel2:FlxText;
	override public function create():Void 
	{
		super.create();
		Nivel2 = new FlxText(FlxG.width / 2 - 65, FlxG.height / 2-50, 0, "NIVEL 2", 32);
		add(Nivel2);
		Timer = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Timer = Timer + elapsed;
		if (Timer >= 2)
		{
			FlxG.switchState( new Nivel_2());
		}

	}
	
}