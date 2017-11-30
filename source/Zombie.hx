package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Theo leyenda
 */
class Zombie extends Enemigo 
{
	private var _vida:Int = 10;
	private var guia:FlxPoint;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.opcion_zombie_1__png);
		direcion = FlxTween.tween(this, {x:Reg.playerPosX, y:Reg.playerPosY}, 6, {type: FlxTween.ONESHOT});
		scale.x = 1.5;
		scale.y = 1.5;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
		this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x+12.5, guia.y+10), true)-90;
	}
	public  function setVida(vida:Int){
		
		_vida = vida;
	}
	public function getVida():Int{
		
		return _vida;
	}
}