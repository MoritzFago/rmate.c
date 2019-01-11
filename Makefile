PROGRAM = rmate

SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
RM?=rm -f

INCLUDES = 
CFLAGS = -g -Wall -Wextra -Wno-missing-field-initializers $(INCLUDES)
#LDFLAGS = -L.
#LDLIBS +=

.o : .c
	echo "foo"
	$(CC) $(CFLAGS) -c $< -o $@


$(PROGRAM): version.h $(OBJS)


version.h: version.sh
	sh version.sh $(MSG_DEF) > $@

clean:
	$(RM) $(PROGRAM) version.h *.o

install: rmate
	install rmate ~/bin/rmate

.PHONY: release clean
