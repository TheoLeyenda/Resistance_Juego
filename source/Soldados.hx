package;

import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Theo leyenda
 */
class Soldados extends Enemigo 
{
	private var balaSoldado:BalaSoldado;
	private var Timer:Float = 1;
	private var HabilitarDisparo:Bool = false;
	private var _habilitarMov:Bool = false;
	private var _diley:Float;
	private var guia:FlxPoint;
	public function new(diley,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		_diley = diley;
		loadGraphic(AssetPaths.opcion_soldado_1__png);
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
		//opcion 1 de seguimiento.
		/*if (!_habilitarMov)
		{
			this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) - 90;
		}
		if (_habilitarMov)
		{
			this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) + 90;
			balaSoldado = new BalaSoldado(x + 15, y + 20);
			balaSoldado.acceleration.y = 40;
		}*/
		//---------------
		if (Timer == 0)
		{
			HabilitarDisparo = false;
		}
		if (!HabilitarDisparo)
		{
			Timer += elapsed;
		}
		if (Timer >= _diley)
		{
			HabilitarDisparo = true;
		}
		if (HabilitarDisparo)
		{
			if (angle < 0 && !_habilitarMov)
			{
				balaSoldado = new BalaSoldado(x + 6, y + height - 5);
			}
			if (angle > 0 && !_habilitarMov)
			{
				balaSoldado = new BalaSoldado(x - 6, y + height - 15);
			}
			if(angle == 0 && !_habilitarMov)
			{
				balaSoldado = new BalaSoldado(x, y);
			}
			//opcion 2 de seguimiento
			if (!_habilitarMov)
			{
				this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) - 90;
			}
			if (_habilitarMov)
			{
				//logica para que mientras se mueva la torreta dispare al jugador
				this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) + 90;
				if (velocity.y > 0)
				{
					if (x > FlxG.width / 2)
					{
						balaSoldado = new BalaSoldado(x - 1, y +15);
						balaSoldado.acceleration.y = -40;
					}
					else
					{
						balaSoldado = new BalaSoldado(x + 15, y +20);
						balaSoldado.acceleration.y = -40;
					}
				}
				if(velocity.y<0)
				{
					if (x > FlxG.width / 2)
					{
						balaSoldado = new BalaSoldado(x - 1, y + 15);
						balaSoldado.acceleration.y = 40;
					}
					else
					{
						balaSoldado = new BalaSoldado(x + 15, y +20);
						balaSoldado.acceleration.y = 40;
					}
				}
				if (velocity.x > 0)
				{
					balaSoldado = new BalaSoldado(x + 15, y +20);
					balaSoldado.acceleration.y = -40;
				}
				if (velocity.x < 0)
				{
					balaSoldado = new BalaSoldado(x, y +20);
					balaSoldado.acceleration.y = -40;
				}
				
			}
			//----------------------
			Reg.GrupbalaSoldado.add(balaSoldado);
			Timer = 0;
		}
	}
	public function getBala():BalaSoldado
	{
		return balaSoldado;
	}
	public function _setHabilitarMovSoldado(habilitar:Bool):Void
	{
		_habilitarMov = habilitar;
	}
	public function _getHabilitarMovSoldado():Bool
	{
		return _habilitarMov;
	}
}