package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class BalaTanque extends FlxSprite 
{

	private var objetivo:FlxTween;
	private var guia:FlxPoint;
	private var _vida:Int = 10;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(15, 15, FlxColor.GRAY);
		//
		//comentar la linea de abajo si no convence la bala.
		loadGraphic(AssetPaths.balaTanque__png);
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
		//
		this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true)+90;
		objetivo = FlxTween.tween(this, {x:Reg.playerPosX+7, y:Reg.playerPosY+10}, 2, {type:FlxTween.ONESHOT});
		objetivo.start();
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (objetivo.finished)
		{
			this.destroy();
		}
	}
	public function setVida(vida:Int):Void
	{
		_vida = vida;
	}
	public function getVida():Int
	{
		return _vida;
	}
}