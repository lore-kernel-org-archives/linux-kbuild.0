Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from r00tworld.com ([212.85.137.150]:45632 "EHLO r00tworld.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761632AbcLPXP5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Dec 2016 18:15:57 -0500
From: "PaX Team" <pageexec@freemail.hu>
Date: Sat, 17 Dec 2016 00:15:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] gcc-plugins: Add the initify gcc plugin
Reply-to: pageexec@freemail.hu
Message-ID: <58547576.17739.2C3ECA62@pageexec.freemail.hu>
In-reply-to: <CAGXu5j+=TarTeLkZDDESpCyzWXFDAaQrGoPKcHLyGnh5nutKKQ@mail.gmail.com>
References: <1481925984-98605-1-git-send-email-keescook@chromium.org>, <58546E96.16770.2C23F1B4@pageexec.freemail.hu>, <CAGXu5j+=TarTeLkZDDESpCyzWXFDAaQrGoPKcHLyGnh5nutKKQ@mail.gmail.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Emese Revfy <re.emese@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, Brad Spengler <spender@grsecurity.net>, Michal Marek <mmarek@suse.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, minipli@ld-linux.so, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, David Brown <david.brown@linaro.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@poochiereds.net>, Sam Ravnborg <sam@ravnborg.org>

On 16 Dec 2016 at 15:02, Kees Cook wrote:

> >>  static inline struct cgraph_node_hook_list *cgraph_add_function_insertion_hook(cgraph_node_hook hook, void *data)
> >>  {
> >>   return symtab->add_cgraph_insertion_hook(hook, data);
> >
> > ...this one aren't needed by any plugins upstream so maybe introduce them when
> > the needed arises?
> 
> Hrm, sure. I was just going off of Emese's v3. (And this is partially
> an artifact of basing off of v4.9-rc2... I'll refresh it to v4.10-rc2
> once it's out.)
> 
> > and the whole patch against gcc-common.h would also conflict
> > with the version i maintain and that you said you'd sync to so there's a decision
> > to be made regarding how this will is to be maintained...
> 
> What's easiest for you? I'm okay to carry "unused by upstream yet"
> functions and macros in gcc-common, though I don't like carrying lots
> of commented out stuff. :P

well, as i explained it the other day, my version has 'everything but the
kitchen sink' because i use it for development which isn't necessarily what
other projects need or want for themselves (e.g., consider the consequences
of Arnd's recent call to reduce the number of supported gcc versions, if that
goes anywhere above 4.5, gcc-common.h in linux can be further trimmed from my
version). at the end of the day this is a policy call and i'm not the one to
make it for linux ;).



