package objects {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	/**
	 * Captures mouse input and folds the Game World. Didn't seem like it fit in Player.
	 */
	public class SliceHandler extends Entity {
		
		private var lastMouseX:int, lastMouseY:int;
		public var isDrawing:Boolean = false;
		private var SFX_SLICE_ARRAY:Array;
		
		public function SliceHandler(){
			super(0, 0, new Graphiclist(new Graphic()), null);
			this.type = "cut";
		}
		
		override public function update():void {
			super.update();
			
			//remove the line slowly like fruit ninja
			//if (this.graphic is Graphiclist) {
			var graphicList:Graphiclist = this.graphic as Graphiclist;
			
			//if (graphicList.count > 1)
			graphicList.removeAt(0); //perfect!
			//}
			
			if (Input.mousePressed){ //could slice without holding the mouse down
				//set beginning of line
				lastMouseX = Input.mouseX;
				lastMouseY = Input.mouseY;
				
				isDrawing = true;
			}
			
			else if (Input.mouseDown) {
				//continue drawing the line
				var lineSegment:BitmapData = new BitmapData(FP.width, FP.height, true, 0);
				Draw.setTarget(lineSegment);
				Draw.linePlus(lastMouseX, lastMouseY, Input.mouseX, Input.mouseY, 0xffff0000, 1, 1); //TODO: graphic should be thicker, but the mask should be 1 pixel thick
				Draw.resetTarget();
				
				this.addGraphic(new Image(lineSegment));
				
				lastMouseX = Input.mouseX;
				lastMouseY = Input.mouseY;
			}
			
			else if (Input.mouseReleased){
				isDrawing = false;
				
				//add blood dripping from the line
				
				//add random blood around the line
				//for (var i:int = 0; i < 20; i++) { //TODO: should depend on length of the line
				//Draw.rect(beginMouseX + Math.random() * 20, beginMouseY + Math.random() * 20, 1, 1, 0xFF0000, .75, false); //TODO: should use beginning and end of line
				//}
				
				//Draw.resetTarget();
				
				//cut enemies only if the line enters an enemy and exits an enemy vs touches an enemy
			}
			
			//set the mask to the graphic
			var maskBitmapData:BitmapData = new BitmapData(FP.width, FP.height, true, 0) //could move to render function
			graphicList.render(maskBitmapData, new Point(0, 0), new Point(0, 0));
			this.mask = new Pixelmask(maskBitmapData);
		}
	}
}