package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Planet extends Entity 
	{
		private var _radius:int;
		private var _life:int;
		private var _local_timer:Number;
		private var _shake_duration:Number;
		private var _shake_amp:int;
		private var _respawn_time:Number;
		private var _state:String;
		private var _org_x:int;
		private var _org_y:int;
			
		/**
		 * Constructor
		 * @param	r	Radius of the planet
		 */
		public function Planet(r:int){
			super(0, 0, new Image(Globals.IMG_PLANET));
			Image(this.graphic).centerOO();
			this.type = 'planet';
			_radius = r;
			_life = 2;
			_shake_duration = 1.5;
			_respawn_time = 2;
			_local_timer = 0;
			setHitbox(r << 1, r << 1);
			centerOrigin();
			_org_x = x;
			_org_y = y;
		}
		
		public function get radius():int {
			return _radius;
		}
		
		override public function update():void 
		{
			_local_timer += FP.elapsed;
			
			// collision check with player
			var player:Player = world.getInstance('player') as Player;
			if (FP.distance(player.x, player.y, x, y) < _radius) {
				player.target = this;
			}
			if (_state == 'SHAKE') shake();
			
			super.update();
		}
		
		public function damage(_amount:int):void {
			_life += _amount;
			//_state = 'SHAKE';
			//_shake_amp = Math.abs(_amount) + 15;
		}
		
		public function shake():void {
			if (_shake_amp > 0) {
				this.x = _org_x + Math.sin(_local_timer * 80) * _shake_amp;
				this.y = _org_y + Math.sin(_local_timer * 80) * _shake_amp;
				_shake_amp -= 1 * FP.elapsed;
			}
		}
	}

}