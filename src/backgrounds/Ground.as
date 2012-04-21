package backgrounds {
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Backdrop;
	import Global;
	
	/**
	 * Repeated ground.
	 */
	public class Ground extends Backdrop {
		
		public function Ground(){
			super(Global.GRAPHIC_GROUND, true, true);
		}
	}
}