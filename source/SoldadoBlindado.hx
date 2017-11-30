package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class SoldadoBlindado extends Enemigo 
{
	private var _vida:Int = 400;
	private var barraVida:FlxBar;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		barraVida = new FlxBar(x - 25, y - 10, LEFT_TO_RIGHT, 100, 10, this, "_vida", 0, 400, true);
		barraVida.createFilledBar(FlxColor.TRANSPARENT, FlxColor.RED, true, FlxColor.WHITE);
		FlxG.state.add(barraVida);
		//makeGraphic(32, 32);
		loadGraphic(AssetPaths.Alto_jugge_op1__png);
		direcion = FlxTween.tween(this, {x:Reg.playerPosX, y:Reg.playerPosY}, 10, {type: FlxTween.ONESHOT});
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		barraVida.x = this.x-25;
		barraVida.y = this.y -10;
	}
	public function setVida(vida:Int):Void
	{
		_vida = vida;
	}
	public function getVida():Int
	{
		return _vida;
	}
	public function destruirBarraVida():Void
	{
		//llamar a esta funcion en los niveles que tenga al blindado.
		barraVida.destroy();
	}
}