cd /tmp
touch log_qemu_coreboot
cd coreboot
qemu-system-x86_64 -bios build/coreboot.rom -nographic -serial pipe:/tmp/log_qemu_coreboot &
PID=$!
sleep 5
kill $PID 
grep "Jumping" /tmp/log_qemu_coreboot
rm /tmp/log_qemu_coreboot

