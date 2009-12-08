Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:54725 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753724AbZLHLDj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Dec 2009 06:03:39 -0500
Message-ID: <4B1E325E.2060307@suse.cz>
Date: Tue, 08 Dec 2009 12:02:54 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [patch 3/3] kconfig CROSS_COMPILE option
References: <200911172245.nAHMjEo9000533@imap1.linux-foundation.org>
In-Reply-To: <200911172245.nAHMjEo9000533@imap1.linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, sam@ravnborg.org, roland@redhat.com

On 17.11.2009 23:45, akpm@linux-foundation.org wrote:
> From: Roland McGrath <roland@redhat.com>
> 
> This adds CROSS_COMPILE as a kconfig string so you can store it in
> .config.  Then you can use plain "make" in the configured kernel build
> directory to do the right cross compilation without setting the
> command-line or environment variable every time.
> 
> With this, you can set up different build directories for different kernel
> configurations, whether native or cross-builds, and then use the simple:
> 
> 	make -C /build/dir M=module-source-dir
> 
> idiom to build modules for any given target kernel, indicating which one
> by nothing but the build directory chosen.
> 
> I tried a version that defaults the string with env="CROSS_COMPILE" so
> that in a "make oldconfig" with CROSS_COMPILE in the environment you can
> just hit return to store the way you're building it.  But the kconfig
> prompt for strings doesn't give you any way to say you want an empty
> string instead of the default, so I punted that.

This was posted in September, then superseded by the "save ARCH &
CROSS_COMPILE" patch (commit 5755433), which was then reverted because
it was causing too many issues (commit 2331d1a). In light of the revert,
I think I like Roland's patch: It's an optional feature, i.e if one does
not set the config option, nothing changes. So unless someone sees a
problem that I'm not seeing, I'll add this to for-next.

How to check for $ARCH consistency after the include/asm symlink removal
is another problem, separate from this.

Michal
