Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46175 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVRwY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 12:52:24 -0500
Received: by mail-lj1-f176.google.com with SMTP id m26so7786307ljc.13
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2020 09:52:23 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: vmlinux ELF header sometimes corrupt
Message-ID: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Date: Wed, 22 Jan 2020 18:52:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>

I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
very hard to debug problem that maybe someone else has encountered. This
doesn't happen always, perhaps 1 in 8 times or something like that.

The issue is that when the build gets to do "${CROSS}objcopy -O binary
... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
that fails with

  powerpc-oe-linux-objcopy:vmlinux: file format not recognized

So I hacked link-vmlinux.sh to stash copies of vmlinux before and after
sortextable vmlinux. Both of those are proper ELF files, and comparing
the corrupted vmlinux to vmlinux.after_sort they are identical after the
first 52 bytes; in vmlinux, those first 52 bytes are all 0.

I also saved stat(1) info to see if vmlinux is being replaced or
modified in-place.

$ cat vmlinux.stat.after_sort
  File: 'vmlinux'
  Size: 8608456     Blocks: 16696      IO Block: 4096   regular file
Device: 811h/2065d  Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 10:52:38.946703081 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

$ stat vmlinux
  File: 'vmlinux'
  Size: 8608456         Blocks: 16688      IO Block: 4096   regular file
Device: 811h/2065d      Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 17:20:00.650379057 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

So the inode number and mtime/ctime are exactly the same, but for some
reason Blocks: has changed? This is on an ext4 filesystem, but I don't
suspect the filesystem to be broken, because it's always just vmlinux
that ends up corrupt, and always in exactly this way with the first 52
bytes having been wiped.

Any ideas?

Rasmus
