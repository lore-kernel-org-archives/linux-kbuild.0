Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:60743 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab3FNPB2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 11:01:28 -0400
Received: by mail-we0-f173.google.com with SMTP id x54so604842wes.32
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2013 08:01:27 -0700 (PDT)
Date: Fri, 14 Jun 2013 17:01:13 +0200
From: Anisse Astier <anisse@astier.eu>
Subject: Re: [PATCH v5 0/4] deb-pkg: bring it a little closer to debian
 packaging
Message-ID: <20130614170113.1a58ed57@serenity>
In-Reply-To: <20130614135839.GM23955@vostochny.stro.at>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
	<20130614135839.GM23955@vostochny.stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

Hi Maximilian,

Thanks a lot for your review.

On Fri, 14 Jun 2013 13:58:39 +0000, maximilian attems <max@stro.at> wrote :

> On Fri, Jun 14, 2013 at 11:46:53AM +0200, Anisse Astier wrote:
> > These little fixes should bring debian packaging closer to the way it's done in debian.
> > 
> > Changes in:
> > v2:
> >  - only build debug packages when CONFIG_DEBUG_INFO=y
> >  - build debug package last.
> >  - more verbose debug package description
> >  - put package in section debug
> > v3:
> >  - remove duplicate code from v2
> > v4:
> >  - fixes thanks to Ben Hutchings' review
> >  - use KCONFIG_CONFIG instead of .config
> >  - use installed path specific to each architecture instead of hard-coded
> >    /boot/vmlinuz-$version, based on
> >    http://anonscm.debian.org/viewvc/kernel/dists/wheezy/linux/debian/rules.real?view=markup
> > v5:
> >  - fixes thanks to Ben Hutchings' review
> >  - don't use $objtree as it's redundant in build scripts
> >  - add symbolic links to vmlinux to work with other tools than perf
> >  - pick-up reviewed-by from ml for patch 3 and 4
> > 
> > 
> > Anisse Astier (4):
> >   deb-pkg: use KCONFIG_CONFIG instead of .config file directly
> >   deb-pkg: split debug symbols in their own package
> >   deb-pkg: fix installed image path on parisc, mips and powerpc
> >   deb-pkg: add a hook argument to match debian hooks parameters
> > 
> >  scripts/package/builddeb | 91 ++++++++++++++++++++++++++++++++++++++++--------
> >  1 file changed, 76 insertions(+), 15 deletions(-)
> 
> Thanks, whole series seems good to me,
> Acked those that seem really worthwile.
> Thanks for caring of parisc and stuff.
> 
> Rereading, I didn't see the motivation for the last change,
> explained in the commit message?
> IRC this distinction was done on purpose to allow distribution
> specific linux images to run different hooks.
> 

The motivation for the last patch was that I had hooks that only worked
with two arguments. As pointed by Ben Hutchings in his review, this is
contrary to the policy of the debian kernel handbook, as every hook must
support both the one-argument and two-argument cases.
My hooks have since been fixed, but I felt the patch would still be
useful for other persons working on derivatives that might not have read
the handbook and have scripts lying around using the two arguments-only.


Anisse

