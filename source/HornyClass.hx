package;

class HornyClass {
	
	public var script:HornyScript;

    public dynamic function new(path:String, args:Array<Dynamic>) {
        script = new HornyScript(path);
		script.setVariable("class", this);
                script.run();
		script.executeFunc("create", args);
    }

    public function set(name:String, val:Dynamic) {
        script.setVariable(name, val);
    }

    public function get(name:String) {
        return script.getVariable(name);
    }
}
