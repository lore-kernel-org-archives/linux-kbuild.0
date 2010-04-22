Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:43981 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755132Ab0DVQqx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Apr 2010 12:46:53 -0400
Date: Thu, 22 Apr 2010 18:46:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: subdir-ccflags problem
Message-ID: <20100422164651.GC22382@merkur.ravnborg.org>
References: <1271833758.3627.16.camel@jlt3.sipsolutions.net> <4BD02329.50606@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4BD02329.50606@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-kbuild@vger.kernel.org

On Thu, Apr 22, 2010 at 12:21:29PM +0200, Michal Marek wrote:
> On 21.4.2010 09:09, Johannes Berg wrote:
> > Hi,
> > 
> > When I specify subdir-ccflags in a Makefile, e.g. net/Makefile, but then
> > build using M=net/wireless/, kbuild doesn't seem to pick it up.
> > 
> > To me, that seems like a bug, but to my untrained eye it would appear to
> > be quite hard to fix. Thoughts?
> 
> For M=, this can't be fixed, because make M=$dir means "build external
> module which resides in $dir" (so the parent directories have no
> relevance). But even for 'make dir/subdir/' it would be hard to fix :-/.

Agree with Michal on this one. This is not easy to fix at all.

	Sam
