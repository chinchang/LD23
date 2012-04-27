package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Collectable1 extends Entity 
	{
		private var _sfx_collect:Sfx = new Sfx(Globals.SFX_COLLECT1);
		private var _local_timer:Number;
		private var _lifetime:Number;
		
		public function Collectable1() 
		{
			super(0, 0, new Image(Globals.IMG_COLLECTABLE1));
			this.setHitbox(8, 8);
			_lifetime = 4;
			_local_timer = 0;
			//Image(this.graphic).alpha = 1;
		}
		
		override public function update():void 
		{
			var e:Player;
			if (e = collide('player', x, y) as Player) {
				_sfx_collect.play();
				Globals.SCORE += 1000;
				var up:Scoreup = new Scoreup('+1', x, y);
				e.damage(1);
				world.add(up);
				world.remove(this);
			}
			
			if (_local_timer > _lifetime) {
				var img:Image = Image(this.graphic);
				img.alpha -= FP.elapsed;
				if (img.alpha <= 0)
					world.remove(this);
			}
			
			_local_timer += FP.elapsed;
			super.update();
		}
	}

}