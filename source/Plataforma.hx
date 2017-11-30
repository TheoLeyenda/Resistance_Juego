package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
/**
 * ...
 * @author Theo leyenda
 */
class Plataforma extends FlxSprite 
{

	private var _patron:Int;
	private var _timer:Int=0;
	private var _tope:Float=0;
	public function new(tope:Float,patron:Int ,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(20, 20, FlxColor.BROWN);
		_patron = patron;
		_tope = tope;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Movimiento();
	}
	public function Movimiento():Void
	{
		_timer++;
		switch(_patron)
		{
			case 1:
				
				if (_timer < _tope)
				{
					velocity.x = 100;
				}
				if (_timer > _tope)
				{
					velocity.x = -100;
				}
				
				if (_timer == _tope*2)
				{
					velocity.x = 0;
					_timer = 0;
				}
				
				if (_timer < _tope)
				{
					velocity.x = 100;
				}
				if (_timer > _tope)
				{
					velocity.x = -100;
				}
			case 2:
				
				if (_timer < _tope)
				{
					velocity.y = 100;
				}
				if (_timer > _tope)
				{
					velocity.y = -100;
				}
				
				if (_timer == _tope * 2)
				{
					velocity.y = 0;
					_timer = 0;
				}
				
				if (_timer < _tope)
				{
					velocity.y = 100;
				}
				if (_timer > _tope)
				{
					velocity.y = -100;
				}
			case 3:
				
				if (_timer < _tope)
				{
					velocity.x = -100;
				}
				if (_timer > _tope)
				{
					velocity.x = 100;
				}
				
				if (_timer == _tope * 2)
				{
					_timer = 0;
					velocity.x = 0;
				}
				
				if (_timer < _tope)
				{
					velocity.x = -100;
				}
				if (_timer > _tope)
				{
					velocity.x = 100;
				}
			case 4: 
				
				if (_timer < _tope)
				{
					velocity.y = -100;
				}
				if (_timer > _tope)
				{
					velocity.y = 100;
				}
				
				if (_timer == _tope * 2)
				{
					_timer = 0;
					velocity.y = 0;
				}
				
				if (_timer < _tope)
				{
					velocity.y = -100;
				}
				if (_timer > _tope)
				{
					velocity.y = 100;
				}
			case 5:
				if (_timer < 50)
				{
					velocity.x = 100;
					velocity.y = 0;
				}
				if (_timer >= 50)
				{
					velocity.y = 100;
					velocity.x = 0;
				}
				if (_timer >= 100)
				{
					velocity.x = -100;
					velocity.y = 0;
				}
				if (_timer >= 150)
				{
					velocity.y = -100;
					velocity.x = 0;
				}
				//----------------
				if (_timer >= 200)
				{
					_timer = 0;
					velocity.x = 0;
					velocity.y = 0;
				}
				//----------------
				if (_timer < 50)
				{
					velocity.x = 100;
					velocity.y = 0;
				}
				if (_timer >= 50)
				{
					velocity.y = 100;
					velocity.x = 0;
				}
				if (_timer >= 100)
				{
					velocity.x = -100;
					velocity.y = 0;
				}
				if (_timer >= 150)
				{
					velocity.y = -100;
					velocity.x = 0;
				}
		}
	}
	public function setTope(tope:Float)
	{
		_tope = tope;
	}
	public function getTope():Float
	{
		return _tope;
	}
}