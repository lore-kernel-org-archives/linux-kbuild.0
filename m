Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:40774 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918AbbCHXIH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Mar 2015 19:08:07 -0400
MIME-Version: 1.0
In-Reply-To: <15447.1425431256@turing-police.cc.vt.edu>
References: <15447.1425431256@turing-police.cc.vt.edu>
Date: Sun, 8 Mar 2015 16:08:06 -0700
Message-ID: <CA+55aFx368q6kAuNV_7zskFdyh2yxYfpm77Yak5WQiexin_d9A@mail.gmail.com>
Subject: Re: [RFC PATCH] Don't reset timestamps in include/generated if not needed
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, Michal Marek <mmarek@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 3, 2015 at 5:07 PM, Valdis Kletnieks
<Valdis.Kletnieks@vt.edu> wrote:
>
> Kbuild regenerates bounds.h and asm-offsets.h, resetting the timestamps
> and forcing rebuilds even if the contents haven't changed.  Add a bit of
> shell magic to only replace the file if the contents have in fact changed,
> which should speed up git bisects and similar.
> ...
> RFC because I can't wrap my head around why this wasn't done ages ago.
> If I'm missing something something obvious, please apply a cluestick. :)
>
> Lightly tested - if I rm one of those two files, it gets rebuilt. If I
> insert some whitespace, it gets replaced. If I don't touch it, the datestamp
> doesn't change.

I don't think this is wrong, but I'd really prefer to do the whole
move-if-changed thing as a separate rule, and a separate command.

IOW, could we please have something that generates the "build.h" file
by separately creating a new temporary file, and then having the
traditional kind of move-if-changed definition

   define move-if-changed
        if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
   endef

kind of thing that just does

   $(call move-if-changed,build.h.tmp,build.h)

Hmm? That move-if-changed can be useful for other cases too, I've seen
something like it in a lot of makefiles. I'm surprised we don't have
one already.

That said, we already have that "filechk" define that does pretty much
all of this.

So I don't like the exact patch, but I do like the effect it gives. Michal?

                    Linus
