package com.netiquette.robotGenome.view
{
	import com.genome2d.signals.GMouseSignal;
	import com.netiquette.robotGenome.signals.Signal_ButtonClicked;
	import com.robotlegs.bender.extensions.genome2DViewMap.impl.G2DMediator;
	
	public class MainMediator extends G2DMediator
	{
		[Inject]
		public var view:MainView;
		
		[Inject]
		public var buttonClicked:Signal_ButtonClicked;
		
		
		public function MainMediator()
		{
			super();
		}
		
		
		[PostConstruct]
		public function onRegister():void
		{
			// this adds a listener to the button in the view component
			view.button.node.onMouseClick.add(handleButtonClicked);
			
			// this listens to the injected signal. 
			// (This would be done in other mediators in a real senario).
			buttonClicked.add(handleButtonClickedInMainView);
		}
		
		
		
		private function handleButtonClicked($signal:GMouseSignal):void
		{
			buttonClicked.dispatch('Start button pressed');
		}		
		
		
		private function handleButtonClickedInMainView($string:String):void
		{
			trace('start button inter-mediator communication')
		}
		
	}
}