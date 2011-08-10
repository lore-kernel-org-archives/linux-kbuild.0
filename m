Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:37872 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750922Ab1HJPez (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Aug 2011 11:34:55 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com [74.125.82.174])
	(authenticated bits=0)
	by smtp1.linux-foundation.org (8.14.2/8.13.5/Debian-3ubuntu1.1) with ESMTP id p7AFYOcU029527
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Aug 2011 08:34:25 -0700
Received: by wyg24 with SMTP id 24so800850wyg.19
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Aug 2011 08:34:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E4254E1.5070909@suse.cz>
References: <20110807204118.GA2203@ZenIV.linux.org.uk> <CA+55aFxSOio5efktO+fQOL6qEaE2KBFyCcOcvNMOvWGpY-ktiQ@mail.gmail.com>
 <4E4254E1.5070909@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 10 Aug 2011 08:34:04 -0700
Message-ID: <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic reorg
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>

On Wed, Aug 10, 2011 at 2:52 AM, Michal Marek <mmarek@suse.cz> wrote:
>
> But we would still have to generate the wrapper for userspace headers,
> we can't rely on any -I/usr/include/default in userspace. So
> Makefile.headersinst would still need some special handling for these
> headers.

So at least for some cases, that isn't an issue, because these things
wouldn't be exported anyway.

An example of this kind of situation that we had recently was the x86
use of "rdrand()", where the logical thing to do was to create a new
arch-specific include file containing "arch_get_random_word()", and
have a default implementation that just returned 0.

That's actually annoyingly hard to do.

You can do it by (a) *not* creating a new header file and (b) using an
extern declaration and (c) using a weak function that returns 0, and
that way you don't need to touch any architecture files. But I really
wanted an inline function, because the whole point was to not generate
any code for the case of the architecture not supporting it.

Of course, you can also do the same thing by just introducing another
CONFIG option, and hide the architectures that don't support it that
way. We've done that lots of time. It works, but it's annoying and
makes the code harder to read.

Or you can do it by creating the default file, and then editing EVERY
SINGLE ARCHITECTURE. Which just sucks.

This has come up before, for similar situations - wanting to implement
optional architecture capabilities without having to worry about
architectures that don't support it.

                         Linus
