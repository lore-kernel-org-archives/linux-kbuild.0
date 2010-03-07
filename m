Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cable-static-49-187.intergga.ch ([157.161.49.187]:57312 "EHLO
	mail.ffwll.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754881Ab0CGVh7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Mar 2010 16:37:59 -0500
Date: Sun, 7 Mar 2010 22:30:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Patch eb8f844c "kbuild: specify absolute paths for cscope"
 breaks cscope use on NFS mounted source tree
Message-ID: <20100307213023.GB3794@viiv.ffwll.ch>
References: <1267784461.11737.37000.camel@zakaz.uk.xensource.com>
 <4B9416A7.203@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B9416A7.203@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ian Campbell <ijc@hellion.org.uk>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kbuild@vger.kernel.org

On Sun, Mar 07, 2010 at 10:12:07PM +0100, Michal Marek wrote:
> Daniel, how do we proceed here? Would
> $ make O=. cscope
> plus maybe a comment suggesting this, be an acceptable workaround for
> your use case (which was running vim from within a subdirectory, IIRC).

If this hack bites other people, just revert it and declare vim broken.
$ make O=. cscope
works as a workaround.

Pardon for the fuss, Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
