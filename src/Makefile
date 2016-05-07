
#LUA= /usr/home/russellh/Git/lua/src
LUA= /usr/home/russellh/Git/lua

T= sys.so
A= libluasys.a

COPT= -O2 -fPIC -DNDEBUG
#CWARNS= -W -Wall -Wextra \
	-Waggregate-return \
	-Wbad-function-cast \
	-Wcast-align \
	-Wcast-qual \
	-Wdeclaration-after-statement \
	-Wdisabled-optimization \
	-Wmissing-prototypes \
	-Wnested-externs \
	-Wpointer-arith \
	-Wshadow \
	-Wsign-compare \
	-Wstrict-prototypes \
	-Wundef \
	-Wwrite-strings \
	-Wpadded \
	-Wunreachable-code \
	-Wpedantic 

CFLAGS= $(COPT) $(CWARNS) $(MYCFLAGS) -I$(LUA)/src
LIBS= -lpthread $(MYLIBS)

MYCFLAGS=
MYLDFLAGS= -shared -Bdynamic
MYLIBS=

CC= cc
MAKE_DLL= $(CC) $(MYLDFLAGS) -o
AR= ar rcu
RANLIB= ranlib
RM= rm -f
STRIP= strip

OBJS= luasys.o sock/sys_sock.o
LDOBJS= $(OBJS)

UNAME_S= $(shell uname -s)

ifeq ($(OS),Windows_NT)
  ifneq (,$(findstring MINGW,$(UNAME_S)))
    T= sys.dll
    A= sys.lib

    MYCFLAGS= -DLUA_BUILD_AS_DLL
    MYLDFLAGS= -s -shared
    LIBS= $(LUA)/src/lua51.dll -lkernel32 -luser32 -lwinmm -lshell32 -ladvapi32 -lws2_32 -lpsapi
    OBJS+= isa/isapi/isapi_dll.o
  endif
else 
  ifeq ($(UNAME_S),Linux)
    MYCFLAGS="-DUSE_EPOLL -DUSE_EVENTFD" 
    MYLIBS="-lrt"
  endif
  
  ifeq ($(UNAME_S),FreeBSD)
    MYCFLAGS="-DUSE_KQUEUE"
  endif
  
  ifeq ($(UNAME_S),Darwin)
    MYCFLAGS="-DUSE_KQUEUE" STRIP="echo strip"
    MYLDFLAGS="-bundle -undefined dynamic_lookup /usr/lib/bundle1.o"
  endif
   
#   UNAME_P := $(shell uname -p)
#     ifeq ($(UNAME_P),x86_64)
#         CCFLAGS += -D AMD64
#     endif
#     ifneq ($(filter %86,$(UNAME_P)),)
#         CCFLAGS += -D IA32
#     endif
#     ifneq ($(filter arm%,$(UNAME_P)),)
#         CCFLAGS += -D ARM
#     endif
endif


default: 
	@$(MAKE) all 
	@echo "Run 'make install' to copy $(T) to a known path."
	awesome 
	
all:	$(T)
	@echo "**Build Complete.**"
	
a:	$(A)

$(T): $(OBJS)
	$(MAKE_DLL) $@ $(LDOBJS) $(LIBS)
	$(STRIP) $@

$(A): $(OBJS)
	$(AR) $@ $?
	$(RANLIB) $@

generic:
	$(MAKE) all MYCFLAGS=

clean:
	$(RM) $(T) $(A) $(LDOBJS)

install:
	@$(MAKE) all
	
ifeq ($(UNAME_S),FreeBSD)
	cp $(T) /usr/local/lib/lua/5.3/
	@echo "**Library Installed.**"
endif
ifeq ($(UNAME_S),Linux)
	cp $(T) /usr/local/lib/lua-5.3/
	@echo "**Library Installed.**"
endif
	@$(MAKE) awesome
awesome:
	@echo "************************************************"	
	@echo "All done! Enjoy your fresh cup of awesome."
	@echo "************************************************"

remove:
	rm /usr/local/lib/lua/5.3/$(T)

.PHONY: all $(PLATS) default a clean


luasys.o: luasys.c sys_comm.c sys_date.c sys_env.c sys_evq.c sys_file.c \
 sys_fs.c sys_log.c sys_proc.c sys_rand.c sys_unix.c common.h \
 thread/sys_thread.c thread/thread_dpool.c \
 thread/thread_pipe.c thread/thread_sync.c \
 mem/sys_mem.c mem/membuf.c \
 event/evq.c event/epoll.c event/kqueue.c event/poll.c \
 event/select.c event/signal.c event/timeout.c \
 event/evq.h event/epoll.h event/kqueue.h event/poll.h \
 event/select.h event/timeout.h \
 win32/sys_win32.c win32/win32_reg.c win32/win32_svc.c win32/win32_utf8.c
sock/sys_sock.o: sock/sys_sock.c sock/sock_addr.c common.h
isa/isapi/isapi_dll.o: isa/isapi/isapi_dll.c isa/isapi/isapi_ecb.c common.h
