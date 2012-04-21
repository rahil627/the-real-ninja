package objects {
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * The boy underneath the costume. Extends Kid.
	 */
	public class Boy extends Kid {
		
		public function Boy(x:Number, runningDirectionIsLeft:Boolean = false) {
			super(x, Global.groundY - FP.getBitmap(Global.GRAPHIC_BOY).height, Global.GRAPHIC_BOY, new Pixelmask(FP.getBitmap(Global.GRAPHIC_BOY)), runningDirectionIsLeft);
		}
	}
}