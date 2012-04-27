package  
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class TestWorld extends World 
	{
		public var player:Player;
		public var score_txt:Text;
		public var life_txt:Text;
		private var _score_tween:int = 0;
		
		public function TestWorld() 
		{			
			var planet:Planet;
			for (var i:int = Globals.PLANET_DATA[Globals.LEVEL].length; i--; ) {
				planet = new Planet(12);
				planet.y = Globals.PLANET_DATA[Globals.LEVEL][i--];
				planet.x = Globals.PLANET_DATA[Globals.LEVEL][i];
				add(planet);
			}
			planet = null;
			
			player = new Player();
			add(player);
			addGraphic(new Image(Globals.IMG_GAME_BG), 1);
			
			score_txt = new Text(Globals.SCORE + '', 5, 2);
			//score_txt.size = 8;
			addGraphic(score_txt);
			
			life_txt = new Text('s', 180, 2);
			life_txt.align = 'right';
			addGraphic(life_txt);
			
			add(new Enemy1(100));
			
			add(new Timeline);
		}
		
		override public function update():void 
		{
			_score_tween = FP.approach(_score_tween, Globals.SCORE, 60);
			score_txt.text = _score_tween + '';
			super.update();
		}
		
		public function gameOver():void {
			FP.world = new Gameover;
		}
	}

}