package;

#if android
import android.os.Environment;
import sys.FileSystem;
#end
import openfl.Lib;

class Paths {
	public static function gamePath() {
		#if android
		var path:String = Environment.getExternalStorageDirectory() + '/' + '.' + Lib.application.meta.get('file') + '/' + sys.io.File.getContent(Environment.getExternalStorageDirectory() + '/' + '.' + Lib.application.meta.get('file') + '/current.txt') + '/';
		if (!FileSystem.exists(path)) {
			FileSystem.createDirectory(path);
		}
        return path;
        #else
        return sys.io.File.getContent('current.txt') + '/';
        #end
	}
}
