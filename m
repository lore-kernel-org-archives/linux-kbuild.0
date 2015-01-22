Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50108 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbbAVCXu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 Jan 2015 21:23:50 -0500
Message-ID: <54C05F33.6070703@infradead.org>
Date: Wed, 21 Jan 2015 18:23:47 -0800
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH] [RFC] kconfig: menuconfig make "Selected by:" readable
References: <1421881250.13638.10.camel@x220>
In-Reply-To: <1421881250.13638.10.camel@x220>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On 01/21/15 15:00, Paul Bolle wrote:
> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. Ie, it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
> 
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
> 
> Ie, transform the top level "||" tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read.

I agree that something like this needs to be done.

After reading these expressions for a few years, I can handle them OK, but
I expect that I look at them more than most people do (with the exception of Paul).

Here is another confusing one, at least to me:
[This is for LBDAF on a 64-biy x86 kernel config.]

Depends on: BLOCK [=y] && !64BIT [=y]

I guess that the value [y,m,n] inside the square brackets is always(?) the
symbol value (64BIT) and not the expression value (!64BIT), but that isn't
always clear IMO.


> Not-yet-signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Today I found myself wondering why a certain Kconfig was selected.
> Currently menuconfig's help is of no use in complicated cases. Please
> look at the help of USB or CRYPTO to see what I mean.
> 
> This is a _hack_ to show what might be a better way to do this. It
> parses a stringified version of the reverse dependency, and not the
> actual reverse dependecy expression. But that was easier to cobble
> together.
> 
> One cool improvement would be to change to minus in front of the
> subexpressions to Y or M for those that actually set the symbol. Anyhow,
> other suggestions and feedback is welcome.
> 
>  scripts/kconfig/menu.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 2 deletions(-)


-- 
~Randy
