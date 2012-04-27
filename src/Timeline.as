package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Timeline extends Entity 
	{
		private var _local_timer:Number = 0;
		private var _collectable_interval:int = 2;

		public function Timeline() 
		{
			
		}
		
		private function createCollectable():void {
			var c:Collectable1 = new Collectable1;
			var planets:Array = [];
			world.getType('planet', planets);
			var planet:Planet = FP.choose(planets);
			var distance:int = FP.rand(40) + planet.radius + 10;
			var angle:Number = Math.random() * 2 * Math.PI;
			c.x = planet.x + Math.cos(angle) * distance;
			c.y = planet.y + Math.sin(angle) * distance;
			world.add(c);
			c = null;
		}
		
		override public function update():void 
		{
			Globals.TIMER++;
			_local_timer += FP.elapsed;
			
			if (_local_timer > _collectable_interval) {
				_local_timer = 0;
				createCollectable();
			}
			
			if (Globals.SCORE == 10000 && Globals.LEVEL == 0) {
				Globals.LEVEL++;
				var arr:Array = [];
				var e:Enemy1;
				world.getType('enemy1', arr);
				e = arr[0] as Enemy1;
				world.add(new Enemy1(100, e.angle - 180));
			}
			
			super.update();
		}
	}

}