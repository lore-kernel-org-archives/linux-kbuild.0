Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35053 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753165AbbIWPq2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 11:46:28 -0400
Date: Wed, 23 Sep 2015 17:46:23 +0200
From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: [PATCH] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20150923154623.GB18173@wotan.suse.de>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <20150729205407.GC15480@cloud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150729205407.GC15480@cloud>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: josh@joshtriplett.org
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, mmarek@suse.com, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc

On Wed, Jul 29, 2015 at 01:54:07PM -0700, josh@joshtriplett.org wrote:
> On Wed, Jul 29, 2015 at 01:09:16PM -0700, Luis R. Rodriguez wrote:
> > From: "Luis R. Rodriguez" <mcgrof@suse.com>
> > 
> > Recursive dependency issues with kconfig are unavoidable due to
> > some limitations with kconfig, since these issues are recurring
> > provide a hint to the user how they can resolve these dependency
> > issues and also document why such limitation exists.
> > 
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: James Bottomley <jbottomley@odin.com>
> > Cc: Josh Triplett <josh@joshtriplett.org>
> > Cc: Paul Bolle <pebolle@tiscali.nl>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: Takashi Iwai <tiwai@suse.de>
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Michal Marek <mmarek@suse.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-kbuild@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
> 
> As a minor nit, I would suggest saying that making Kbuild handle this
> might require a full SAT solver, rather than the current phrasing that
> suggests that a SAT solver is the right solution to this problem.  Let's
> wait to make that conclusion until a kbuild patch shows up.

Thanks I've clarified this some more and expanding completely on the
section on SAT solver with some references for the eager beavers. I have
also found some other use cases for SAT solver on Linux but since that
is out of the scope of Kconfig I'll leave it outside of the patch but after
the commit log so even more eager beavers can take action.

> Otherwise, this seems quite sensible; thanks for documenting this bit of
> tribal knowledge.

Thanks, I'll respin finally.

  Luis
