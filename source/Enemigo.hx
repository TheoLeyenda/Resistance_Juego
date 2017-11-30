package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;

/**
 * ...
 * @author Theo leyenda
 */
class Enemigo extends FlxSprite 
{
	private var player:Player;
	private var direcion:FlxTween;
	private var cordAtakX:Float;
	private var cordAtakY:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		player = new Player();
	}
	
}