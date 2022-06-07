touch coreboot_qemu.log
qemu-system-x86_64 -bios /tmp/assets/coreboot.rom -nographic -serial pipe:coreboot_qemu.log &
PID=$!
sleep 5
kill $PID 
if grep -q "Jumping" coreboot_qemu.log; then
		echo Boot test successful.	
else
		echo Boot test failed.
fi
rm coreboot_qemu.log
