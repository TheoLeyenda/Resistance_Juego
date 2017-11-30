
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxCollision;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.math.FlxAngle;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Theo leyenda
 */
class Player extends FlxSprite 
{
	private var guia:FlxPoint;
	private var bala:Bala;
	private var GrupBalaPlayer:FlxTypedGroup<Bala>;
	private var angulo:FlxAngle;
	private var disparar:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		centerOrigin();
		centerOffsets();
		disparar = true;
		//makeGraphic(25, 25, 0xff812534);
		
		//SPRITE 1 TORRETA JUGADOR
		//loadGraphic(AssetPaths.opcion_1_torreta__png);
		
		//VER COMO ARREGLARLO
		//----------------------------------------------
		
		//SPRITE 2 TORRETA JUGAODR
		loadGraphic(AssetPaths.torreta_jugador_op2__png);
		
		//VER COMO ARREGLARLO
		//-----------------------------------------------
		
		//SPRITE 3 TORRETA JUGADOR
		//loadGraphic(AssetPaths.opcion_3_Jugador__png);
		
		//SPRITE 4 TORRETA JUGADOR
		//loadGraphic(AssetPaths.opcion_4_Jugador__png);
		GrupBalaPlayer = new FlxTypedGroup<Bala>();
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		
		guia = FlxG.mouse.getWorldPosition();
		//calcula el angulo para que la torreta siga al maus (que tengan el cañon mirando para arriba)-descomentar linea de abajo para usar-.
		//this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true) + 90;
		
		//calcula el angulo para que la torreta siga al maus (que tengan el cañon mirando hacia <-)-descomentar linea de abajo para usar-.
		this.angle = FlxAngle.angleBetweenPoint(this, FlxPoint.weak(guia.x, guia.y), true)-180;
		if (FlxG.mouse.justPressed && disparar)
		{
			bala = new Bala(x + width / 2, y + height / 2);
			//GrupBalaPlayer.add(bala);
			Reg.GrupBalaJugador.add(bala);
			FlxG.sound.play(AssetPaths.DisparoJugadorAnda__wav,0.5);
		}
		if(FlxG.mouse.justPressed && !disparar)
		{
			FlxG.sound.play(AssetPaths.armaSinBalas__wav,0.5);
		}
		//--------------------------------------
		
	}
	public function getGrupoBalaPlayer():FlxTypedGroup<Bala>
	{
		return GrupBalaPlayer;
	}
	public function getPocicionAtkX():Float
	{
		return FlxG.mouse.getWorldPosition().x;
	}
	public function getPocicionAtkY():Float
	{
		return FlxG.mouse.getWorldPosition().y;
	}
	public function getBala():Bala
	{
		return bala;
	}
	public function setDisparar(B:Bool):Void
	{
		disparar = B;
	}
	public function getDisparar():Bool
	{
		return disparar;
	}
	
}