package  {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * Parents beneath the horse costume.
	 */
	public class Parent_Cavalry extends Entity {
		
		public function Parent_Cavalry(x:Number) {
			super(x, Global.groundY - FP.getBitmap(Global.GRAPHIC_PARENT_CAVALRY).height, new Image(Global.GRAPHIC_PARENT_CAVALRY));
		}
		
		override public function update():void {
			super.update();
			x += Global.rate * 2;
			
			if (x > FP.width + 32) {
				FP.world.remove(this);
			}
		}
	}
}