package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Enemy1 extends Entity 
	{
		private var _radius:int;
		private var _angle:int;
		private var _local_timer:Number;
		private var _attack_interval:Number;
		
		public function Enemy1(_r:int, _a:int = 0){
			super(0, 0, new Image(Globals.IMG_ENEMY1));
			Image(graphic).centerOO();
			setHitbox(22, 22);
			centerOrigin();
			type = 'enemy1';
			_angle = _a; 
			_radius = _r;
			_local_timer = 0;
			_attack_interval = 3;
		}
		
		public function get angle():Number {
			return _angle;
		}
		
		override public function update():void 
		{
			_local_timer += FP.elapsed;
			_angle += 90 * FP.elapsed;
			
			Image(graphic).angle = _angle - 90;
			this.x = int(FP.halfWidth + _radius * Math.cos(_angle * -FP.RAD));
			this.y = int(FP.halfHeight - _radius* Math.sin(_angle * -FP.RAD));
		
			if (_local_timer >= _attack_interval) {
				_local_timer = 0;
				attack();
				_attack_interval = 1 + Math.random() * 3;
			}
			
			if (collide('player', x, y)) {
				TestWorld(world).gameOver();
			}
			super.update();
		}
		
		private function attack():void {
			var missile:Missile = new Missile(x, y);
			world.add(missile);
		}
		
	}

}