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
	public class Menu extends World 
	{		
		public function Menu() 
		{				
			addGraphic(new Image(Globals.IMG_MENU_BG), 1);
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