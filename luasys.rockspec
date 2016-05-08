 package = "luasys"
 version = "1.8.2"
 source = {
    url = "http://www.github.com/rhaley/luasys"
 }
 description = {
    summary = "Tools for asynchronous processing",
    detailed = [[
       Luasys is a set of asynchronous tools and threading models created from an abstraction from platform specific libraries. Luasys gives lua developers a consistent set of high performance tools across multiple platforms including FreeBSD, GNU/Linux, Windows (mingw) and Minix3.
    ]],
    homepage = "http://www.github.com/rhaley/luasys", 
    license = "MIT/X11" 
 }
 dependencies = {
    "lua ~> 5.3"    
 }
 build = {
    type="make"    
 }