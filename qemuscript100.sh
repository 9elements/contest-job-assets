#!/bin/sh
i=0
while [ $i -ne 100 ]
do
	i=$(($i+1))
	touch coreboot_qemu.log
	qemu-system-x86_64 -bios /root/assets/coreboot.rom -nographic -serial pipe:coreboot_qemu.log &
	PID=$!
	sleep 2
	kill $PID 
	if grep -q "Jumping" coreboot_qemu.log; then
		echo Boot test successful.
	else
		echo Boot test failed.
		break
	fi
	rm coreboot_qemu.log
	if [ $i -eq 100 ]; then
	    echo All tests successful.
		return
	fi
done

