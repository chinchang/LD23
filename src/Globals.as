package  
{
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Globals 
	{
		[Embed(source = "../assets/player.png")] public static const SPR_PLAYER:Class;
		[Embed(source = "../assets/game_bg.png")] public static const IMG_GAME_BG:Class;
		[Embed(source = "../assets/gameover_bg.png")] public static const IMG_GAMEOVER_BG:Class;
		[Embed(source = "../assets/menu_bg.png")] public static const IMG_MENU_BG:Class;
		[Embed(source = "../assets/planet.png")] public static const IMG_PLANET:Class;
		[Embed(source = "../assets/collectable1.png")] public static const IMG_COLLECTABLE1:Class;
		[Embed(source = "../assets/enemy1.png")] public static const IMG_ENEMY1:Class;
		[Embed(source = "../assets/missile.png")] public static const IMG_MISSILE:Class;
		[Embed(source = "../assets/explosion1.png")] public static const SPR_EXPLOSION1:Class;
		
		[Embed(source = "../assets/jump.mp3")] public static const SFX_JUMP:Class;
		[Embed(source="../assets/transition1.mp3")] public static const SFX_TRANSITION:Class;
		[Embed(source="../assets/collect.mp3")] public static const SFX_COLLECT1:Class;
		
		public static const GRAVITY:int = -900;
		public static var SCORE:int = 0;
		public static var LEVEL:int = 0;
		public static var TIMER:int = 0;
		
		public static const LEVEL_DATA:Array = [
			{num_planets:3, num_enemies:1},
			{num_planets:3, num_enemies:2},
		];
		
		public static const PLANET_DATA:Array = [
			[57, 56, 160, 105, 49, 155],
			[57, 56, 160, 105, 49, 155],
		];
		
		public function Globals() {
			
		}
		
		public static function reset():void {
			SCORE = 0;
			LEVEL = 0;
			TIMER = 0;
		}
		
	}

}