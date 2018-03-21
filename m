Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:45746 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751691AbeCUJv2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Mar 2018 05:51:28 -0400
Received: by mail-lf0-f44.google.com with SMTP id l4-v6so2547837lfg.12
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Mar 2018 02:51:28 -0700 (PDT)
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
 <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
 <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr>
 <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
 <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
 <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
 <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr>
 <CAK7LNARdit6ddTBVuf425VSeTQF3v3mR5tSBJ7La2VZFSNC-yw@mail.gmail.com>
 <6a32ecdf-f25a-ca2f-6c10-52d4cc56cc6f@gmail.com>
 <nycvar.YSQ.7.76.1803210900410.7132@knanqh.ubzr>
From: Thomas Lindroth <thomas.lindroth@gmail.com>
Message-ID: <d9646885-39eb-98c4-a605-9a6015780fe1@gmail.com>
Date: Wed, 21 Mar 2018 10:51:24 +0100
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803210900410.7132@knanqh.ubzr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 03/21/2018 02:07 AM, Nicolas Pitre wrote:
>> The problem is the same as before. A kvm based VM fails to initialize
>> a pci device assigned using vfio if TRIM_UNUSED_KSYMS is on but works
>> fine with it off.
>>
>> I don't feel like spending time debugging that problem myself.
>> TRIM_UNUSED_KSYMS sounded useful at first but the build time increased
>> so much I probably won't use it anyway. If you manage to figure out
>> what the problem is I'm willing to test patches.
> 
> If you could give me simple step by step reproduction instructions for 
> the issue then I'll have a look.

I use vfio for passing a GPU to a windows VM for gaming. That's not so
easy to setup and requires special hardware support. You will probably
have a hard time reproducing my setup but if you want to try here are some
info for how it's done.

https://vfio.blogspot.se/2015/05/vfio-gpu-how-to-series-part-1-hardware.html
https://vfio.blogspot.se/2015/05/vfio-gpu-how-to-series-part-2.html
https://vfio.blogspot.se/2015/05/vfio-gpu-how-to-series-part-3-host.html
https://vfio.blogspot.se/2015/05/vfio-gpu-how-to-series-part-4-our-first.html

Arch linux wiki also got a useful page
https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF

You already have my .config. I build vfio into the kernel directly.

Here are my kernel parameters
intel_iommu=on memtest=1 kvm.ignore_msrs=1 vfio-pci.disable_idle_d3=1 vfio-pci.disable_vga=1 vfio-pci.ids=10de:ffffffff:ffffffff:ffffffff:00030000:ffff00ff,10de:ffffffff:ffffffff:ffffffff:00040300:ffffffff

That will assign all nvidia GPUs to the vfio driver at boot.

The VM run windows 7 using qemu-2.11.1 with libvirt-4.1.0 as frontend.

Here is the libvirt xml definition of the VM

<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
  <name>win7</name>
  <uuid>f11b648e-c652-4c42-b2ba-02732533a15d</uuid>
  <memory unit='KiB'>8388608</memory>
  <currentMemory unit='KiB'>8388608</currentMemory>
  <memoryBacking>
    <hugepages/>
  </memoryBacking>
  <vcpu placement='static'>6</vcpu>
  <cputune>
    <vcpupin vcpu='0' cpuset='1'/>
    <vcpupin vcpu='1' cpuset='5'/>
    <vcpupin vcpu='2' cpuset='2'/>
    <vcpupin vcpu='3' cpuset='6'/>
    <vcpupin vcpu='4' cpuset='3'/>
    <vcpupin vcpu='5' cpuset='7'/>
    <emulatorpin cpuset='4'/>
  </cputune>
  <os>
    <type arch='x86_64' machine='pc-i440fx-2.6'>hvm</type>
    <loader readonly='yes' type='pflash'>/usr/share/OVMF/OVMF_CODE_patched.fd</loader>
    <nvram>/var/lib/libvirt/qemu/nvram/win7_VARS.fd</nvram>
    <bootmenu enable='no'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <hyperv>
      <relaxed state='on'/>
      <vapic state='on'/>
      <spinlocks state='on' retries='8191'/>
      <vendor_id state='on' value='SomeString'/>
    </hyperv>
    <kvm>
      <hidden state='on'/>                                                                                                                                           
    </kvm>                                                                                                                                                           
  </features>                                                                                                                                                        
  <cpu mode='host-passthrough' check='none'>                                                                                                                         
    <topology sockets='1' cores='3' threads='2'/>                                                                                                                    
  </cpu>                                                                                                                                                             
  <clock offset='localtime'>                                                                                                                                         
    <timer name='rtc' tickpolicy='catchup'/>                                                                                                                         
    <timer name='pit' tickpolicy='delay'/>                                                                                                                           
    <timer name='hpet' present='no'/>                                                                                                                                
    <timer name='hypervclock' present='yes'/>                                                                                                                        
  </clock>                                                                                                                                                           
  <on_poweroff>destroy</on_poweroff>                                                                                                                                 
  <on_reboot>restart</on_reboot>                                                                                                                                     
  <on_crash>restart</on_crash>                                                                                                                                       
  <pm>                                                                                                                                                               
    <suspend-to-mem enabled='yes'/>                                                                                                                                  
    <suspend-to-disk enabled='yes'/>                                                                                                                                 
  </pm>                                                                                                                                                              
  <devices>                                                                                                                                                          
    <emulator>/usr/bin/qemu-system-x86_64</emulator>                                                                                                                 
    <disk type='block' device='disk'>                                                                                                                                
      <driver name='qemu' type='raw' cache='none' discard='unmap'/>                                                                                                  
      <source dev='/dev/VM_default_VG/main_VM_volume'/>                                                                                                              
      <target dev='sda' bus='sata'/>                                                                                                                                 
      <boot order='2'/>                                                                                                                                              
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>                                                                                             
    </disk>                                                                                                                                                          
    <disk type='file' device='cdrom'>                                                                                                                                
      <driver name='qemu' type='raw'/>                                                                                                                               
      <source file='/mnt/virtual/share/virtio-win-0.1.126.iso'/>                                                                                                     
      <target dev='hdb' bus='ide'/>                                                                                                                                  
      <readonly/>
      <boot order='1'/>
      <address type='drive' controller='0' bus='0' target='0' unit='1'/>
    </disk>
    <controller type='usb' index='0' model='ich9-ehci1'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x7'/>
    </controller>
    <controller type='usb' index='0' model='ich9-uhci1'>
      <master startport='0'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0' multifunction='on'/>
    </controller>
    <controller type='usb' index='0' model='ich9-uhci2'>
      <master startport='2'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x1'/>
    </controller>
    <controller type='usb' index='0' model='ich9-uhci3'>
      <master startport='4'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x2'/>
    </controller>
    <controller type='pci' index='0' model='pci-root'/>
    <controller type='ide' index='0'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x1'/>
    </controller>
    <controller type='sata' index='0'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x06' function='0x0'/>
    </controller>
    <interface type='user'>
      <mac address='00:11:22:33:44:55'/>
      <model type='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
    <interface type='bridge'>
      <mac address='00:11:22:33:44:66'/>
      <source bridge='br0'/>
      <model type='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x09' function='0x0'/>
    </interface>
    <input type='mouse' bus='virtio'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x05' function='0x0'/>
    </input>
    <input type='keyboard' bus='virtio'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x0a' function='0x0'/>
    </input>
    <input type='mouse' bus='ps2'/>
    <input type='keyboard' bus='ps2'/>
    <graphics type='spice' autoport='yes'>
      <listen type='address'/>
    </graphics>
    <video>
      <model type='qxl' ram='65536' vram='65536' vgamem='16384' heads='1' primary='yes'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'/>
    </video>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x07' function='0x0'/>
    </hostdev>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x04' slot='0x00' function='0x1'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x08' function='0x0'/>
    </hostdev>
    <hostdev mode='subsystem' type='usb' managed='yes'>
      <source startupPolicy='optional'>
        <vendor id='0x054c'/>
        <product id='0x05c4'/>
      </source>
      <address type='usb' bus='0' port='1'/>
    </hostdev>
    <hostdev mode='subsystem' type='usb' managed='yes'>
      <source startupPolicy='optional'>
        <vendor id='0x04a9'/>
        <product id='0x190d'/>
      </source>
      <address type='usb' bus='0' port='2'/>
    </hostdev>
    <memballoon model='none'/>
  </devices>
  <qemu:commandline>
    <qemu:arg value='-object'/>
    <qemu:arg value='input-linux,id=mouse1,evdev=/dev/input/by-id/usb-Logitech_G700_Laser_Mouse_E52DB3FA0035-event-mouse'/>
    <qemu:arg value='-object'/>
    <qemu:arg value='input-linux,id=kbd1,evdev=/dev/input/by-id/usb-195d_Gaming_keyboard-if02-event-kbd,grab_all=on,repeat=on'/>
  </qemu:commandline>
</domain>

The OVMF version I use is a specially patched version to make hyperv enlightenments
work in windows 7.

https://github.com/tholin/OVMF-win7-hyperv

This is what lspci -nn looks like
00:00.0 Host bridge [0600]: Intel Corporation 4th Gen Core Processor DRAM Controller [8086:0c00] (rev 06)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller [8086:0c01] (rev 06)
00:02.0 VGA compatible controller [0300]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor Integrated Graphics Controller [8086:0412] (rev 06)
00:03.0 Audio device [0403]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller [8086:0c0c] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation 9 Series Chipset Family USB xHCI Controller [8086:8cb1]
00:16.0 Communication controller [0780]: Intel Corporation 9 Series Chipset Family ME Interface #1 [8086:8cba]
00:19.0 Ethernet controller [0200]: Intel Corporation Ethernet Connection I217-V [8086:153b]
00:1a.0 USB controller [0c03]: Intel Corporation 9 Series Chipset Family USB EHCI Controller #2 [8086:8cad]
00:1c.0 PCI bridge [0604]: Intel Corporation 9 Series Chipset Family PCI Express Root Port 1 [8086:8c90] (rev d0)
00:1c.2 PCI bridge [0604]: Intel Corporation 9 Series Chipset Family PCI Express Root Port 3 [8086:8c94] (rev d0)
00:1c.3 PCI bridge [0604]: Intel Corporation 9 Series Chipset Family PCI Express Root Port 4 [8086:8c96] (rev d0)
00:1c.4 PCI bridge [0604]: Intel Corporation 9 Series Chipset Family PCI Express Root Port 5 [8086:8c98] (rev d0)
00:1c.6 PCI bridge [0604]: Intel Corporation 9 Series Chipset Family PCI Express Root Port 7 [8086:8c9c] (rev d0)
00:1d.0 USB controller [0c03]: Intel Corporation 9 Series Chipset Family USB EHCI Controller #1 [8086:8ca6]
00:1f.0 ISA bridge [0601]: Intel Corporation 9 Series Chipset Family Z97 LPC Controller [8086:8cc4]
00:1f.2 SATA controller [0106]: Intel Corporation 9 Series Chipset Family SATA Controller [AHCI Mode] [8086:8c82]
00:1f.3 SMBus [0c05]: Intel Corporation 9 Series Chipset Family SMBus Controller [8086:8ca2]
01:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:8747] (rev ca)
02:08.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:8747] (rev ca)
02:10.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8747 48-Lane, 5-Port PCI Express Gen 3 (8.0 GT/s) Switch [10b5:8747] (rev ca)
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] [10de:1c03] (rev a1)
04:00.1 Audio device [0403]: NVIDIA Corporation GP106 High Definition Audio Controller [10de:10f1] (rev a1)
06:00.0 Ethernet controller [0200]: Qualcomm Atheros Killer E220x Gigabit Ethernet Controller [1969:e091] (rev 10)
07:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
08:01.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
08:02.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
08:03.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
0b:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX8112 x1 Lane PCI Express-to-PCI Bridge [10b5:8112] (rev aa)
0c:04.0 Multimedia audio controller [0401]: C-Media Electronics Inc CMI8788 [Oxygen HD Audio] [13f6:8788]
0d:00.0 SATA controller [0106]: Marvell Technology Group Ltd. 88SE9172 SATA 6Gb/s Controller [1b4b:9172] (rev 12)
0e:00.0 SATA controller [0106]: Marvell Technology Group Ltd. 88SE9172 SATA 6Gb/s Controller [1b4b:9172] (rev 12)

I assign these devices to the VM
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] [10de:1c03] (rev a1)
04:00.1 Audio device [0403]: NVIDIA Corporation GP106 High Definition Audio Controller [10de:10f1] (rev a1)

My CPU is a i7-4790K and I use the igpu for the host.

My original hunch was that the kernel functions needed for accessing the pci
config space was broken somehow. I think the sysfs driver for 
/sys/bus/pci/devices/*/config use the same functions as vfio and
lspci -vvvxxxxnn give reasonable output even with TRIM_UNUSED_KSYMS.
Each boot always give slightly different output so it's hard to compare.
lspci doesn't write to the config space so perhaps only writing is broken
or perhaps the problem has nothing to do with pci config space at all.
