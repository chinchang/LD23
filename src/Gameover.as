package  
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Gameover extends World 
	{		
		public function Gameover() 
		{				
			addGraphic(new Image(Globals.IMG_GAMEOVER_BG), 1);
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.X)) {
				Globals.reset();
				FP.world = new TestWorld;
			}
		}
	}

}