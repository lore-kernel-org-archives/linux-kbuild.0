Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:36726 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752980AbcBVXDA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 18:03:00 -0500
Received: by mail-ig0-f169.google.com with SMTP id xg9so87830971igb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Feb 2016 15:03:00 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 22 Feb 2016 15:02:59 -0800
Message-ID: <CAGXu5jJR2ysc=g9879=o7AJtsygV4PR8VVZ5ojQGCsqqgWBH2g@mail.gmail.com>
Subject: In-place changes to a target?
From: Kees Cook <keescook@google.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, PaX Team <pageexec@freemail.hu>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi,

I'm attempting to do some strange things in drivers/misc/lkdtm.c, and
I'm stumped on how to do it "best" in kbuild.

What I want: an empty function that just returns, but the code lives in .rodata.

Since I want to be architecture agnostic, I want to use gcc to
generate assembly. If I force the section name (via
"__section(.rodata)" gcc adds the wrong flags ("ax" instead of "a"). I
can't trick the assembler output using a comment because each
architecture has different comment characters (once again, I want to
be architecture agnostic).

I can use objcopy to change the flags, but kbuild expects to copy from
one target to another target, rather than doing it in-place:

OBJCOPYFLAGS_lkdtm_objcopy.o := \
                        --set-section-flags .text.rodata=alloc,readonly \
                        --rename-section .text.rodata=.rodata
$(obj)/lkdtm_objcopy.o: $(src)/lkdtm.o FORCE
        $(call if_changed,objcopy)

But I haven't found a way to either replace this new target or even
add it (if built from a separate file) without also needing to rename
lkdtm.c. If I do this:

lkdtm-$(CONFIG_LKDTM) += lkdtm_objcopy.o

I end up with a circular dependency. I can't find a way to have either
lkdtm_objcopy.o replace lkdtm.o or even to simply add lkdtm_objcopy.o
to lkdtm.o without renaming lkdtm.c. For example, this works (after a
"mv lkdtm.c lkdtm_core.c" and putting the special function in a
separate file named "lkdtm_rodata.c"):

lkdtm-$(CONFIG_LKDTM)          += lkdtm_core.o
lkdtm-$(CONFIG_LKDTM)          += lkdtm_rodata_objcopy.o

OBJCOPYFLAGS_lkdtm_rodata_objcopy.o := \
                       --set-section-flags .text.rodata=alloc,readonly \
                       --rename-section .text.rodata=.rodata
$(obj)/lkdtm_rodata_objcopy.o: $(obj)/lkdtm_rodata.o
       $(call if_changed,objcopy)

Is there some way to either append to the lkdtm.o rule to do an
in-place objcopy, or append another .o file to lkdtm.o? I'd really
rather not have to rename lkdtm.c...

Thanks for any help!

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
