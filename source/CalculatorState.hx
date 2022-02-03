package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxSave;

using Math;

class CalculatorState extends FlxState
{
	public var modes:Array<String> = ['Standard'];
	public var curMode = 0;

	public var operation:String = "";

	override public function create()
	{
		loadSave();

		super.create();
	}

	function makeNumPad():Void
	{
		var zeroButton = new FlxButton(50, FlxG.height / 2, '0', function()
		{
			buttonPressed('0');
		});
		add(zeroButton);

		var eightButton = new FlxButton(50, FlxG.height / 2, '0', function()
		{
			buttonPressed('8');
		});
		add(eightButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function autoSave()
	{
		var save:FlxSave = new FlxSave();
		save.bind('autosave');

		save.data.mode = curMode;

		save.flush();
	}

	function loadSave():Void
	{
		var save:FlxSave = new FlxSave();
		save.bind('autosave');

		if (save.data.mode != null)
		{
			curMode = save.data.mode;
		}
	}

	function buttonPressed(name:String):Void
	{
		switch (name)
		{
			case '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9':
				operation += name;
		}

		trace(operation);
	}
}
