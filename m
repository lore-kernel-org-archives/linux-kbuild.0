Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42544 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750926AbdDDHDB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Apr 2017 03:03:01 -0400
Subject: Re: [PATCH] Kbuild.include: addtree: Remove quotes before matching
 path
References: <20170318215823.GS4152@decadent.org.uk>
 <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
 <7bebf377-1268-ee02-c19b-f2d16d69cf79@suse.com>
 <20170403202033.GB29829@ravnborg.org>
From: Michal Marek <mmarek@suse.com>
Message-ID: <e55be488-9304-ee4a-87e6-90b7c004149c@suse.com>
Date: Tue, 4 Apr 2017 09:02:56 +0200
MIME-Version: 1.0
In-Reply-To: <20170403202033.GB29829@ravnborg.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable@vger.kernel.org, 856474@bugs.debian.org

Dne 3.4.2017 v 22:20 Sam Ravnborg napsal(a):
> On Mon, Apr 03, 2017 at 03:25:10PM +0200, Michal Marek wrote:
>> On 2017-04-03 09:42, Masahiro Yamada wrote:
>>> Each Makefile knows it wants to see
>>> additional headers in the source tree, or objtree.
>>>
>>> I am guessing the right approach in a long run is,
>>> we require -I to specify $(srctree) or $(objtree) explicitly.
>>>
>>> ccflags-y := -I$(srctree)/foo/bar/baz
>>>
>>> or
>>>
>>> ccflags-y := -I$(objtree)/foo/bar/baz
>>>
>>>
>>> (For the latter, we can omit $(objtree)/ as it is ./)
>>>
>>>
>>> Then, delete $(call flags,_c_flags) after the conversion.
>>
>> Agreed. The addtree function is more of a hack to make things just work
>> with O=, but AFAIK there is no clean way to implement VPATH for -I
>> arguments. So it's sensible to get rid of the hack. It looks like it's
>> going to be lot of work though:
>>
>> $ git grep -e '-I' -- '*Makefile*' | wc -l
>> 732
>> $ git grep -e '-I *\$(\(src\|obj\)tree)' -- '*Makefile*' | wc -l
>> 166
> 
> There was a goal long time ago that moving the kernel source should
> not trigger a rebuild.
> Any hardcoded path would violate this (like $(srctree), $(objtree))
> 
> I dunno if this is really something to aim for today.
> 
> I have personally from time to time renamed the directory where
> I have kernel soruce (which is seen like moving the kernel source),
> and would not be happy if this always triggered a full rebuild.
> But this is frankly a corner case.

This should be working nowadays if you build without O= or if the
buildtree points to a subdirectory of the source tree. The srctree
variable is set to . or .. in such case. Although when I tried it now,
it still does not look perfect:

$ cd /dev/shm/mmarek/linux-2.6
$ make O=build -s defconfig
$ make O=build -s -j64
Setup is 15500 bytes (padded to 15872 bytes).
System is 6530 kB
CRC 4bc8f6e2
Kernel: arch/x86/boot/bzImage is ready  (#1)
$ grep -r $PWD build/
Binary file build/arch/x86/boot/setup.elf matches
Binary file build/arch/x86/boot/header.o matches
Binary file build/arch/x86/boot/video.o matches
Binary file build/arch/x86/boot/cpu.o matches
Binary file build/arch/x86/boot/printf.o matches
Binary file build/arch/x86/boot/string.o matches
Binary file build/arch/x86/boot/video-mode.o matches
Binary file build/arch/x86/boot/video-vga.o matches
Binary file build/arch/x86/boot/early_serial_console.o matches
Binary file build/arch/x86/boot/video-vesa.o matches
Binary file build/arch/x86/boot/cpucheck.o matches
Binary file build/arch/x86/boot/video-bios.o matches
Binary file build/arch/x86/boot/tty.o matches
Binary file build/arch/x86/boot/memory.o matches
Binary file build/arch/x86/boot/pm.o matches
Binary file build/arch/x86/boot/cmdline.o matches
Binary file build/arch/x86/boot/main.o matches
Binary file build/arch/x86/boot/a20.o matches
Binary file build/arch/x86/boot/regs.o matches
Binary file build/arch/x86/boot/version.o matches
Binary file build/arch/x86/boot/edd.o matches
Binary file build/arch/x86/boot/cpuflags.o matches
Binary file build/arch/x86/boot/pmjump.o matches
Binary file build/arch/x86/boot/copy.o matches
Binary file build/arch/x86/boot/bioscall.o matches
Binary file build/arch/x86/realmode/rm/video-bios.o matches
Binary file build/arch/x86/realmode/rm/video-mode.o matches
Binary file build/arch/x86/realmode/rm/video-vga.o matches
Binary file build/arch/x86/realmode/rm/video-vesa.o matches
Binary file build/arch/x86/realmode/rm/wakemain.o matches
Binary file build/arch/x86/realmode/rm/regs.o matches
Binary file build/arch/x86/realmode/rm/trampoline_64.o matches
Binary file build/arch/x86/realmode/rm/wakeup_asm.o matches
Binary file build/arch/x86/realmode/rm/copy.o matches
Binary file build/arch/x86/realmode/rm/bioscall.o matches
Binary file build/arch/x86/realmode/rm/reboot.o matches

All the 32bit object files contain the full path, but none of the .cmd
files do?! And we do trigger rebuild of a few files after moving the
tree, but we do so even in the original location, so it looks like
somebody got a custom rule wrong again.

Michal
