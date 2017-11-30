package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
/**
 * ...
 * @author Theo leyenda
 */
class Misil extends Enemigo 
{
	private var _tipoTween:Int;
	private var _ladoSpawner:Int;
	private var propulsion:FlxEmitter;
	private var guia:FlxPoint;
	/*
	 LADO SPAWNER
	  1 = <-
	  2 = ->
	  3 = ARRIBA
	  4 = ABAJO
	 */
	private var _CordFlxPoint:FlxPoint;
	private var _timer:Int;
	public function new(ladoSpawner:Int,tipoTween:Int,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		_tipoTween = tipoTween;
		_ladoSpawner = ladoSpawner;
		_timer = 0;
		//makeGraphic(13, 13);
		
		propulsion = new FlxEmitter(x, y + height/2, 100);
		propulsion.launchAngle.set( -170, -190);
		propulsion.makeParticles(2, 2, FlxColor.YELLOW, 100);
		FlxG.state.add(propulsion);
		propulsion.start(false, 0.01);
		loadGraphic(AssetPaths.op1_misil__png);
		
		guia = new FlxPoint(Reg.playerPosX, Reg.playerPosY);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Movimiento();
		propulsion.x = x+5;
		propulsion.y = y + height/2;
		
	}
	public function destrucionParticulas():Void
	{
		propulsion.kill();
	}
	public function Movimiento():Void
	{
		switch(_tipoTween)
		{
			case 1:
				// VER SI SE PUEDE ARREGLAR EL PROBLEMA CON EL ULTIMO TRAMO DEL TWEEN
				direcion = FlxTween.tween(this, {x:Reg.playerPosX+15, y:Reg.playerPosY+15}, 2, {type: FlxTween.ONESHOT});
				this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) + 90;
			case 2:
				//GRADUO LA VELOCIDAD DE LOS MISILES CON LOS velocity.x y velocity.y;
				//	<----------
				_timer++;
				loadGraphic(AssetPaths.op1_misil__png);
				if (_ladoSpawner==1)
				{
					velocity.x = 150;
					if (_timer < 10)
					{
						propulsion.launchAngle.set( 100, 90);
						angle = 110;
						velocity.y = 150;
					}
					if (_timer >10)
					{
						propulsion.launchAngle.set( -90, -100);
						velocity.y = -150;
						angle = 80;
					}
					if (_timer == 20)
					{
						_timer = 0;
					}
					if (x > FlxG.width)
					{
						this.destroy();
						propulsion.destroy();
					}
				}
				// ------------->
				// fijarse si podemos calibrar las particulas.
				if (_ladoSpawner == 2)
				{
					loadGraphic(AssetPaths.op1_misil__png);
					velocity.x = -150;
					
					if (_timer < 10)
					{
						velocity.y = 150;
						propulsion.launchAngle.set(70,80);
						angle = -110;
					}
					if (_timer > 10)
					{
						velocity.y = -150;
						propulsion.launchAngle.set( -80, -70);
						angle = -80;
					}
					if (_timer == 20)
					{
						_timer = 0;
					}
					if (x < -10)
					{
						this.destroy();
						propulsion.destroy();
					}
				}
				//ARRIBA
				
				if (_ladoSpawner == 3)
				{
					velocity.y = 150;
					loadGraphic(AssetPaths.op1_misil__png);
					
					if (_timer < 10)
					{	
						velocity.x = 150;
						propulsion.launchAngle.set(180,210);
						angle = 150;
					}
					if (_timer >10)
					{
						velocity.x = -150;
						propulsion.launchAngle.set( -210, -180);
						angle = -150;
					}
					if (_timer == 20)
					{
						_timer = 0;
					}
					if (y > FlxG.height)
					{
						this.destroy();
						propulsion.destroy();
					}
				}
				
				//ABAJO
				
				if (_ladoSpawner == 4)
				{
					loadGraphic(AssetPaths.op1_misil__png);
					velocity.y = -150;
					
					if (_timer < 10)
					{	
						velocity.x = 150;
						propulsion.launchAngle.set(180,210);
						angle = 30;
					}
					if (_timer >10)
					{
						velocity.x = -150;
						propulsion.launchAngle.set(-180,-210);
						angle = -30;
					}
					if (_timer == 20)
					{
						_timer = 0;
					}
					if (y <-10)
					{
						this.destroy();
						propulsion.destroy();
					}
				}
		}
	}
}