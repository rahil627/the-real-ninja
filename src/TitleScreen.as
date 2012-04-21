package {
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import objects.Player;
	import objects.SliceHandler;
	
	public class TitleScreen extends World {
		
		public function TitleScreen():void {
			super();
			
			FP.screen.color = 0xFFFFFF; //default 4280295456
			
			var title:Text = new Text("The Real Ninja");
			title.color = 0;
			title.centerOO();
			this.addGraphic(title, 0, FP.screen.width / 2, FP.screen.height / 4); //shortcut World.addGraphic creates a new Entity and calls entity.addGraphic
			
			var author:Text = new Text("by Rahil Patel");
			author.color = 0;
			author.size = 8
			author.centerOO();
			this.addGraphic(author, 0, FP.screen.width * 3 / 4, FP.screen.height /4 + title.height);
			
			var start:Text = new Text("press space to continue");
			start.color = 0;
			start.centerOO();
			this.addGraphic(start, 0, FP.screen.width / 2, FP.screen.height * 3 / 4);
			
			var floor:Entity = new Entity(0, 0);
			//floor.setHitbox(50, 50, 50, 50); //WTF?
			floor.setHitboxTo(new Rectangle((FP.screen.width / 2) - start.width / 2, (FP.screen.height * 3 / 4) - start.height / 2, start.width, start.height));
			floor.type = "floor";
			this.add(floor);
			
			this.add(new Player(100));
			this.add(new SliceHandler());
		}
		
		override public function update():void {
			super.update();
			if (Input.check(Key.SPACE)) {
				FP.world = new ControlsScreen();
			}
		}
	}
}