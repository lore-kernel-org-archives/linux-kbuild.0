Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trent.utfs.org ([194.246.123.103]:54292 "EHLO trent.utfs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752200Ab1CGAaA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Mar 2011 19:30:00 -0500
Date: Sun, 6 Mar 2011 16:22:21 -0800 (PST)
From: Christian Kujau <lists@nerdbynature.de>
Subject: cannot create include/linux/version.h.tmp: Read-only file system
Message-ID: <alpine.DEB.2.01.1103061600260.23816@trent.utfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: nicolas.2p.debian@free.fr, mmarek@suse.cz, max@stro.at, linux-kbuild@vger.kernel.org

Hi,

I'm trying to build a kernel with O= with the kernel source residing 
on a readonly NFS share. The main build finishes just fine, vmlinux & the 
modules are all built, but "make deb-pkg" and "make rpm-pkg" fail to 
build:

--------------------------
$ make V=1 O=/mnt/sdb/s0/ deb-pkg
[...]
set -e; : '  CHK     include/linux/version.h'; mkdir -p 
include/linux/; 	
(echo \#define LINUX_VERSION_CODE 132646; echo '#define 
KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))';) < 
/usr/local/src/linux-2.6-git/Makefile > include/linux/version.h.tmp; if [ 
-r include/linux/version.h ] && cmp -s include/linux/version.h 
include/linux/version.h.tmp; then rm -f include/linux/version.h.tmp; else 
: '  UPD     include/linux/version.h'; mv -f include/linux/version.h.tmp 
include/linux/version.h; fi
/bin/sh: cannot create include/linux/version.h.tmp: Read-only file system
make[4]: *** [include/linux/version.h] Error 2

--------------------------
$ make V=1 O=/mnt/sdb/s0/ rpm-pkg
[...]
make -f /usr/local/src/linux-2.6-git/scripts/Makefile.clean 
obj=arch/x86/boot/compressed
  rm -rf .tmp_versions
  rm -f vmlinux System.map .tmp_kallsyms* .tmp_version .tmp_vmlinux* 
.tmp_System.map
set -e; cd ..; ln -sf /usr/local/src/linux-2.6-git kernel-2.6.38rc7
ln: creating symbolic link `kernel-2.6.38rc7': Permission denied
make[2]: *** [rpm-pkg] Error 1
--------------------------

The full buidlogs are here: http://nerdbynature.de/bits/2.6.38-rc7/make/

Note that e.g. "make binrpm-pkg" succeeds and puts the .rpm in $HOME, I 
wonder if at least deb-pkg could be fixed..?

Thanks,
Christian.
-- 
BOFH excuse #3:

electromagnetic radiation from satellite debris
