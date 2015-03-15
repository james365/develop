CROSS = arm-linux-
CFLAGS = -nostdlib -c -Wall -g 
TARGET = leds
OBJS := start.o $(TARGET).o

LDFILE = $(TARGET).lds

$(TARGET).bin:$(OBJS) 
	$(CROSS)ld -T$(LDFILE) -o $(TARGET)_elf $^
	$(CROSS)objcopy -O binary -S $(TARGET)_elf $@
	$(CROSS)objdump -D -m arm $(TARGET)_elf > $(TARGET).dis
%.o: %.c
	$(CROSS)gcc $(CFLAGS) -o $@ $<
%.o: %.s
	$(CROSS)gcc $(CFLAGS) -o $@ $<
clean:
	rm -f *.bin *elf *.dis *.o 


