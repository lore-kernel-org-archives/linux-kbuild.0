Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:33676 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726244AbfBJMjb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Feb 2019 07:39:31 -0500
Date: Sun, 10 Feb 2019 13:39:23 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Message-ID: <20190210123923.GA14948@zn.tnic>
References: <20190201094217.GB31854@zn.tnic>
 <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic>
 <20190201103648.GF31854@zn.tnic>
 <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
 <20190201151139.GK31854@zn.tnic>
 <CAK7LNATVeX=6Mmn6A4+EGmZ9OSf=ePwbQWV1m1c=e=_LiebdNQ@mail.gmail.com>
 <20190202144227.GC27822@zn.tnic>
 <20190206104729.GC7314@zn.tnic>
 <CAK7LNAT+GhbEwP7v7NWd2kqW76qbXM1mtKhc21YXkp7BUJjzKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAT+GhbEwP7v7NWd2kqW76qbXM1mtKhc21YXkp7BUJjzKQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Sun, Feb 10, 2019 at 03:51:01PM +0900, Masahiro Yamada wrote:
> I am still wondering,
> but if this is really worth doing in upstream code,

Yes, it is very worth doing it:

make <path-to-file>.s

is one of the basic steps one does when trying to pinpoint the Code:
line in a splat back to the code gcc generated.

> I think the following is a simpler idea.

Yes, you can do it this way too but I can't apply it here to play with
it because gmail probably corrupted the diff:

checking file Makefile
Hunk #1 FAILED at 729.
1 out of 1 hunk FAILED
checking file scripts/Makefile.build
patch: **** malformed patch at line 98: $(DISABLE_LTO) -fverbose-asm -S -o $@ $<

Please attach the diff or send it from another mail server.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
