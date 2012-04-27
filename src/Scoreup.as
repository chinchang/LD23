package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Scoreup extends Entity 
	{
		private var _text:Text;
		
		public function Scoreup(_t:String, _x:int ,_y:int) {
			_text = new Text(_t, _x, _y);
			//_text.size = 10;
			graphic = _text;
		}
		
		public function text(t:String):void {
			_text.text = t;
		}
		
		override public function update():void 
		{
			y -= 40 * FP.elapsed;
			_text.alpha -= FP.elapsed;
			if (_text.alpha <= 0)
				world.remove(this);
			super.update();
		}
		
	}

}