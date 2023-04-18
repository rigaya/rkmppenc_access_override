CC      = gcc
LD      = gcc
CFLAGS  = -O2
LDFLAGS = -shared -fPIC
PROGRAM = rkmppenc_access_override.so
SRCS    = rkmppenc_access_override.c
SRCDIR  = .

OBJS = $(SRCS:%.c=%.c.o)

all: $(PROGRAM)

$(PROGRAM): .depend $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(PROGRAM)

%.c.o: %.c .depend
	$(CC) -c $(CFLAGS) -o $@ $<
	
.depend:
	@rm -f .depend
	@echo 'generate .depend...'
	@$(foreach SRC, $(SRCS:%=$(SRCDIR)/%), $(CC) $(SRC) $(CFLAGS) -g0 -MT $(SRC:$(SRCDIR)/%.c=%.o) -MM >> .depend;)
	
ifneq ($(wildcard .depend),)
include .depend
endif

clean:
	rm -f $(OBJS) $(PROGRAM) .depend

install: all
	install -d $(PREFIX)/lib
	install -m 755 $(PROGRAM) $(PREFIX)/lib

uninstall:
	rm -f $(PREFIX)/lib/$(PROGRAM)
