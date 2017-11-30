package;

import flash.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.addons.effects.FlxTrail;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author Theo leyenda
 */

 
class Bala extends FlxSprite 
{
	private var direcion:FlxTween;
	private var cordAtakX:Float;
	private var cordAtakY:Float;
	private var objetivo:Player;
	private var guia:FlxPoint;
	private var efecto:FlxTrail;
	//implementar flxTrail y USARLO
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(7, 7,FlxColor.GRAY);
		//loadGraphic(AssetPaths.balaOpcion_1__png);
		efecto = new FlxTrail(this, null, 6, 3, 0.4, 0.05);
		FlxG.state.add(efecto);
		guia = FlxG.mouse.getWorldPosition();
		angle = FlxAngle.TO_DEG * Math.atan(
		(guia.y - (y + height / 2)) /
		(guia.x -(x + width / 2))
		);
		
		objetivo = new Player();
		cordAtakX = objetivo.getPocicionAtkX();
		cordAtakY = objetivo.getPocicionAtkY();
		direcion = FlxTween.tween(this, {x:cordAtakX, y:cordAtakY}, 0.5, {type: FlxTween.ONESHOT});
		
		//le digo al tween que comienze
		direcion.start();
		//cancelo el tween
		//direcion.cancel();
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		efecto.x = x;
		efecto.y = y;
		if (direcion.finished)
		{
			efecto.destroy();
			this.destroy();
		}
	}
	public function getEfecto():FlxTrail
	{
		return efecto;
	}
	
}