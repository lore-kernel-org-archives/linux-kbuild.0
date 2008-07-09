Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:41893 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751582AbYGISbx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2008 14:31:53 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m69IVoVo022235
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Jul 2008 14:31:50 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m69IVj9Z106886
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Jul 2008 14:31:45 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m69IVjDk031614
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Jul 2008 14:31:45 -0400
Message-ID: <4875040A.7020306@in.ibm.com>
Date: Thu, 10 Jul 2008 00:01:38 +0530
From: Mohan Kumar M <mohan@in.ibm.com>
MIME-Version: 1.0
Subject: Integrating relocatable kernel build with kernel build 
Content-Type: multipart/mixed;
 boundary="------------000609040000030705070004"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------000609040000030705070004
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am developing relocatable kernel for PPC64 and as part of it I need to 
integrate the build process with the kernel build itself. As of now I am 
using a separate makefile to build the relocatable kernel after building 
the kernel.

I have updated the Makefile(s) in arch/powerpc and arch/powerpc/boot to 
build the relocatable kernel image as part of kernel build.

With this approach I have two problems:
1. I need to explicitly specify the relocatable vmlinux target to build 
it. ie
	make vmlinux.reloc
2. During build process, build is not able to build the 
vmlinux.reloc.lds linker script from the vmlinux.reloc.lds.S source file.

I am attaching the separate makefile to build the relocatable vmlinux, 
makefile diffs diff.Makefile (diff between original 
arch/powerpc/Makefile and arch/powerpc/Makefile for relocatable 
support), diff.Makefile.boot (diff between original 
arch/powerpc/boot/Makefile and arch/powerpc/boot/Makefile for 
relocatable support)

There are some differences when building the kernel using the separate 
makefile and as part of kernel build. Stand alone makefile creates final 
vmlinux.reloc image in the top level directory of kernel source 
directory and all intermediate binary files, linker script files are 
present in arch/powerpc while the kernel makefile creates vmlinux.reloc 
and intermediate files in arch/powerpc/boot and linker scripts are 
present in arch/powerpc/boot directory.

Please suggest me what needs to be done in the Makefile so that the 
relocatable vmlinux file is built automatically when I just run make and 
how to build the vmlinux.reloc.lds linker script.

Another feature I am looking is to generate the "relocatable vmlinux" 
image in the top directory of kernel source and the intermediate vmlinux 
file either in arch/powerpc/kernel or arch/powerpc/boot.

Note: As of now I am not considering the CONFIG_RELOCATABLE_PPC64 option 
to conditionally build the relocatable image. I am building the 
relocatable image unconditionally.

I have not subscribed to the kbuild mailing list, so please include me 
in to/cc while replying to this thread.

Thanks in advance.

Regards,
Mohan.

--------------000609040000030705070004
Content-Type: text/plain;
 name="diff.Makefile"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff.Makefile"

159c159
< BOOT_TARGETS = zImage zImage.initrd uImage zImage% dtbImage% treeImage.% cuImage.% simpleImage.%
---
> BOOT_TARGETS = zImage vmlinux.reloc zImage.initrd uImage zImage% dtbImage% treeImage.% cuImage.% simpleImage.%

--------------000609040000030705070004
Content-Type: text/plain;
 name="diff.Makefile.boot"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff.Makefile.boot"

20c20
< all: $(obj)/zImage
---
> all: $(obj)/zImage $(obj)/vmlinux.reloc
123c123
< hostprogs-y	:= addnote addRamDisk hack-coff mktree dtc
---
> hostprogs-y	:= addnote addRamDisk hack-coff mktree dtc relocs
128a129
> 
132c133
< wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree dtc) \
---
> wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree dtc relocs) \
134a136,164
> targets +=  vmlinux.offsets vmlinux.bin vmlinux.bin.all vmlinux.reloc.elf vmlinux.reloc reloc_apply.o
> 
> OBJCOPYFLAGS_vmlinux.bin :=  -O binary -R .note -R .comment -S
> $(obj)/vmlinux.bin: vmlinux FORCE
> 	$(call if_changed,objcopy)
> 
> quiet_cmd_relocbin = BUILD   $@
>       cmd_relocbin = cat $(filter-out FORCE,$^) > $@
> 
> quiet_cmd_relocs = RELOCS   $@
>     cmd_relocs = $(obj)/relocs $< > $@
> 
> $(obj)/vmlinux.offsets: vmlinux $(obj)/relocs FORCE
> 	$(call if_changed,relocs)
> 
> $(obj)/vmlinux.bin.all: $(obj)/vmlinux.bin $(obj)/vmlinux.offsets FORCE
> 	$(call if_changed,relocbin)
> 
> $(obj)/vmlinux.reloc.lds: $(src)/vmlinux.reloc.lds.S FORCE
> 	$(call if_changed_dep,cpp_lds_S)
> 
> LDFLAGS_vmlinux.reloc.elf := -T $(obj)/vmlinux.reloc.scr -r --format binary --oformat elf64-powerpc
> $(obj)/vmlinux.reloc.elf: $(obj)/vmlinux.bin.all FORCE
> 	$(call if_changed,ld)
> 
> LDFLAGS_vmlinux.reloc := -T $(obj)/vmlinux.reloc.lds
> $(obj)/vmlinux.reloc: $(obj)/reloc_apply.o $(obj)/vmlinux.reloc.elf FORCE
> 	$(call if_changed,ld)
> 
278c308
< targets	+= $(image-y) $(initrd-y)
---
> targets	+= $(image-y) $(initrd-y) vmlinux.reloc

--------------000609040000030705070004
Content-Type: text/plain;
 name="make.reloc"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="make.reloc"

#Makefile for building vmlinux with relocatable information and code.

all: vmlinux.reloc

obj 	:= arch/powerpc

AS	= as
LD	= ld
CC	= gcc
CPP	= $(CC) -E

#build userspace relocs program to extract list of relocation offsets
$(obj)/relocs : $(obj)/relocs.c
	$(CC) $(obj)/relocs.c -o $(obj)/relocs

#extract list of relocation offsets
$(obj)/vmlinux.reloc.offsets : vmlinux $(obj)/relocs
	$(obj)/relocs vmlinux > $(obj)/vmlinux.reloc.offsets 2>/dev/null

#binary format of vmlinux
$(obj)/vmlinux.bin: vmlinux
	objcopy -O binary -R .note -R .comment -S vmlinux $(obj)/vmlinux.bin

#concatenate vmlinux binary and relocation offset
$(obj)/vmlinux.bin.all : $(obj)/vmlinux.bin $(obj)/vmlinux.reloc.offsets
	cat $(obj)/vmlinux.bin $(obj)/vmlinux.reloc.offsets > $(obj)/vmlinux.bin.all

#generate elf headers for the concatenated vmlinux binary and relocation offset
$(obj)/vmlinux.reloc.elf : $(obj)/vmlinux.reloc.scr $(obj)/vmlinux.bin.all
	$(LD) -m elf64ppc -r --format binary --oformat elf64-powerpc -T $(obj)/vmlinux.reloc.scr $(obj)/vmlinux.bin.all -o $(obj)/vmlinux.reloc.elf

#build the wrapper around kernel
$(obj)/kernel/reloc_apply.o : $(obj)/kernel/reloc_apply.S
	$(CC) -m64 -Wp,-MD,arch/powerpc/kernel/.reloc_apply.o.d  -nostdinc -isystem /usr/lib/gcc/powerpc64-suse-linux/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h  -D__ASSEMBLY__  -Wa,-maltivec     -c -o arch/powerpc/kernel/reloc_apply.o arch/powerpc/kernel/reloc_apply.S

#linker script
$(obj)/vmlinux.reloc.lds : $(obj)/vmlinux.reloc.lds.S
	$(CC) -m64 -E -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Os -msoft-float -pipe -mminimal-toc -mtraceback=none  -mcall-aixdesc -mtune=power4 -mno-altivec -mno-spe -funit-at-a-time -mno-string -Wa,-maltivec -fomit-frame-pointer  -fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign -Wp,-MD,arch/powerpc/.vmlinux.reloc.lds.d  -nostdinc -isystem /usr/lib/gcc/powerpc64-suse-linux/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h    -Upowerpc -P -C -Upowerpc -D__ASSEMBLY__ -o arch/powerpc/vmlinux.reloc.lds arch/powerpc/vmlinux.reloc.lds.S

#build the relocatable vmlinux from vmlinux and relocatable kernel wrapper
vmlinux.reloc : $(obj)/vmlinux.reloc.lds $(obj)/vmlinux.reloc.elf $(obj)/kernel/reloc_apply.o
	$(LD) -m elf64ppc -T $(obj)/vmlinux.reloc.lds $(obj)/vmlinux.reloc.elf $(obj)/kernel/reloc_apply.o -o vmlinux.reloc

--------------000609040000030705070004--
