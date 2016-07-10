

SUFFIX = .$(ARCH)
ECHO = /bin/echo

CROSS_CFLAGS=-g -specs=archc -msoft-float

TESTS = $(patsubst %.c,%,$(wildcard *.c))

# Use rules
help:
	@$(ECHO) -e "\nRules:\n"
	@$(ECHO) -e "help: \tShow this help"
	@$(ECHO) -e "build: \tCompile programs"
	@$(ECHO) -e "run: \tRun the simulator with gdb commands"
	@$(ECHO) -e "check: \tCheck the simulator outputs with the host outputss"
	@$(ECHO) -e "clean: \tRemove generated files"
	@$(ECHO) -e "\nEdit and source the file 'acstone.env.sh' before of all\n"


# Compile programs
build: $(TESTS)

$(TESTS): 
	$(CROSS_COMPILER) $(CROSS_CFLAGS) $@.c -o $@$(SUFFIX)
	gcc -g $@.c -o $@.x86


# Clean executables and backup files
clean: 
	rm -f *~
	rm -f *.cmd
	rm -f *.out
	rm -f *.$(ARCH)
	rm -f *.x86

run:
	./bin/run_x86.sh
	./bin/run_simulator.sh &
	./bin/run_gdb.sh 

check:
	./bin/check.sh

.PHONY: build clean all
