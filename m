Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:47030 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752511AbaBSGHh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Feb 2014 01:07:37 -0500
Date: Wed, 19 Feb 2014 07:07:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next
Message-ID: <20140219060717.GA25806@ravnborg.org>
References: <5303C695.4030403@converseincode.com>
 <20140219111753.23912fa4bdbfeba7aa6a6c52@canb.auug.org.au>
 <53041454.6090404@converseincode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53041454.6090404@converseincode.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Behan Webster <behanw@converseincode.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Jan-Simon =?iso-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>

> >>The LLVMLinux project is working on changes to the LLVM/clang toolchain
> >>as well as to the linux kernel code in order to be able to compile the
> >>kernel with clang.
> >I have no objection to this, but would like to see more of these patches
> >reviewed by (among others) the kbuild guys (cc'd).  I also could not find
> >some of these patches published on lkml (where I would expect to see
> >them).  And the top patch has a very uninformative commit message :-(
> Of course. That is the intention. I'll review all the commit
> messages as well.

Please send the patches as least to linux-kbuild for review.
I almost never go hunting for patches in a git repo for review,
and this is the same for others.

	Sam
