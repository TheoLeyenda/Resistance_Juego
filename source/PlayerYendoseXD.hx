package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
/**
 * ...
 * @author Theo leyenda
 */
class PlayerYendoseXD extends FlxSprite 
{
	private var irse:FlxTween;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		irse = FlxTween.tween(this, {x:FlxG.width, y:this.y}, 5, {type: FlxTween.ONESHOT, onComplete: olaTeo}); 
		loadGraphic(AssetPaths.jugadorYendose__png);
	}

	private function olaTeo(tween:FlxTween)
	{
		Reg.nivelActual++;
		switch(Reg.nivelActual)
		{
			case 1:
				FlxG.switchState( new Nivel_1_texto());
			case 2:
				FlxG.switchState( new Nivel_2_texto());
			case 3:
				FlxG.switchState( new Nivel_3_texto());
			case 4:
				FlxG.switchState( new Nivel_4_texto());
			case 5:
				FlxG.switchState( new Nivel_5_texto());
			case 6:
				FlxG.switchState( new Nivel_6_texto());
			case 7:
				FlxG.switchState( new Nivel_7_texto());
			case 8:
				FlxG.switchState( new Nivel_8_texto());
			case 9:
				FlxG.switchState( new Nivel_9_texto());
			case 10:
				FlxG.switchState( new Nivel_Final_texto());
			default:
				FlxG.switchState( new Win());
		}
	}
	
}