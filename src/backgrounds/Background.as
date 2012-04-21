package backgrounds {
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Backdrop;
	import Global;
	
	/**
	 * Repeated background.
	 */
	public class Background extends Backdrop {
		public function Background(){
			super(Global.GRAPHIC_BACKGROUND, true, true);
		}
	}
}