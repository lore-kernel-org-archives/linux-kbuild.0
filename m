Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueueb.post.tele.dk ([193.162.153.10]:46463 "EHLO
	pqueueb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752475Ab0FFSQb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Jun 2010 14:16:31 -0400
Date: Sun, 6 Jun 2010 20:16:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/7] Add a target to use the Coccinelle checker
Message-ID: <20100606181607.GA15535@merkur.ravnborg.org>
References: <1275837307-4283-1-git-send-email-npalix@diku.dk> <1275837307-4283-2-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1275837307-4283-2-git-send-email-npalix@diku.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Am?rico Wang <xiyou.wangcong@gmail.com>, Andy Isaacson <adi@hexapodia.org>, Linus Torvalds <torvalds@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, walter harms <wharms@bfs.de>, Joerg Roedel <joro@8bytes.org>, Jan Engelhardt <jengelh@medozas.de>

On Sun, Jun 06, 2010 at 05:15:01PM +0200, Nicolas Palix wrote:
> A 'coccicheck' target is added. It can be called with four different
> modes. Each one generates a different kind of output, i.e. context,
> patch, org, report, according to the corresponding mode to be
> activated.
> 
> The new target calls the 'coccicheck' front-end in the 'scripts'
> directory with the MODE argument. Every SmPL file in the
> subdirectories of 'scripts/coccinelle' is then given to the front-end
> and applied to the entire source tree.
> 
> The four modes behave as follows:
> 
> 'report' generates a list in the following format:
>   file:line:column-column: message
> 
> 'patch' proposes a fix, when possible.
> 
> 'context' highlights lines of interest and their context in a
> diff-like style. Lines of interest are indicated with '-'.
> 
> 'org' generates a report in the Org mode format of Emacs.
> 
> Signed-off-by: Nicolas Palix <npalix@diku.dk>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Hi Nicolas.

This is almost what I had in mind - thanks.

Most importantly it no longer add all the stuff
to the top-level Makefile but defer this to a script.

If/when we decide to move all the checkers to scripts/*
we can do the last adjustments.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
