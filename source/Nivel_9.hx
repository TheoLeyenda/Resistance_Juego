package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

/**
 * ...
 * @author Theo leyenda
 */
class Nivel_9 extends FlxSubState 
{
	private var soldado:Soldados;
	private var soldadoMov1:Soldados;
	private var soldadoMov2:Soldados;
	private var zombie:Zombie;
	private var soldadoBlindado:SoldadoBlindado;
	private var player:Player;
	private var entrarFase1:Bool;
	private var entrarFase2:Bool;
	private var entrarFase3:Bool;
	private var timer1:Int = 0;
	private var timer2:Int = 0;
	private var playerYendose:PlayerYendoseXD;
	
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var GrupSoldado:FlxTypedGroup<Enemigo>;
	private var GrupZombies:FlxTypedGroup<Enemigo>;
	private var GrupBlindado:FlxTypedGroup<Enemigo>;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void 
	{
		super.create();
		
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.nivel_9__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		entrarFase1 = true;
		entrarFase2 = false;
		entrarFase3 = false;
		
		player = new Player(FlxG.width/2, FlxG.height/2+150);
		add(player);
		
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		
		
		GrupBlindado = new FlxTypedGroup<Enemigo>();
		GrupSoldado = new FlxTypedGroup<Enemigo>();
		GrupZombies = new FlxTypedGroup<Enemigo>();
		
		soldado = new Soldados(1, 0, 0);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		soldado = new Soldados(1, FlxG.width - 25, 0);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		soldadoMov1 = new Soldados(2, 30, 0);
		Reg.entidadesSoldado++;
		soldadoMov1._setHabilitarMovSoldado(true);
		soldadoMov1.loadGraphic(AssetPaths.opcion_1_torreta__png);
		soldadoMov1.angle = 130;
		GrupSoldado.add(soldadoMov1);
		
		soldadoMov2 = new Soldados(2, FlxG.width - 45, 0);
		Reg.entidadesSoldado++;
		soldadoMov2._setHabilitarMovSoldado(true);
		soldadoMov2.loadGraphic(AssetPaths.opcion_1_torreta__png);
		soldadoMov2.angle = 230;
		GrupSoldado.add(soldadoMov2);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupSoldado);
		add(GrupDeGrupEnemigo);
		//add(GrupSoldado);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap( Reg.GrupBalaJugador,Reg.GrupbalaSoldado, OverlapBalaJugadorBalaSoldado);
		FlxG.overlap(Reg.GrupBalaJugador, GrupSoldado, OverlapBalaJugadorSoldado);
		FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
		FlxG.overlap(Reg.GrupBalaJugador, GrupZombies, OverlapBalaJugadorZombie);
		FlxG.overlap(GrupZombies, player, OverlapZombieJugador);
		FlxG.overlap(Reg.GrupBalaJugador, GrupBlindado, OverlapBalaJugadorBlindado);
		FlxG.overlap(GrupBlindado, player, OverlapBlindadoJugador);
		if (entrarFase1)
		{
			timer1++;
			if (timer1 < 220)
			{
				soldadoMov1.velocity.x = 75;
			}
			if (timer1 == 440)
			{
				soldadoMov1.velocity.x = 0;
				timer1 = 0;
			}
			if (timer1 > 220)
			{
				soldadoMov1.velocity.x = -75;
			}
			
			timer2++;
			if (timer2 < 220)
			{
				soldadoMov2.velocity.x = -75;
			}
			if (timer2 == 440)
			{
				soldadoMov2.velocity.x = 0;
				timer2 = 0;
			}
			if (timer2 > 220)
			{
				soldadoMov2.velocity.x = 75;
			}
		}
		if (Reg.entidadesSoldado <= 0 && entrarFase1)
		{
			entrarFase1 = false;
			entrarFase2 = true;
			for (i in 0...5)
			{
				zombie = new Zombie( -25, i * 64);
				Reg.entidadesZombie++;
				GrupZombies.add(zombie);
			}
			for (i in 0...5)
			{
				zombie = new Zombie(FlxG.width - 50, i * 64);
				Reg.entidadesZombie++;
				GrupZombies.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombies);
			add(GrupDeGrupEnemigo);
			//add(GrupZombies);
		}
		if (Reg.entidadesZombie <= 0 && entrarFase2)
		{
			entrarFase2 = false;
			entrarFase3 = true;
			
			soldadoBlindado = new SoldadoBlindado(FlxG.width / 2 - 40, -32);
			Reg.entidadesBlindado++;
			GrupBlindado.add(soldadoBlindado);
			
			soldadoBlindado = new SoldadoBlindado(FlxG.width / 2 + 40, -32);
			Reg.entidadesBlindado++;
			GrupBlindado.add(soldadoBlindado);
			
			GrupDeGrupEnemigo.add(GrupBlindado);
			add(GrupDeGrupEnemigo);
			//add(GrupBlindado);
		}
		if (Reg.entidadesBlindado <= 0 && entrarFase3)
		{
			entrarFase3 = false;
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			add(playerYendose);
		}
	}
	public function OverlapBalaJugadorBalaSoldado(balaJugador:Bala, balaSoldado:BalaSoldado):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		balaSoldado.kill();
		
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje+5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
	}
	public function OverlapBalaSoldadoJugador(balaSoldado:BalaSoldado, jugador:Player):Void
	{
		FlxG.switchState( new GameOver());
	}
	public function OverlapBalaJugadorSoldado(balaJugador:Bala, soldado:Soldados):Void
	{
		soldado.kill();
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		Reg.entidadesSoldado--;
		
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje+20;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
	}
	public function OverlapBalaJugadorZombie(balaJugador:Bala, zombie:Zombie):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		zombie.setVida(zombie.getVida() - 5);
		if (zombie.getVida() <= 0)
		{
			zombie.kill();
			Reg.entidadesZombie--;
			
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje+10;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
	public function OverlapZombieJugador(zombie:Zombie, jugador:Player):Void
	{
		FlxG.switchState( new GameOver());
	}
	public function OverlapBlindadoJugador(blindado:SoldadoBlindado, jugador:Player):Void
	{
		FlxG.switchState( new GameOver());
	}
	public function OverlapBalaJugadorBlindado(balaJugador:Bala, blindado:SoldadoBlindado):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje+5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		blindado.setVida(blindado.getVida() - 15);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		if (blindado.getVida() <= 0)
		{	
			blindado.destruirBarraVida();
			blindado.kill();
			Reg.entidadesBlindado--;
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje+100;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
		}
	}
}