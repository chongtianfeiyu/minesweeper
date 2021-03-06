package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	[SWF(width="760", height="570", frameRate="60")]
	public class SpaceMines extends Sprite
	{
		private var starlingGame:Starling;
		public function SpaceMines()
		{
			//simulate iPhone Retina - needed for consistent feathers style
			DeviceCapabilities.dpi = 326; 
			
			var iOS:Boolean = Capabilities.manufacturer.indexOf("iOS") != -1;
			Starling.multitouchEnabled = true;  // useful on mobile devices
			Starling.handleLostContext = !iOS;  // not necessary on iOS. Saves a lot of memory!
			
			
			// These settings are recommended to avoid problems with touch handling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			// Create a Starling instance that will run the "Game" class
			var viewPort:Rectangle = RectangleUtil.fit(
				new Rectangle(0, 0, Game.stageWidth, Game.stageHeight), 
				new Rectangle(0, 0, Game.stageWidth, Game.stageHeight), 
				ScaleMode.SHOW_ALL, 
				false
			);
			
			
			starlingGame = new Starling(Game, stage, viewPort);			
			starlingGame.antiAliasing = 0; 
			starlingGame.showStats = false;
			starlingGame.stage.stageWidth  = Game.stageWidth; 
			starlingGame.stage.stageHeight = Game.stageHeight; 
			
			starlingGame.simulateMultitouch  = false;
			starlingGame.enableErrorChecking = false;
			
			starlingGame.start();		
		}
	}
}