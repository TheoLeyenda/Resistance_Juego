package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;

/**
 * ...
 * @author Theo leyenda
 */
class Nivel_4 extends FlxSubState 
{
	private var player:Player;
	private var soldado:Soldados;
	private var plataforma:Plataforma;
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	
	private var GrupSoldado:FlxTypedGroup<Enemigo>;
	private var GrupPlataforma:FlxTypedGroup<Plataforma>;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void 
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.fondo_nivel4__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		entrar = true;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		
		GrupSoldado = new FlxTypedGroup<Enemigo>();
		GrupPlataforma = new FlxTypedGroup<Plataforma>();
		
		plataforma = new Plataforma(65, 2, 30, 0);
		GrupPlataforma.add(plataforma);
		plataforma = new Plataforma(65, 4, 30, FlxG.height - 20);
		GrupPlataforma.add(plataforma);
		
		plataforma = new Plataforma(65, 2, 30, FlxG.height / 2 - 10);
		GrupPlataforma.add(plataforma);
		plataforma = new Plataforma(65, 4, 30, FlxG.height / 2 + 10);
		GrupPlataforma.add(plataforma);
		
		plataforma = new Plataforma(65, 2, FlxG.width - 50, FlxG.height / 2 - 10);
		GrupPlataforma.add(plataforma);
		
		plataforma = new Plataforma(65, 4, FlxG.width - 50, FlxG.height / 2 + 10);
		GrupPlataforma.add(plataforma);
		
		plataforma = new Plataforma(65, 2, FlxG.width - 50, 0);
		GrupPlataforma.add(plataforma);
		plataforma = new Plataforma(65, 4, FlxG.width - 50, FlxG.height - 20);
		GrupPlataforma.add(plataforma);
		
		soldado = new Soldados(1.5,0, 0);
		Reg.entidadesSoldado++;
		soldado.angle = -30;
		GrupSoldado.add(soldado);
		
		soldado = new Soldados(1,0, FlxG.height - soldado.height);
		Reg.entidadesSoldado++;
		soldado.angle = -120;
		GrupSoldado.add(soldado);
		
		soldado = new Soldados(1.5,FlxG.width - soldado.width, 0);
		Reg.entidadesSoldado++;
		soldado.angle = 30;
		GrupSoldado.add(soldado);
		
		
		soldado = new Soldados(1,FlxG.width - soldado.width, FlxG.height - soldado.height);
		Reg.entidadesSoldado++;
		soldado.angle = 120;
		GrupSoldado.add(soldado);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupSoldado);
		
		add(GrupDeGrupEnemigo);
		
		add(GrupPlataforma);
	}
	override public function update(elapsed:Float):Void
	{
		//VER SI CALIBRAMOS LA DIFICULTADD DEL NIVEL.
		super.update(elapsed);
		if (Reg.entidadesSoldado <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			entrar = false;
			add(playerYendose);
		}
		
		//coliciones de bala jugador y soldado(funciona)
		FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlapBalaSoldadoBalaJugador);
		
		//coliciones de bala jugador y soldados(funciona)
		FlxG.overlap(Reg.GrupBalaJugador, GrupSoldado , OverlapBalaJugadorSoldado);
		
		//coliciones de bala soldado con jugador(funciona)
		FlxG.overlap(Reg.GrupbalaSoldado , player, OverlapBalaSoldadoJugador);
		
		//coliciones de la bala del soldado con la plataforma(funciona)
		FlxG.overlap(Reg.GrupbalaSoldado , GrupPlataforma , OverlapBalaSoldadoPlataforma);
		
		//coliciones de la bala del jugador con la plataforma(funciona)
		FlxG.overlap(Reg.GrupBalaJugador , GrupPlataforma, OverlapBalaJPlataforma);
	}
	public function OverlapBalaSoldadoBalaJugador(balaJ:Bala,balaSoldado:BalaSoldado):Void
	{
		Reg.puntaje = Reg.puntaje+5;
		Puntaje.destroy();
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJ.kill();
		balaJ.getEfecto().kill();
		balaSoldado.kill();
	}
	public function OverlapBalaJugadorSoldado(balaJ:Bala, soldado:Soldados):Void
	{
		Reg.puntaje = Reg.puntaje+20;
		Puntaje.destroy();
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJ.kill();
		balaJ.getEfecto().kill();
		soldado.kill();
		Reg.entidadesSoldado--;
	}
	public function OverlapBalaSoldadoJugador(balaSoldado:BalaSoldado, jugador:Player):Void
	{
		balaSoldado.kill();
		jugador.kill();
		if (entrar)
		{
			FlxG.switchState( new GameOver());
		}
	}
	public function OverlapBalaSoldadoPlataforma(balaSoldado:BalaSoldado, plataforma:Plataforma):Void
	{
		balaSoldado.kill();
	}
	public function OverlapBalaJPlataforma(balaJ:Bala, plataforma:Plataforma):Void
	{
		balaJ.kill();
		balaJ.getEfecto().kill();
	}
}