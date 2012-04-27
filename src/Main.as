package  
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author kushagra gour a.k.a. chin chang
	 */
	public class Main extends Engine 
	{
		
		public function Main() 
		{
			super(200, 200, 60, false);
		}
		
		override public function init():void 
		{
			FP.screen.scale = 2;
			FP.screen.color = 0xff00000;
			FP.world = new Menu;
			//FP.console.enable();
			super.init();
		}		
	}

}