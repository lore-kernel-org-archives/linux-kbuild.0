Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:43041 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfAEUjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jan 2019 15:39:11 -0500
Date: Sat, 5 Jan 2019 21:39:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [GIT PULL 1/4] Kbuild updates for v4.21
Message-ID: <20190105203906.GA22423@ravnborg.org>
References: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
 <CAHk-=whg49nn5q_2QVMGN0u4rQFBmRKywtqJUSk+5=rBzTk1kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whg49nn5q_2QVMGN0u4rQFBmRKywtqJUSk+5=rBzTk1kg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Hi Linus.

> But the reason for this email to you is simply to ask whether you
> use/have any tools for seeing these kinds of deep include chains.

Not exactly what you ask for - but we have make V=2

Example:

$ touch include/uapi/linux/elf-em.h
$ make V=2
  CALL    scripts/checksyscalls.sh - due to target missing
  DESCEND  objtool
  CC      init/main.o - due to: include/uapi/linux/elf-em.h
  CHK     include/generated/compile.h
  CC      init/version.o - due to: include/uapi/linux/elf-em.h
  CC      init/do_mounts.o - due to: include/uapi/linux/elf-em.h
  CC      init/do_mounts_initrd.o - due to: include/uapi/linux/elf-em.h
  CC      init/do_mounts_md.o - due to: include/uapi/linux/elf-em.h
...

With V=2 kbuild will try to tell you why a target is rebuild.
This can sometimes be useful.

Here kbuild will tell you: - due to: include/uapi/linux/elf-em.h
Which may be a good clue.

But you need to figure out yourself why a certain file
depends on include/uapi/linux/elf-em.h

One way is to look at the .cmd file for a target:

$ cat init/.do_mounts_md.o.cmd
...
  include/linux/module.h \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
  include/linux/kmod.h \
  include/linux/umh.h \
  include/linux/elf.h \
  arch/x86/include/asm/elf.h \
  arch/x86/include/asm/user.h \
  arch/x86/include/asm/user_64.h \
  arch/x86/include/asm/fsgsbase.h \
  arch/x86/include/asm/msr-index.h \
  arch/x86/include/asm/vdso.h \
    $(wildcard include/config/x86/x32.h) \
  include/uapi/linux/elf.h \
  include/uapi/linux/elf-em.h \
...

In the above all the $(wildcard ...) is the CONFIG_ symbols
in the files that trigger a possible dependency on a file
representing the CONFIG_ symbol.

We can see that the target depends on elf-em.h and if we follow
it back we end up with module.h included from do_mounts_md.c

	Sam
