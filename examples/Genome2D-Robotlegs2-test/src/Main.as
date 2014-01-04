package
{
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GConfig;
	import com.genome2d.core.GNodeFactory;
	import com.genome2d.core.Genome2D;
	import com.netiquette.robotGenome.view.MainView;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.genome2DViewMap.G2DViewMapExtension;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	public class Main extends Sprite
	{
		private var _genome2D:Genome2D;
		private var _genome2DContext:IContext;
		
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
		}
		
		
		protected function handleAddedToStage(event:Event):void
		{
			stage.align = StageAlign.TOP_LEFT;
			
			removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
			
			_genome2D = Genome2D.getInstance();
			_genome2D.onInitialized.addOnce(handleGenomeInit);
			
			var config:GConfig = new GConfig(new Rectangle(0,0,stage.fullScreenWidth, stage.fullScreenHeight));
			_genome2D.init(stage, config);
		}
		
		
		private function handleGenomeInit():void
		{	
			_genome2DContext = new Context()
			_genome2DContext.install(MVCSBundle, G2DViewMapExtension, SignalCommandMapExtension)
			_genome2DContext.configure(MainConfig, _genome2D) 
			_genome2DContext.configure(new ContextView( this ));

			var mainView:MainView = GNodeFactory.createNodeWithComponent(MainView) as MainView;
			mainView.node.addComponent(GSprite);
			_genome2D.root.addChild(mainView.node);

	
		}
		

	}
}