//------------------------------------------------------------------------------
//  Copyright (c) 2014 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.genome2DViewMap.api
{
	import com.genome2d.core.GNode;
	

	public interface IG2DViewMap
	{
		function addG2DView($gNode:GNode):void;
		function removeG2DView($gNode:GNode):void;
	}
}
