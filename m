Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:38708 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750966AbbHEL53 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Aug 2015 07:57:29 -0400
Message-ID: <1438775840.30717.46.camel@tiscali.nl>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 05 Aug 2015 13:57:20 +0200
In-Reply-To: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: mmarek@suse.com, josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, herbert@gondor.apana.org.au, tiwai@suse.de, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, "Luis R. Rodriguez" <mcgrof@suse.com>

[Once again I removed Yann from the addresses used. I suppose I'll just
send a trivial patch to remove Yann's M: line for MAINTAINERS.]

Hi Luis,

On wo, 2015-07-29 at 13:09 -0700, Luis R. Rodriguez wrote:
> Recursive dependency issues with kconfig are unavoidable due to
> some limitations with kconfig, since these issues are recurring
> provide a hint to the user how they can resolve these dependency
> issues and also document why such limitation exists.
> 
> Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>

Like Josh and Marek I find this a good idea. Because I like the idea
I'll be critical.

> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -393,3 +393,25 @@ config FOO
>  	depends on BAR && m
>  
>  limits FOO to module (=m) or disabled (=n).
> +
> +Kconfig recursive dependency limitations
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +If you've hit the Kconfig error: "recursive dependency detected" you've run
> +into a recursive dependency issue with Kconfig. Kconfig does not do recursive
> +dependency resolution,

(True. But what could Kconfig do other than note that a chain of
select's and depend on's makes it run in circles? See below.)

>  this has a few implications for Kconfig file writers. In
> +practice it means that for instance if a driver A selects a few kconfig symbols
> +another driver B which selects any of these symbols cannot negate any of the
> +symbols the driver A selected.

I'm afraid I don't follow this.

> Because of this current limitation developers
> +who run into this type of recursive dependency issue have two diverging
> +options:
> +
> +  a) Either swap all "select FOO" to "depends on FOO" or,

all? "one or more" perhaps.

> +  b) Change the offending "depends on FOO" to "select FOO"

"the offending"? We're looking at a circle. So maybe:
    Change one or more "depends on BAR" to "select BAR"   

Which are both variations on a theme: stop running in circles. See below
for a (too?) small sample of 22 solutions I could easily find in git's
log. Swapping one or more select's with depend on's was done in two
thirds of these solutions.

> +Kconfig's limitations can be addressed by implementing a SAT solver for it,

Unlike Josh, I'm not familiar with SAT solvers, so it's hard to comment
on this.

But given the two building blocks involved:
    depends on
    select

it's clear you can make Kconfig run in circles. (Using only blocks of
one of those types could do that too. Kconfig uses both building blocks.
And in practice we always see blocks of both types involved when we make
Kconfig run in circles.)

What would a SAT solver do once it makes the obvious observation that
certain combinations of these two building blocks are circular?

> +but until then, Kconfig is limitted to require developers to use one of
> +the above two mechanisms to address recursive dependency issues. For more
> +details you can refer to this thread and discussion:
> +
> +http://lkml.kernel.org/r/1432241149-8762-1-git-send-email-mcgrof@do-not-panic.com

> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1117,6 +1117,8 @@ static void sym_check_print_recursive(struct

> +			fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
> +			fprintf(stderr, "section \"Kconfig recursive dependency limitations\"\n");

Nit: subsection.

Sorry for being so verbose. And thanks for doing this!


Paul Bolle


sample of solutions for recursive dependency errors
===================================================

21 commits contain the quote "recursive dependency detected". They
contain 22 fixes for 21 errors. (One error was solved twice. One commit
contained two fixes.)

All errors appear to involve one or more select's and one or more depend
on's.

commit		fix
======  	===
06b718c01208	select A -> depends on A
c22eacfe82f9	depends on A -> depends on B
6a91e854442c	select A -> depends on A
118c565a8f2e	select A -> select B
f004e5594705	select A -> depends on A
c7861f37b4c6	depends on A -> (null)
80c69915e5fb	select A -> (null)		(1)
c2218e26c0d0	select A -> depends on A	(1)
d6ae99d04e1c	select A -> depends on A
95ca19cf8cbf	select A -> depends on A
8f057d7bca54	depends on A -> (null)
8f057d7bca54	depends on A -> select A
a0701f04846e	select A -> depends on A
0c8b92f7f259	depends on A -> (null)
e4e9e0540928	select A -> depends on A	(2)
7453ea886e87	depends on A > (null)		(1)
7b1fff7e4fdf	select A -> depends on A
86c747d2a4f0	select A -> depends on A
d9f9ab51e55e	select A -> depends on A
0c51a4d8abd6	depends on A -> select A	(3)
e98062ed6dc4	select A -> depends on A	(3)
91e5d284a7f1	select A -> (null)     


(1) Partial (or no) quote of error.
(2) That seems to be the gist of that fix.
(3) Same error.
