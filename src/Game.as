package {
	import backgrounds.Background;
	import backgrounds.Ground;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import objects.BossKnight;
	import objects.Cavalry;
	import objects.Chandelier;
	import objects.Cop;
	import objects.Floor;
	import objects.JackOLantern;
	import objects.Knight;
	import objects.Ninja;
	import objects.Parent;
	import objects.Player;
	import objects.Samurai;
	import objects.SliceHandler;
	import objects.UndressAnimationHandler;
	import objects.Zombie;
	import rahil.Rahil;
	
	/**
	 * The game world.
	 */
	public class Game extends World {
		public var timer:int = 0; //world timer!
		public static var isPaused:Boolean = false;
		private const frameRate:int = FP.assignedFrameRate; //one second
		private var waitTimer:int = 1000000;
		
		private var spawnJackOLantern:Boolean = false;
		private var spawnParent:Boolean = false;
		private var spawnNinja:Boolean = false;
		private var spawnSamurai:Boolean = false;
		private var spawnZombie:Boolean = false;
		private var spawnChandelier:Boolean = false;
		private var spawnKnight:Boolean = false;
		private var spawnCavalry:Boolean = false;
		
		public var bossKnightDied:Boolean = false;
		private var addingEnemies:Boolean = true;
		private var addCopTimer:int = 1000;
		
		public function Game() {
			super();
			
			FP.screen.color = 4280295456;
			Global.initialize();
			Global.game = this;
			Global.SFX_MUSIC.loop();
		}
		
		override public function begin():void {
			super.begin();
			//TODO: fade transition to game
			add(new Entity(0, 0, Global.background = new Background()));
			add(new Entity(0, 0, Global.ground = new Ground()));
			add(new Floor(0, FP.height - 16));
			add(Global.player = new Player(50));
			add(Global.sliceHandler = new SliceHandler());
			add(Global.undressAnimationHandler = new UndressAnimationHandler());
		}
		
		override public function update():void {
			if (Input.pressed(Key.P))
				isPaused = !isPaused;
			
			if (isPaused)
				return;
			
			waitTimer++;
			if (waitTimer == frameRate * 3) {
				super.restart();
			}
				
			super.update();
			
			timer++;
			
			Global.ground.x -= Global.rate;
			Global.background.x -= Global.rate;
			
			if (addingEnemies)
				addEnemies();
				
			if (bossKnightDied) {
				//undress all enemies on the stage, stop spawning enemies, then add a cop after 5 seconds
				undressAllEnemies();
				addingEnemies = false;
				addCopTimer = 0; //add a cop after some time
				Global.SFX_MUSIC.stop();
				bossKnightDied = false;
			}
			
			addCopTimer++;
			if (addCopTimer == frameRate * 5)
				this.add(new Cop());
		}
		
		private function addEnemies():void {
			//level one
			switch (timer) {
				case frameRate * 5: this.add(new JackOLantern()); spawnJackOLantern = true; break;
				case frameRate * 15: this.add(new Parent()); spawnParent = true; break;
				case frameRate * 25: this.add(new Ninja()); spawnNinja = true;  break;
				case frameRate * 50: this.add(new Samurai()); spawnSamurai = true;  break;
				case frameRate * 100: this.add(new Zombie()); spawnZombie = true;  break;
				//ROBOT BOSS! //TODO: make a robot!
				//medieval level. set background to medieval background? reset timer and begin medieval level?
				case frameRate * 150: this.add(new Knight()); spawnKnight = spawnChandelier = true; spawnNinja = spawnSamurai = spawnZombie = false; break;
				case frameRate * 200: this.add(new Cavalry()); spawnCavalry = true;  break;
				case frameRate * 250: this.add(new BossKnight()); spawnJackOLantern = spawnParent = false; break;
				default: /*do nothing*/ break;
			}
			
			//generate the level
			//var randomNumber:int = Rahil.randomNumber(0, 100);
			
			if (timer % 20 == 0) { //to prevent enemy stacking
				if (spawnCavalry && Rahil.randomNumber(0, 100) % 51 == 0) { //1%
					this.add(new Cavalry());
					return;
				}
				else if (spawnKnight && Rahil.randomNumber(0, 100) % 50 == 0) { //2%
					this.add(new Knight());
					return;
				}
				else if (spawnZombie && Rahil.randomNumber(0, 100) % 20 == 0) { //5%
					this.add(new Zombie());
					return;
				}
				else if (spawnSamurai && Rahil.randomNumber(0, 100) % 20 == 0) { //5%
					this.add(new Samurai());
					return;
				}
				else if (spawnNinja && Rahil.randomNumber(0, 100) % 20 == 0) { //5%
					this.add(new Ninja());
					return;
				}
			}			
				
			//add Jack o' Lanterns and Parents
			if (timer % (frameRate * 2) == 0) {
				var randomNumber:int = Rahil.randomNumber(1, 5);
				if (spawnJackOLantern && (randomNumber == 1 || randomNumber == 2))
					this.add(new JackOLantern());
				else if (spawnParent && randomNumber == 3) 
					this.add(new Parent());
			}
			
			//add when Knights begin to appear
			if (spawnChandelier && timer % (frameRate) == 0) { //should divide time by global rate, then floor it
				this.add(new Chandelier());
			}
		}
		
		override public function restart():void {
			//wait after dying, but let the world keep running
			waitTimer = 0;
		}
		
		override public function end():void {
			super.end();
			this.removeAll();
			
			//special case for the boss knight
			if (timer > frameRate * 250) {
				timer = frameRate * 240;
				return;
			}
			
			//when the player dies, it restarts the game world, and starts the player 5 seconds back in time
			timer = timer - frameRate * 10 + frameRate * 3; //TODO: should create checkpoints instead, since knights move slowly, especially for the boss knight
		}
		
		public static function pause():void {
			isPaused = true;
		}
		
		public static function unpause():void {
			FP.screen.scale = 3;
			FP.resetCamera();
			isPaused = false;
		}
		
		private function undressAllEnemies():void { //TODO: undressAllEnemies()
			//create an enemy class?
			//make undress public?
			//override remove to add undress?
			
			//meh, a quick solution
			var array:Array = new Array();
			getAll(array);
			for each (var entity:* in array) {
				if (entity is Knight || entity is Cavalry)
					this.remove(entity);
			}
		}
	}
}