package objects {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * Handles the undress animation.
	 */
	public class UndressAnimationHandler extends Entity {
		
		public function UndressAnimationHandler() {
			//super() not needed
		}
		
		public function playHorizontalCutAnimation(x:Number, y:Number, graphic:Class):void { //TODO: should take in a bitmap
			var image:Image = new Image(graphic); //used to get width/height
			var mask:Pixelmask = new Pixelmask(FP.getBitmap(graphic)); //TODO: should use mask to get the actual width and height of the sprite
			
			//horizontal
			var topGraphic:Image = new Image(graphic, new Rectangle(0, /*image.height - mask.height*/0, image.width, /*mask.height*/image.height / 2));
			var topEntity:UndressAnimationEntity = new UndressAnimationEntity(x, y, topGraphic, "left");
			this.world.add(topEntity);
			
			var bottomGraphic:Image = new Image(graphic, new Rectangle(0, image.height / 2, image.width, image.height / 2));
			var bottomEntity:UndressAnimationEntity = new UndressAnimationEntity(x, y + image.height / 2, bottomGraphic, "right");
			this.world.add(bottomEntity);
		}
		
		public function playHorizontalCutAnimationBitmap(x:Number, y:Number, graphic:BitmapData):void { //no function overloading!
			var image:Image = new Image(graphic); //used to get width/height
			var mask:Pixelmask = new Pixelmask(graphic); //TODO: should use mask to get the actual width and height of the sprite
			
			//horizontal
			var topGraphic:Image = new Image(graphic, new Rectangle(0, /*image.height - mask.height*/0, image.width, /*mask.height*/image.height / 2));
			var topEntity:UndressAnimationEntity = new UndressAnimationEntity(x, y, topGraphic, "left");
			this.world.add(topEntity);
			
			var bottomGraphic:Image = new Image(graphic, new Rectangle(0, image.height / 2, image.width, image.height / 2));
			var bottomEntity:UndressAnimationEntity = new UndressAnimationEntity(x, y + image.height / 2, bottomGraphic, "right");
			this.world.add(bottomEntity);
		}
		
		public function playVerticalCutAnimation(x:Number, y:Number, graphic:Class):void { //TODO: see above
			var image:Image = new Image(graphic);
			var mask:Pixelmask = new Pixelmask(FP.getBitmap(graphic));
			
			//vertical
			var leftGraphic:Image = new Image(graphic, new Rectangle(0, 0, image.width / 2, image.height));
			var leftEntity:UndressAnimationEntity = new UndressAnimationEntity(x, y, leftGraphic, "up");
			this.world.add(leftEntity);
		
			var rightGraphic:Image = new Image(graphic, new Rectangle(image.width / 2, 0, image.width / 2, image.height));
			var rightEntity:UndressAnimationEntity = new UndressAnimationEntity(x + image.width / 2, y, rightGraphic, "down");
			this.world.add(rightEntity);
		}
	}
}