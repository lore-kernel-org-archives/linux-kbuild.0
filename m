Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f227.google.com ([209.85.218.227]:41744 "EHLO
	mail-bw0-f227.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821AbZKFFh5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 6 Nov 2009 00:37:57 -0500
Message-ID: <4AF3B637.9060002@gmail.com>
Date: Fri, 06 Nov 2009 06:37:59 +0100
From: Carmelo Amoroso <carmelo73@gmail.com>
Reply-To: carmelo73@gmail.com
MIME-Version: 1.0
Subject: Re: Fast LKM symbol resolution
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
In-Reply-To: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

Alan Jenkins wrote:
> Here's my latest code using binary search for symbol resolution.  This
> version has benefited from a little more testing (heh), in particular
> running on a simulated ARM system.
> 
>     web: <http://github.com/sourcejedi/linux-2.6/commits/module-V2-beta1>
> 
>     git clone git://github.com/sourcejedi/linux-2.6.git module-V2-beta1
> 
> As before, it saves 0.3s boot time for a modular kernel on my netbook
> (630 Mhz Celeron M).  On that system it represents something like 90%
> of the maximum possible speedup.  It is claimed that slower systems
> would benefit from a further speedup (e.g. using hash tables instead),
> but we don't have any numbers to illustrate this yet.
> 
> 

Hi Alan,

I'm going to complete the port of the hash table work against the mainline
(I had an implementation based on older 2.6.23.17 and 2.6.30).
I have figures on sh4 arch (2.6.23.17) but I would like to provide you with benchmarks
using the mainline on x86 too.
In my implementation there are not arch specific parts.

I intend to provide this solution as optional for now, so this will force some
#ifdef in the code that could make it less clean, but if the solution is valuable,
I could do a code tidy-up later easily.

The work to use GNU hash & bloom filtering is almost completed too, but it needs
some more tests, so the first patches I'll send are based on the SysV hash table.

Apologies for the delay in providing patches.

Carmelo
