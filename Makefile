TARGET=bootsect

AS= as86
ASFLAGS= -0 -a
LD= ld86
LDFLAGS= -0 -s

$(TARGET): bootsect.o
	$(LD) $(LDFLAGS) -o $@ $<
.s.o:
	$(AS) $(ASFLAGS) -o $*.o $<

.PHONY : disk run
disk: bootsect
	@dd if=bootsect of=test.img skip=1 bs=32 count=512
run: disk test.img
	-bochs -q -f bb.bxrc &

.PHONY : all
all: $(TARGET) run

.PHONY : clean distclean
clean:
	@rm -vf *.o bochsout.txt
distclean: clean
	@rm -vf $(TARGET) test.img
