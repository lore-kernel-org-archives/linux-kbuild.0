Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39637 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757617AbbJHNhq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Oct 2015 09:37:46 -0400
Date: Thu, 8 Oct 2015 15:37:41 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH v4] kbuild: document recursive dependency limitation /
 resolution
Message-ID: <20151008133741.GA14213@sepie.suse.cz>
References: <1438200556-13842-1-git-send-email-mcgrof@do-not-panic.com>
 <1444259793-32486-1-git-send-email-mcgrof@do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444259793-32486-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Cc: josh@joshtriplett.org, jbottomley@odin.com, geert@linux-m68k.org, pebolle@tiscali.nl, herbert@gondor.apana.org.au, tiwai@suse.de, yann.morin.1998@free.fr, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, roberto@dicosmo.org, zack@upsilon.cc, mcgrof@suse.com, soos.mate@gmail.com, skl@det.ua.pt, iouliia@det.ua.pt, biere@jku.at, julia.lawall@lip6.fr, chidaph@gmail.com, wasowski@itu.dk, bergert@chalmers.se, mgorman@suse.de, vegard.nossum@gmail.com, kconfig-sat@googlegroups.com

On Wed, Oct 07, 2015 at 04:16:33PM -0700, Luis R. Rodriguez wrote:
> From: "Luis R. Rodriguez" <mcgrof@suse.com>
> 
> Recursive dependency issues with kconfig are unavoidable due to
> some limitations with kconfig, since these issues are recurring
> provide a hint to the user how they can resolve these dependency
> issues and also document why such limitation exists.
> 
> While at it also document a bit of future prospects of ways to
> enhance Kconfig, including providing formal semantics and evaluation
> of use of a SAT solver. If you're interested in this work or prospects
> of it check out the kconfig-sat project wiki [0] and mailing list [1].
> 
> [0] http://kernelnewbies.org/KernelProjects/kconfig-sat
> [1] https://groups.google.com/d/forum/kconfig-sat
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: James Bottomley <jbottomley@odin.com>
> Cc: Josh Triplett <josh@joshtriplett.org>
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mate Soos <soos.mate@gmail.com>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>

Applied to kbuild.git#kconfig, thanks.

Michal
