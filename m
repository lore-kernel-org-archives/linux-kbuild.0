Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.234]:50065 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756020AbYFNJ4p (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jun 2008 05:56:45 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2873617rvb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Jun 2008 02:56:45 -0700 (PDT)
Message-ID: <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
Date: Sat, 14 Jun 2008 10:56:45 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
In-Reply-To: <1213429403.26255.298.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

David Woodhouse:
> On Fri, 2008-06-13 at 22:52 +0100, Oleg Verych wrote:
>> Using same `gcc -E` principle, I once had a dream to create
>> build with something like "whole-kernel-at-time" optimising
>> compiler option:
>
> Doing it for the whole kernel probably doesn't buy you a whole lot more
> than doing it a bit more selectively, which is what I was doing in
> http://lkml.org/lkml/2006/8/24/212

I saw that. My point is pure text processing. But as it seems doing
`make` is a lot more fun than to do `sh` && `sed`. Latter, however, is basic
tool (`make` is system), which requires knowledge, experience and
commitment. Original `compilercache` (from its ideas ccache was
implemented in C) was simple shell script, and it beats `make` very hard in
general case. Even flex-based C semi-parser there is simple task for `sed`.

Understanding of non trivial `sed` scripts is also an issue as well as
maintaining. But if this creating and maintaining of let's say
"source profiles" is off-loaded for users, in the realm kernel developers
call the "wild", then things can be much easier.

If there was more than one kbuild developer or wide and skilled
community, then same ccache scheme with some kconfig fixes in form
of simple shell script could be available for kernel builds, including
external modules. If fact this is how up-to-date kbuild+kconfig can be
used and developed easily by other projects (klibc, busybox, ...).

It's nice to see how big Makefile now is going to be split, however.

> I think Segher has been playing with it a bit recently, and confirms my
> suspicion that combining kernel/ with arch/$ARCH/kernel, and mm/ with
> arch/$ARCH/mm, is also a big win.

The C with dumb #includes and #ifdef's is very-very obsolete technology.
Much more flexibility can be achieved with text processing, if size-
optimizing source annotations/transformation schemes, based on
human-developer knowledge, user's source profiles can be used.

> The GCC problems should mostly be fixed now, I think -- we just need to
> have another go at doing the Kbuild side of it properly.

One don't need to beg GCC developers for every feature, bug fix, that
kernel developers can actually use. Now almost nothing can be done without
compiler support.

One example: returning values && error codes using CPU/GPIO flags, thus
reducing size and CPU load.
-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
