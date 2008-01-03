Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from miranda.se.axis.com ([193.13.178.8]:60274 "EHLO
	miranda.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120AbYACREL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jan 2008 12:04:11 -0500
Date: Thu, 3 Jan 2008 18:03:22 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: (Try #3) [Patch 4/8] CRIS: Remove 'TOPDIR' from Makefiles
Message-ID: <20080103170322.GC9512@axis.com>
References: <20080101071311.GA2496@hacking> <20080101072922.GE2496@hacking> <20080101102010.GD28913@uranus.ravnborg.org> <20080101133421.GD2499@hacking> <20080102062759.GF2493@hacking> <20080102192535.GC11217@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080102192535.GC11217@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Mikael Starvik <mikael.starvik@axis.com>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@osdl.org>, dev-etrax@axis.com, Andreas Schwab <schwab@suse.de>

On Wed, Jan 02, 2008 at 08:25:35PM +0100, Sam Ravnborg wrote:
> On Wed, Jan 02, 2008 at 02:27:59PM +0800, WANG Cong wrote:
> > 
> > Refine it as suggested by Andreas.
> > 
> > -------->
> > 
> > This patch removes TOPDIR from Cris Makefiles.

We had the TOPDIR replaced with $(srcdir) already, but this looks better.

Compiles OK for both EtraxFS and ARTPEC-3 cpus in our tree.

> > Cc: Mikael Starvik <starvik@axis.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Andreas Schwab <schwab@suse.de>
> > Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
> 
> Added Jesper to Cc and applied.

Thanks!

> 	Sam

/^JN - Jesper Nilsson
--
               Jesper Nilsson -- jesper.nilsson@axis.com
