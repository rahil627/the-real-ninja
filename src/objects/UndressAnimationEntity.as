package objects {
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	/**
	 * An entity that contains a linear motion tween.
	 */
	public class UndressAnimationEntity extends Entity {
		
		private var tween:LinearMotion
		
		public function UndressAnimationEntity(x:Number, y:Number, graphic:Graphic, direction:String) {
			super(x, y, graphic);
			tween = new LinearMotion();
			
			//this.x -= Global.rate;

			switch (direction) {
				case "left": tween.setMotion(x, y, x - 50, y, 30); break;
				case "right": tween.setMotion(x, y, x + 50, y, 60); break;
				case "up": tween.setMotion(x, y, x, y - 50, 60); break;
				case "down": tween.setMotion(x, y, x, y + 50, 60); break;
				default: trace("invalid direction"); break;
			}
			
			this.addTween(tween, true)
		}
		
		override public function update():void {
			super.update();
			
			this.x = tween.x
			this.y = tween.y;
			
			if (!tween.active)
				this.world.remove(this);
		}
	}
}