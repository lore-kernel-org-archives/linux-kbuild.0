Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml102.kpnxchange.com ([195.121.3.6]:51032 "EHLO
	CPSMTPM-EML102.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751876AbZDAQIB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 12:08:01 -0400
From: Frans Pop <elendil@planet.nl>
Subject: Comments on deb-pkg patch series
Date: Wed, 1 Apr 2009 18:07:56 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904011807.57574.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Below some comments on the patch series submitted yesterday by Maximilian 
Attems. I was not subscribed to the kbuild list, so apologies for 
breaking the thread. It would have been nice if the patches had been CCed 
to lkml for general review.

I have some patches of my own that I'll submit later today.

FYI: Like Max I am a DD, but unlike him I'm not a member of the kernel 
teamm. I have however been using the deb-pkg target intensively over the 
past year and a half for all my kernel testing on 4 different arches.

General comment:
It looks to me as if this patch series is trying to make the deb-pkg 
target into something it is not. It is not a target that produces perfect 
and Debian policy-compliant packages. Instead it is a very basic method 
to create an installable kernel image package direct from upstream 
source.

[PATCH 1/7] deb-pkg: Beautify changelog
            http://marc.info/?l=linux-kbuild&m=123851278623264&w=2

> -  * A standard release
> +  * New upstream release

In my own patch series I have an alternative, which IMO better matches the 
purpose of deb-pkg:
-  * A standard release
+  * Custom built Linux kernel.

The name and email changes seem somewhat overengineered to me, but 
otherwise no objection.

[PATCH 2/7] deb-pkg: Fix Provides field
            http://marc.info/?l=linux-kbuild&m=123851274923192&w=2

No objection.

[PATCH 3/7] deb-pkg: bump standards version
            http://marc.info/?l=linux-kbuild&m=123851275023204&w=2

As deb-pkg only creates binary packages and does not have a source 
package, the created package is not actually source compliant. Instead of 
updating the Standards-Version field we could also simply drop it (as it 
is not strictly required). IMO it's fairly bogus anyway and would make 
for one less thing to maintain.

No strong objection though.

[PATCH 4/7] deb-pkg: Fix Section and Source field
            http://marc.info/?l=linux-kbuild&m=123851275123210&w=2

I strongly disagree with this patch.

linux-2.6 is the source package for official Debian kernels and packages 
built using deb-pkg are NOT built from that source package.
IMO there's no need to change it (the field is required and thus cannot 
simply be dropped). If it does want changing for some reason I'd suggest
"linux-upstream" or similar.

[PATCH 5/7] deb-pkg: Generate a debian/copyright
            http://marc.info/?l=linux-kbuild&m=123851274923195&w=2

As the generated package is not policy compliant anyway, I see see no real 
reason to burden it with a copyright file. No strong objection though.

> +Copyright: 1991 - 2008 Linus Torvalds and others.
s/2008/2009/
> +git://git.eu.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
s/eu.//

Also, the git reference is somewhat random as deb-pkg can just as well be 
used to build kernels from any other source tree (stable, mm, tip, ...).

[PATCH 6/7] deb-pkg: Fix generated packagename
            http://marc.info/?l=linux-kbuild&m=123851275023201&w=2

This is not actually a "fix". There's nothing really wrong with the 
current package name, and I actually like the fact that packages built 
using deb-pkg are in a somewhat different namespace than the official 
Debian kernel image packages.

I'd prefer to leave this unchanged, but have no hard objection.

[PATCH 7/7] deb-pkg: generate changelog, copyright and control on demand
            http://marc.info/?l=linux-kbuild&m=123851275123207&w=2

NAK!

This completely breaks the most common use case of deb-pkg. This patch 
would mean that every package would get identical (and incorrect) version 
info in the Debian maintainer files unless you manually clean the debian 
directory before each build.
One of the really great things of deb-pkg is that you can simply 
repeatedly call it after checking out different branches (and cross-build 
for different arches) or during bisections without having to worry about 
such things.

Cheers,
FJP
