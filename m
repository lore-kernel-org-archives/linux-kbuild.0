Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42726 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753341Ab3KSQLF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 11:11:05 -0500
Date: Tue, 19 Nov 2013 11:10:57 -0500
From: Benjamin Poirier <bpoirier@suse.de>
Subject: Re: [PATCH] kconfig: add comment about 'jump maybe used unitialized'
Message-ID: <20131119161057.GA7736@d2.synalogic.ca>
References: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
 <528B12CB.60407@linux.vnet.ibm.com>
 <528B39C0.2000703@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <528B39C0.2000703@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kbuild@vger.kernel.org, Christian Kujau <lists@nerdbynature.de>

On 2013/11/19 11:13, Michal Marek wrote:
> On 19.11.2013 08:27, Madhavan Srinivasan wrote:
> > On Tuesday 19 November 2013 02:33 AM, Yann E. MORIN wrote:
> >>
> >> Madhavan, Christian, if you could give a bit ;ore details on the distro
> >> you're using, that be nice so we can have a more descriptive commit log.
> > 
> > When I initially reported this issue, it was in gcc version 4.8.0
> > 20130526. And I am trying this now in a beta release of RHEL7 with gcc
> > version 4.8.1 20131002 (Red Hat 4.8.1-11) (GCC) and I still see the
> > reported issue.
> 
> In that case, I'd just give up and initialize jump to NULL. Worst case,
> we will get a segfault at runtime if a genuine bug is introduced into
> the function. What do you think?

I've tried it again on openSUSE 13.1 which has
gcc (SUSE Linux) 4.8.1 20130909 [gcc-4_8-branch revision 202388]
and I don't see the warning. I may be missing something because I've
also tried on Debian Wheezy (as reported by Christian Kujau) but I don't
see a warning either. It was on x86 however, not ppc.

In any case, given that it's been reported a few times I agree with
Michal and I'd do something like this:

-	struct jump_key *jump;
+	/* Initialize jump to work around a spurious warning emitted by
+	 * certain versions of gcc */
+	struct jump_key *jump = NULL;
