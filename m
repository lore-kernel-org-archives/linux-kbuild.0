Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42045 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755117Ab1HGVBF convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Aug 2011 17:01:05 -0400
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	(authenticated bits=0)
	by smtp1.linux-foundation.org (8.14.2/8.13.5/Debian-3ubuntu1.1) with ESMTP id p77L13Mu023807
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-kbuild@vger.kernel.org>; Sun, 7 Aug 2011 14:01:04 -0700
Received: by wwe5 with SMTP id 5so826608wwe.1
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Aug 2011 14:01:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110807204118.GA2203@ZenIV.linux.org.uk>
References: <20110807204118.GA2203@ZenIV.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 7 Aug 2011 14:00:43 -0700
Message-ID: <CA+55aFxSOio5efktO+fQOL6qEaE2KBFyCcOcvNMOvWGpY-ktiQ@mail.gmail.com>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic reorg
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

On Sun, Aug 7, 2011 at 1:41 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>        I'm not sure if it's a good idea, but it might be possible to
> reduce the amount of boilerplate headers in arch/*/include/asm if we
> do the following:
>        1) move include/asm-generic to include/generic/asm and replace
> all references to asm-generic with generic/asm
>        2) add include/generic to search path for headers, right after
> arch/*/include
>        3) kill every arch/foo/include/asm/bar.h that has only
> #include <generic/asm/bar.h>
> in it.

I think we should do something like it, but not exactly that.

There is value in having <asm-generic/xyz.h> for *helper* headers that
are not complete in themselves. And for that case, we really do want
to have the ability for header files to just do

  #include <asm-generic/bitops/le.h>

or similar. And that should *not* be done with some kind of magic
automatic search-path thing: that is very consciously about "I want
that *particular* generic fragment".

However, having it for the default case for those full header files is
just annoying - as you say, those idiotic one-liner <asm/bar.h> files
that just include the asm-generic one are annoying, and quite frankly,
the current work-around for them (that "generic-y" thing) is not
really any better. It's just another way to do the same broken thing.

So I would suggest we just start a new directory, something like
include/default, and add it as the last entry to the search path. Then
we start populating it with <asm/xyz.h> files, and start removing the
silly 'generic-y' workaround. Let's just use the search-path instead.

The problem with 'generic-y' is that it literally is impossible to add
a new asm header file without editing all architectures: you still
have to add it to the 'generic-y' list for everybody. So generic-y
doesn't really *help* anything or make it any easier.

                                   Linus
