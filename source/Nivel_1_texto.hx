package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;

/**
 * ...
 * @author Theo leyenda
 */
class Nivel_1_texto extends FlxSubState
{
	private var Timer:Float;
	private var Nivel1:FlxText;
	override public function create():Void 
	{
		super.create();
		Nivel1 = new FlxText(FlxG.width / 2 - 65, FlxG.height / 2-50, 0, "NIVEL 1", 32);
		add(Nivel1);
		Timer = 0;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		Timer = Timer + elapsed;
		if (Timer >= 2)
		{
			FlxG.switchState( new PlayState());
		}

	}
}