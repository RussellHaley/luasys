#LuaSys

LuaSys is a portable Lua library providing access to system and 
networking functions, written by Nodir Temirkhodjaev.

Luasys is an abstraction from platform specific libraries such as epoll
and kqueue that gives lua developers a consistent set of asynchronous 
tools across multiple platforms.

###Build Requirements

c toolchain (gcc or clang, make)

###Requirements

Lua5.3


##Tested Against

Lua5.3 
	x64
		FreeBSD 10.3-Release
		BBQ GNU/Linux (Arch) - Apr 14 19:19:32
	Arm
		Debian GNU/Linux 8.4 (planned)
		FreeBSD 11-Current (planned)
		

Rockspec soon come.

###Libraries:
- Event Queue: Builds on kqueue in FreeBSD and epoll in Gnu/Linux. 
	add_dirwatch - watch a directory for changes
	add_socket - Asynchrounous socket handling
	add_signal - Listen for Posix Signals
(too be continued)



###Build instructions:
	
 *Posix type systems:*

    git clone https://github.com/RussellHaley/luasys.git
    cd luasys/src
    sudo make install
