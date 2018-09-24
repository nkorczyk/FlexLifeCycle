package classes
{
	import mx.collections.ArrayCollection;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.events.CollectionEvent;
	
	public class GoodList extends VBox
	{
		private var _dataProvider:ArrayCollection;
		private var _dataProviderChanged:Boolean = false;

		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
			value.addEventListener(CollectionEvent.COLLECTION_CHANGE, dataProviderChangeHandler);
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		private function dataProviderChangeHandler(event:CollectionEvent):void
		{
			_dataProviderChanged = true;
			invalidateProperties();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			if (_dataProviderChanged)
			{
				removeAllChildren();
				for each (var i:Number in _dataProvider) 
				{
					var l:Label = new Label();
					l.text = i.toString();
					addChild(l);
				}
				_dataProviderChanged = false;
			}
		}
		
		public function GoodList()
		{
			super();
		}
	}
}