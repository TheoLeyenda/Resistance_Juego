package;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author Theo leyenda
 */
class Reg 
{
	static public var playerPosX:Float;
	static public var playerPosY:Float;
	static public var puntaje:Int=0;
	static public var Hihgscore:Int=0;
	static public var VidaSoldado:Int;
	static public var GrupbalaSoldado:FlxTypedGroup<BalaSoldado>;
	static public var GrupBalaJugador:FlxTypedGroup<Bala>;
	static public var GrupBalaTanque:FlxTypedGroup<BalaTanque>;
	static public var VidaZombie:Int;
	
	
	static public var entidadPlayer:Player;
	
	static public var entidadesZombie:Int=0;
	static public var entidadesMisil:Int=0;
	static public var entidadesSoldado:Int=0;
	static public var entidadesBlindado:Int = 0;
	static public var entidadesTanque:Int = 0;
	
	static public var nivelActual:Int = 1;
}