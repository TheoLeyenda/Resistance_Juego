package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.math.FlxAngle;
import flixel.ui.FlxBar;

/**
 * ...
 * @author Theo leyenda
 */
class Tanque extends Enemigo 
{
	//TERMINAR EL TANQUE BASANDOSE EN EL JODIDO SOLDADO
	private var _vida:Int =50;
	private var guia:FlxPoint;
	private var balaTanque:BalaTanque;
	private var HabilitarDisparo:Bool = false;
	private var _timer:Float;
	private var _diley:Float;
	private var barraVida:FlxBar;
	public function new(diley:Float,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		barraVida = new FlxBar(x - 25, y - 20, LEFT_TO_RIGHT, 100, 10, this, "_vida", 0, 50, true);
		barraVida.createFilledBar(FlxColor.TRANSPARENT, FlxColor.RED, true, FlxColor.WHITE);
		FlxG.state.add(barraVida);
		
		makeGraphic(32, 48, FlxColor.RED);
		loadGraphic(AssetPaths.tanque__png);
		direcion = FlxTween.tween(this, {x:Reg.playerPosX, y:Reg.playerPosY}, 20, {type: FlxTween.ONESHOT});
		_timer = 1;
		_diley = diley;
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		barraVida.x = this.x-25;
		barraVida.y = this.y -20;
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
		this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x+12.5, guia.y+10), true)+90;
		if (_timer == 0)
		{
			HabilitarDisparo = false;
		}
		if (!HabilitarDisparo)
		{
			_timer += elapsed;
		}
		if (_timer >= _diley)
		{
			HabilitarDisparo = true;
		}
		if (HabilitarDisparo)
		{
			if (angle < 0)
			{
				balaTanque = new BalaTanque(x + width / 2, y + height);
			}
			if (angle > 0 )
			{
				balaTanque = new BalaTanque(x + width/2, y + height);
			}
			if(angle == 0)
			{
				balaTanque = new BalaTanque(width/2, y);
			}
			FlxG.sound.play(AssetPaths.sonidoDisparoTanque__wav);
			Reg.GrupBalaTanque.add(balaTanque);
			_timer = 0;
		}
	}
	public  function setVida(vida:Int){
		
		_vida = vida;
	}
	public function getVida():Int{
		
		return _vida;
	}
	public function destruirBarraVida():Void
	{
		//llamar a esta funcion en los niveles que tenga al blindado.
		barraVida.destroy();
	}
	
}