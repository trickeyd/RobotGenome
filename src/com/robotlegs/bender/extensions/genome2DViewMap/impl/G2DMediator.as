//------------------------------------------------------------------------------
//  Copyright (c) 2014 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package com.robotlegs.bender.extensions.genome2DViewMap.impl 
{
	import com.genome2d.components.GComponent;
	
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;

	public class G2DMediator implements IMediator
	{
		private var _viewComponent:GComponent;

		public function G2DMediator()
		{
			
		}
		
		
		public function set viewComponent($gComponent:GComponent):void
		{
			_viewComponent = $gComponent;
		}
		
		public function get viewComponent():GComponent
		{
			return _viewComponent;
		}
		
		public function initialize() : void
		{
			
		}

		public function destroy() : void
		{
			_viewComponent = null;
		}
		

	}
}
