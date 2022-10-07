package wren;


@:include('linc_wren.h')

@:native("WrenHandle")
extern class Wren_Handle {}
typedef WrenHandle = cpp.Pointer<Wren_Handle>;
