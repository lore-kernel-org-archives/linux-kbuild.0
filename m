Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mercury.realtime.net ([205.238.132.86]:55505 "EHLO
	mercury.realtime.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383AbYKSHbR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Nov 2008 02:31:17 -0500
From: "Milton Miller" <miltonm@bga.com>
Reply-to: miltonm@bga.com
Subject: [BUG] ppc64 relocatable vmlinux builds even with undefined symbols
Date: Wed, 19 Nov 2008 01:14:49 -0600
Message-id: <4923bce9.bc.3e34.1353742792@bga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org
Cc: Paul Mackerras <paulus@samba.org>

With the additon of -pie to build CONFIG_RELOCATABLE
CONFIG_PPC64 kernels, even
if a function is undefined we still get a vmlinux,
System.map, and other files
with no error message.
 
This is with binutils 2.17 as built by debian
 
with 2.6.28-rc5, CONFIG_EMBEDDED=y CONFIG_HOTPLUG=n
CONFIG_PCI=y, CONFIG_RELOCATABLE=n
 
arch/powerpc/kernel/built-in.o: In function
`.pcibios_remove_root_bus':
(.text+0x12dc4): undefined reference to
`.pcibios_unmap_io_space'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2
 
 
with CONFIG_RELOCATABLE=y
  LD      init/built-in.o
  LD      .tmp_vmlinux1
  KSYM    .tmp_kallsyms1.S
  AS      .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYM    .tmp_kallsyms2.S
  AS      .tmp_kallsyms2.o
  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map

Note that we set -pie for this combination.  I tried adding
seperately both
--no-undefined and --no-allow-shlib-undefined to
LDFLAGS_vmilnux,
but the link still did not error out.

I note that nm -u will detect the U symbol:

$ nm -u /tmp/p-test/vmlinux                  w mach_cell
                 w mach_iseries
                 w mach_powermac
                 U pcibios_unmap_io_space

but that would either require duplicating cmd_vmlinux and
adding an additonal
check or modifing rule_vmlinux. 

milton 
