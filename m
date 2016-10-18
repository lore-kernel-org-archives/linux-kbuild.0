Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38627 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965189AbcJRUow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 16:44:52 -0400
MIME-Version: 1.0
In-Reply-To: <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com> <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
From: Jim Davis <jim.epost@gmail.com>
Date: Tue, 18 Oct 2016 13:44:50 -0700
Message-ID: <CA+r1Zhj3AQAbL_Hu4w=gX8kaR0zKoYhTmAYyVcvBMPLXpfZ3gA@mail.gmail.com>
Subject: Re: Difficulties around "fixdep" for the usage of a kernel build
 output directory
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>

On Tue, Oct 18, 2016 at 10:25 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> Can it be that the passing of the adjusted parameter "HOSTCFLAGS" has got a significant
> influence (with unwanted side effects) in this use case?

That's probably it.  If I strip down your advanced original example to just

make defconfig
make HOSTCFLAGS=-S

then I get a similar error:

  HOSTCC  scripts/basic/fixdep
scripts/basic/fixdep: 1: scripts/basic/fixdep: .file: not found
scripts/basic/fixdep: 2: scripts/basic/fixdep: .comm: not found
scripts/basic/fixdep: 3: scripts/basic/fixdep: .comm: not found
scripts/basic/fixdep: 4: scripts/basic/fixdep: .comm: not found
scripts/basic/fixdep: 5: scripts/basic/fixdep: .comm: not found
scripts/basic/fixdep: 6: scripts/basic/fixdep: .section: not found

and so forth.  The problem is that, with -S, fixdep isn't build as an
executable:

jim@krebstar:~/linux-next/scripts/basic$ file fixdep
fixdep: assembler source, ASCII text
jim@krebstar:~/linux-next/scripts/basic$ more fixdep
    .file    "fixdep.c"
    .comm    insert_extra_deps,4,4
    .comm    target,8,8
    .comm    depfile,8,8
    .comm    cmdline,8,8
    .section    .rodata

I'm guessing that in your original example you wanted to look at the
assembly output gcc produced; you'd probably have better luck using
objdump for that.

-- 
Jim
