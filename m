Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40903 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfAESfp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jan 2019 13:35:45 -0500
Received: by mail-lf1-f65.google.com with SMTP id v5so27502394lfe.7
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Jan 2019 10:35:42 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id p21sm11818496lfj.10.2019.01.05.10.35.40
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Jan 2019 10:35:40 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id t18-v6so34986554ljd.4
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Jan 2019 10:35:40 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
In-Reply-To: <CAK7LNAQzEHv7Y69xFTPDEhyMP6JX4ghb96UMqMdxYyVyah6-VA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Jan 2019 10:35:23 -0800
Message-ID: <CAHk-=whg49nn5q_2QVMGN0u4rQFBmRKywtqJUSk+5=rBzTk1kg@mail.gmail.com>
Subject: Re: [GIT PULL 1/4] Kbuild updates for v4.21
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

Masahiro,
 this isn't really related to the your request, but to just another
pull request that caused much more of a rebuild than I expected.

Doing a "make --debug", I see that the cause was that it touched
include/uapi/linux/elf-em.h, and make says things like

     Prerequisite 'include/uapi/linux/elf-em.h' is newer than target
'drivers/net/ethernet/sfc/falcon/efx.o'.
    Must remake target 'drivers/net/ethernet/sfc/falcon/efx.o'.

which is obviously true, but was unexpected.

The chain seems to be

  <linux/module.h> ->
    <linux/elf.h> ->
      <uapi/linux/elf.h> ->
        <linux/elf-em.h>

or similar, and the reason <linux/module.h> does that is it wants some
of the elf types (ie code like this:

struct mod_kallsyms {
        Elf_Sym *symtab;
        unsigned int num_symtab;
        char *strtab;
};

and for declarations of module_bug_finalize() etc.

Fine, fine. I can see why everybody includes <linux/module.h>, and I
can see why module.h in turn wants the elf information.

And I think I can see a way to avoid this chain, particularly with
lots of those things really being internal to kernel/module.h and
shouldn't be visible to random <linux/module.h> users.

But the reason for this email to you is simply to ask whether you
use/have any tools for seeing these kinds of deep include chains.
Getting rid of some of the deep chains of header includes would likely
speed up kernel builds even when a rebuild is forced, and when it's
something like "we really shouldn't have rebuilt that file at all" the
speedup is obviously even bigger than just a "the compiler saw much
too much unnecessary header contents".

                 Linus
