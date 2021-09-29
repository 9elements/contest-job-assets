touch /tmp/log_qemu_coreboot
qemu-system-x86_64 -bios build/coreboot.rom -nographic -serial pipe:/tmp/log_qemu_coreboot &
PID=$!
sleep 30
kill $PID 
grep "Jumping" /tmp/log_qemu_coreboot
rm /tmp/log_qemu_coreboot

