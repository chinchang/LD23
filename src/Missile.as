package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Missile extends Entity 
	{
		private var _speed:int;
		private var _angle:Number = 0;
		private var _life:int;
		
		public function Missile(_x:int, _y:int) {
			var img:Image = new Image(Globals.IMG_MISSILE);
			super(_x, _y, img);			
			img.centerOO();
			setHitbox(5, 3);
			centerOrigin();
			_speed = 85;
		}
		
		override public function added():void 
		{
			var player:Player = world.getInstance('player') as Player;
			if (player) {
				_angle = FP.angle(x, y, player.x, player.y) * -FP.RAD;
			}
			Image(graphic).angle = _angle * -FP.DEG;
			super.added();
		}
		
		override public function update():void 
		{
			this.x += _speed * Math.cos(_angle) * FP.elapsed;
			this.y -= _speed * Math.sin(_angle) * FP.elapsed;
			//moveBy(_speed * Math.cos(_angle) * FP.elapsed, _speed * Math.sin(_angle) * FP.elapsed, 'planet');
			
			var e:Player;
			if (e = this.collide('player', x, y) as Player) {
				e.damage( -1);
				world.add(new Explosion1(x, y));
				world.remove(this);
			}
			super.update();
		}
		
		override public function moveCollideX(e:Entity):Boolean 
		{
			FP.console.log(e);
			return super.moveCollideX(e);
		}
		
	}

}