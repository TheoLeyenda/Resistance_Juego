package;

import flixel.FlxState;
import flixel.FlxG;
/**
 * ...
 * @author Theo leyenda
 */
class EstadoBase extends FlxState 
{
	override public function create():Void
	{
		super.create();
		//FlxG.sound.play(AssetPaths.Metallica_FadeToBlackMusic_Video__wav);
		openSubState(new Menu());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}