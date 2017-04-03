Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:54273 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751479AbdDCU10 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 16:27:26 -0400
Date: Mon, 3 Apr 2017 22:20:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Kbuild.include: addtree: Remove quotes before matching
 path
Message-ID: <20170403202033.GB29829@ravnborg.org>
References: <20170318215823.GS4152@decadent.org.uk>
 <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
 <7bebf377-1268-ee02-c19b-f2d16d69cf79@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bebf377-1268-ee02-c19b-f2d16d69cf79@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable@vger.kernel.org, 856474@bugs.debian.org

On Mon, Apr 03, 2017 at 03:25:10PM +0200, Michal Marek wrote:
> On 2017-04-03 09:42, Masahiro Yamada wrote:
> > Each Makefile knows it wants to see
> > additional headers in the source tree, or objtree.
> > 
> > I am guessing the right approach in a long run is,
> > we require -I to specify $(srctree) or $(objtree) explicitly.
> > 
> > ccflags-y := -I$(srctree)/foo/bar/baz
> > 
> > or
> > 
> > ccflags-y := -I$(objtree)/foo/bar/baz
> > 
> > 
> > (For the latter, we can omit $(objtree)/ as it is ./)
> > 
> > 
> > Then, delete $(call flags,_c_flags) after the conversion.
> 
> Agreed. The addtree function is more of a hack to make things just work
> with O=, but AFAIK there is no clean way to implement VPATH for -I
> arguments. So it's sensible to get rid of the hack. It looks like it's
> going to be lot of work though:
> 
> $ git grep -e '-I' -- '*Makefile*' | wc -l
> 732
> $ git grep -e '-I *\$(\(src\|obj\)tree)' -- '*Makefile*' | wc -l
> 166

There was a goal long time ago that moving the kernel source should
not trigger a rebuild.
Any hardcoded path would violate this (like $(srctree), $(objtree))

I dunno if this is really something to aim for today.

I have personally from time to time renamed the directory where
I have kernel soruce (which is seen like moving the kernel source),
and would not be happy if this always triggered a full rebuild.
But this is frankly a corner case.

	Sam
