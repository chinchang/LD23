package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Explosion1 extends Entity 
	{		
		private var _sprite_map:Spritemap;
		
		public function Explosion1(_x:int, _y:int) 
		{
			_sprite_map = new Spritemap(Globals.SPR_EXPLOSION1, 12, 12);
			super(_x, _y, _sprite_map);
			collidable = false;
			_sprite_map.add('exp', [0, 1, 2, 3], 8, false);
			_sprite_map.centerOO();
			this.graphic = _sprite_map;
			_sprite_map.play('exp');
		}
		
		override public function update():void 
		{			
			_sprite_map.alpha -= FP.elapsed;
			if (_sprite_map.alpha < 0)
				world.remove(this);
			super.update();
		}
	}
}