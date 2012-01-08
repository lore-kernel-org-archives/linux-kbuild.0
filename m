Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47792 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753466Ab2AHNYH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jan 2012 08:24:07 -0500
Date: Sun, 8 Jan 2012 14:24:03 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Correctly deal with make that has an argument which
 contains an "s"
Message-ID: <20120108132403.GA19887@sepie.suse.cz>
References: <1272315374-11951-1-git-send-email-jason.wessel@windriver.com>
 <4BD6CECC.9080507@suse.cz>
 <4F062846.50804@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F062846.50804@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: lkml <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>

On Thu, Jan 05, 2012 at 04:46:30PM -0600, Jason Wessel wrote:
> On 04/27/2010 06:47 AM, Michal Marek wrote:
> > On 26.4.2010 22:56, Jason Wessel wrote:
> >> When using remake, which is based on gnumake, if you invoke
> >> an example build as shown below, the build will become silent
> >> due to the top level make file incorrectly guessing that
> >> the end user wants a silent build because an argument that
> >> contained an "s" was used.
> >>
> >> remake --no-extended-errors
> > 
[...]
> This might be nearly a whole year later, but the problem is still
> there so perhaps we can reach some closure and get it fixed since it
> is fairly minor in the first place.  :-)

:-)


> Version 2 of the original patch is attached.

Thanks, applied.

Michal
