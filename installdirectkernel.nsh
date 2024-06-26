echo -off

cls

If "%4" == "" then
    echo "Usage: installdirectkernel.nsh <bootentrynumber> <pathtokernel> <bootentryname> <bootoptionsfile> 
    echo "Please provide all four parameters."
    goto eof
EndIf

set boot_entrynum %1
set kernel_path %2
set boot_entry_name %3
set boot_options_path %4

echo "Welcome to the Direct Kernel Boot installer! :3"
echo " "
echo "This installer already assumes that you have symlinked your kernel files in /boot."
echo " "
echo "Doing so will make this easier to update the kernel without rerunning this command each time you update it."
echo " "
pause

bcfg boot add %boot_entrynum% %kernel_path% %boot_entry_name%

bcfg boot -opt 0x%boot_entrynum% %boot_options_path%

echo "Install completed! (//>/w/<//)"

echo -on

:eof