package classes
{
	import mx.collections.ArrayCollection;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.events.CollectionEvent;
	
	public class BadList extends VBox
	{
		private var _dataProvider:ArrayCollection;

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
			value.addEventListener(CollectionEvent.COLLECTION_CHANGE, dataChangeHandler);
		}
		
		private function dataChangeHandler(event:CollectionEvent):void
		{
			removeAllChildren();
			for each (var i:Number in _dataProvider) 
			{
				var l:Label = new Label();
				l.text = i.toString();
				addChild(l);
			}
		}
		
		public function BadList()
		{
			super();
		}
	}
}