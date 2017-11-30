package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.tweens.FlxTween;
import flixel.group.FlxGroup;
import flixel.text.FlxText;

/**
 * ...
 * @author Theo leyenda
 */
class Nivel_2 extends FlxSubState 
{
	private var player:Player;
	private var soldado:Soldados;
	private var platadorma:Plataforma;
	private var Puntaje:FlxText;
	
	private var playerYendose:PlayerYendoseXD;
	private var entrar:Bool;
	private var GrupSoldados:FlxTypedGroup<Enemigo>;
	private var GrupPlataforma:FlxTypedGroup<Plataforma>;
	private var GrupDeGrupEnemigo:FlxTypedGroup<FlxTypedGroup<Enemigo>>;
	private var higscore:FlxText;
	private var fondo:FlxSprite;
	override public function create():Void
	{
		super.create();
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.Fondo_Nivel2__png);
		add(fondo);
		if (Reg.Hihgscore > 0)
		{
			higscore = new FlxText(FlxG.width / 2 + 65,0,0, "HighScore:" + Reg.Hihgscore,24);
			add(higscore);
		}
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		GrupDeGrupEnemigo = new FlxTypedGroup<FlxTypedGroup<Enemigo>>();
		entrar = true;
		player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);
		add(player.getGrupoBalaPlayer());
		Reg.playerPosX = player.x;
		Reg.playerPosY = player.y;
		
		GrupSoldados = new FlxTypedGroup<Enemigo>();
		GrupPlataforma = new FlxTypedGroup<Plataforma>();
		for (i in 0...4)
		{
			soldado = new Soldados(1);
			GrupSoldados.add(soldado);
			Reg.entidadesSoldado= Reg.entidadesSoldado+1;
		}
		GrupSoldados.members[0].x = 0;
		GrupSoldados.members[0].y = 30;
		GrupSoldados.members[0].angle = -40;
		
		GrupSoldados.members[1].x = FlxG.width / 2 - 15;
		GrupSoldados.members[1].y = 30;
		
		GrupSoldados.members[2].x = FlxG.width / 2 +15;
		GrupSoldados.members[2].y = 30;
		
		GrupSoldados.members[3].x = FlxG.width - GrupSoldados.members[3].width;
		GrupSoldados.members[3].y = 30;
		GrupSoldados.members[3].angle = 40;
		
		platadorma = new Plataforma(180,1,0,65);
		GrupPlataforma.add(platadorma);
		
		platadorma = new Plataforma(180, 3, FlxG.width - platadorma.width, 65);
		GrupPlataforma.add(platadorma);
		
		
		GrupDeGrupEnemigo.add(GrupSoldados);
		
		add(GrupPlataforma);
		add(GrupDeGrupEnemigo);
		
		Reg.GrupbalaSoldado = new FlxTypedGroup<BalaSoldado>();
		add(Reg.GrupbalaSoldado);
		Reg.GrupBalaJugador = new FlxTypedGroup<Bala>();
		add(Reg.GrupBalaJugador);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (Reg.entidadesSoldado <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			add(playerYendose);
			entrar = false;
		}
		//VERIFICADOR DE COLICIONES
		FlxG.overlap(Reg.GrupbalaSoldado, player, PlayerOverlap);
		FlxG.overlap(Reg.GrupBalaJugador, Reg.GrupbalaSoldado, balasOverlap);
		FlxG.overlap(Reg.GrupBalaJugador, GrupSoldados, soldadoOverlap);
		FlxG.overlap(Reg.GrupBalaJugador, GrupPlataforma, BalaJPlataformaOverlap);
		FlxG.overlap(Reg.GrupbalaSoldado, GrupPlataforma, BalaSPlataformaOverlap);
		if (Reg.entidadesSoldado <= 0 && entrar)
		{
			playerYendose = new PlayerYendoseXD(Reg.playerPosX+player.width, Reg.playerPosY+player.height/2);
			add(playerYendose);
			entrar = false;
		}
	}
	public function BalaSPlataformaOverlap(balaSoldado:Bala, plataforma:Plataforma)
	{
		balaSoldado.kill();
	}
	public function BalaJPlataformaOverlap(balaJugador:Bala, plataforma:Plataforma)
	{
		balaJugador.kill();
		balaJugador.getEfecto().kill();
	}
	public function PlayerOverlap(balaSoldado:BalaSoldado, p:Player)
	{
		balaSoldado.kill();
		p.kill();
		if (entrar)
		{
			FlxG.switchState( new GameOver());
		}
	}
	public function balasOverlap(balaJugaodr:Bala, balaSoldado:BalaSoldado)
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +5;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		balaJugaodr.kill();
		balaJugaodr.getEfecto().kill();
		balaSoldado.kill();
	}
	public function soldadoOverlap(balaJugador:Bala, soldado:Soldados)
	{
		Puntaje.destroy();
		Reg.puntaje = Reg.puntaje +20;
		Puntaje = new FlxText(0, 0, 0, "Puntaje:" + Reg.puntaje, 24);
		add(Puntaje);
		soldado.kill();
		Reg.entidadesSoldado--;
	}
}