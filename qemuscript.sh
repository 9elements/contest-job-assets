touch coreboot_qemu.log
qemu-system-x86_64 -bios build/coreboot.rom -nographic -serial pipe:coreboot_qemu.log &
PID=$!
sleep 30
kill $PID 
grep "Jumping" coreboot_qemu.log
rm coreboot_qemu.log

