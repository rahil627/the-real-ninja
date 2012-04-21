package objects {
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * The girl underneath the costume. Extends Kid.
	 */
	public class Girl extends Kid {
		
		public function Girl(x:Number) {
			super(x, Global.groundY - FP.getBitmap(Global.GRAPHIC_GIRL).height, Global.GRAPHIC_GIRL, new Pixelmask(FP.getBitmap(Global.GRAPHIC_GIRL)));
		}
	}
}