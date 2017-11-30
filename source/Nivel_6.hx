package;

import flixel.FlxState;
import flixel.FlxSprite;
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
class Nivel_6 extends FlxSubState 
{
	private var entrar:Bool;
	private var entrarEnSegundaFase:Bool;
	private var player:Player;
	private var plataforma:Plataforma;
	private var soldado:Soldados;
	private var zombie:Zombie;
	private var playerYendose:PlayerYendoseXD;
	private var GrupPlataforma:FlxTypedGroup<Plataforma>;
	private var GrupSoldado:FlxTypedGroup<Enemigo>;
	private var GrupZombies:FlxTypedGroup<Enemigo>;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var Puntaje:FlxText;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void 
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.nivel6_op2__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		entrarEnSegundaFase = true;
		entrar = true;
		GrupZombies = new FlxTypedGroup<Enemigo>();
		GrupSoldado = new FlxTypedGroup<Enemigo>();
		
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		
		GrupPlataforma = new FlxTypedGroup<Plataforma>();
		entrar = true;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		// ver si las plataformas stan bien (?
		
		plataforma = new Plataforma(0, 5, FlxG.width / 2 - 35, FlxG.height / 2 - 40);
		GrupPlataforma.add(plataforma);
		plataforma = new Plataforma(65, 2, FlxG.width / 2 -60, FlxG.height / 2 -65);
		GrupPlataforma.add(plataforma);
		plataforma = new Plataforma(65, 2, FlxG.width / 2 +70, FlxG.height / 2 - 65);
		GrupPlataforma.add(plataforma);
		add(GrupPlataforma);
		
		//calibrar los dileys/ sacar soldados para que no sea tan complicado...
		//ARRIBA
		soldado = new Soldados(2.5, FlxG.width / 2 - (25 - 5), 0);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		soldado = new Soldados(2.5, FlxG.width / 2 + (25 + 5), 0);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		//ABAJO
		soldado = new Soldados(1.5, FlxG.width / 2 - (25 - 5), FlxG.height - 25);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		soldado = new Soldados(1.5, FlxG.width / 2 +(25 + 5), FlxG.height - 25);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		
		//-------->
		soldado = new Soldados(3, FlxG.width - 25, FlxG.height / 2);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		/*soldado = new Soldados(3, FlxG.width - 25, FlxG.height / 2 + (25 + 5));
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);*/
		
		//<-------
		soldado = new Soldados(2, 0, FlxG.height / 2);
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);
		/*soldado = new Soldados(1, 0, FlxG.height / 2 +(25 + 5));
		Reg.entidadesSoldado++;
		GrupSoldado.add(soldado);*/
		
		add(GrupSoldado);
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
		
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		GrupDeGrupEnemigo.add(GrupSoldado);
		add(GrupDeGrupEnemigo);
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.entidadesSoldado<=0 && entrarEnSegundaFase)
		{
			entrarEnSegundaFase = false;
			GrupPlataforma.destroy();
			for (i in 0...10)
			{
				zombie = new Zombie(i * 64, 0);
				Reg.entidadesZombie++;
				GrupZombies.add(zombie);
			}
			GrupDeGrupEnemigo.add(GrupZombies);
			add(GrupDeGrupEnemigo);
			
		}
		if (!entrarEnSegundaFase)
		{
			if (Reg.entidadesZombie <= 0 && entrar)
			{
				playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
				entrar = false;
				add(playerYendose);
			}
			FlxG.overlap(Reg.GrupBalaJugador , GrupZombies , OverlapBalaJugadorZombie);
			FlxG.overlap(GrupZombies, player, OverlapZombieJugador);
			FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlaBalaJugadorBalaSoldado);
			FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
		}
		else
		{
			FlxG.overlap(Reg.GrupbalaSoldado, GrupPlataforma, OverlapBalaSoldadoPlataforma);
			FlxG.overlap(Reg.GrupBalaJugador, GrupPlataforma, OverlapBalaJugadorPlataforma);
			FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, OverlaBalaJugadorBalaSoldado);
			FlxG.overlap(Reg.GrupBalaJugador, GrupSoldado , OverlapBalaJugadorSoldado);
			FlxG.overlap(Reg.GrupbalaSoldado, player, OverlapBalaSoldadoJugador);
		}
		
	}
	public function OverlapBalaSoldadoPlataforma(balaSoldado:BalaSoldado,plataforma:Plataforma):Void
	{
		balaSoldado.kill();
	}
	public function OverlapBalaJugadorPlataforma(balaJugador:Bala, plataforma:Plataforma):Void
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
	}
	public function OverlaBalaJugadorBalaSoldado(balaJugador:Bala, balaSoldado:BalaSoldado):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		balaSoldado.kill();
	}
	public function OverlapBalaJugadorSoldado(balaJugador:Bala , soldado:Soldados):Void
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +20;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		soldado.kill();
		Reg.entidadesSoldado--;
	}
	public function OverlapBalaSoldadoJugador(balaSoldado:BalaSoldado, jugador:Player):Void
	{
		player.kill();
		FlxG.switchState( new GameOver());
	}
	public function OverlapBalaJugadorZombie(balaJugador:Bala, zombie:Zombie):Void
	{
		zombie.setVida(zombie.getVida() - 5);
		balaJugador.kill();
		balaJugador.getEfecto().kill();
		if (zombie.getVida() <= 0)
		{
			zombie.kill();
			Reg.entidadesZombie--;
			Puntaje.destroy();
			Reg.puntaje = Reg.puntaje +10;
			Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
			add(Puntaje);
			
		}
	}
	public function OverlapZombieJugador(zombie:Zombie, jugador:Player):Void
	{
		jugador.kill();
		FlxG.switchState( new GameOver());
	}
}