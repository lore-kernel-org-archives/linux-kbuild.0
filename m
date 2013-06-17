Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:49914 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932683Ab3FQMF6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Jun 2013 08:05:58 -0400
Received: by mail-we0-f171.google.com with SMTP id m46so2294966wev.30
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2013 05:05:56 -0700 (PDT)
Date: Mon, 17 Jun 2013 14:05:45 +0200
From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v5 2/4] deb-pkg: split debug symbols in their own
 package
Message-ID: <20130617140545.315d4aec@serenity>
In-Reply-To: <1371268995.3776.13.camel@deadeye.wl.decadent.org.uk>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	<1371203217-19572-3-git-send-email-anisse@astier.eu>
	<1371268995.3776.13.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>

On Sat, 15 Jun 2013 05:03:15 +0100, Ben Hutchings <ben@decadent.org.uk> wrote :

> On Fri, 2013-06-14 at 11:46 +0200, Anisse Astier wrote:
> > This can reduce almost 3 times the size of the linux-image package,
> > while keeping the debug symbols available for this particular build, in
> > their own package.
> > 
> > This mimics the way kernels are built in debian, ubuntu, or with
> > make-kpkg, and comes at the price of a small slowdown in the building of
> > packages.
> [...]
> > @@ -128,6 +136,20 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
> >  		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
> >  		rmdir "$tmpdir/lib/modules/$version"
> >  	fi
> > +	if [ -n "$BUILD_DEBUG" ] ; then
> > +		(
> > +			cd $tmpdir
> > +			for module in $(find lib/modules/ -name *.ko); do
> [...]
> 
> Can shells generally cope with the list this produces for, say, an
> allmodconfig build?  My instinct would be to use xargs and while, but
> I'm willing to believe that this does work.

Did a quick test with an allmodconfig. It has 4038 modules. I'm pretty
sure it should work.

In bash 4.2.37, "for i in $(seq 50000000); do  :; done" does work,
although it ends up eating 5GB of memory.

Anisse
