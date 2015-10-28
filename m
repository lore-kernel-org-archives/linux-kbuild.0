Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36667 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964841AbbJ1HFp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 03:05:45 -0400
Date: Wed, 28 Oct 2015 16:05:32 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] merge_config misc reworks and testcases
Message-ID: <20151028070532.GJ1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
 <20151028050224.GB1854@malice.jf.intel.com>
 <56305D93.5020702@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56305D93.5020702@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 01:30:59AM -0400, Bruce Ashfield wrote:
> On 10/28/2015 01:02 AM, Darren Hart wrote:
> >On Wed, Oct 28, 2015 at 09:42:01AM +0900, Olof Johansson wrote:
> >>- The script now prints the warnings on stderr, and returns non-0 when
> >>   something is encountered
> >
> >This one might impact linux-yocto usage, Bruce? That said, it seems like the
> >right thing to do. So I'd still like to see it go in, but we may need to plan to
> >update the dependent tooling to use it.
> 
> I don't directly let the merge_config output be visible, but capture it
> and then do more processing later. So while this may mean that I have
> to update some wrappers to capture stderr, it shouldn't be a big deal.
> 
> >
> >>
> >>- Optionally, it'll also return non-0 when a redundant entry is found. I
> >>   presumed people rely on -r not being a failure so I did this separately
> >>
> >>- CONFIG_FOO=n and "# CONFIG_FOO is not set" is now treated the same,
> >>   and using the former doesn't cause an invalid warning when the results
> >>   are checked at the end
> >>
> >>- Slightly odd things happened if a fragment contains the same option
> >>   twice: It'd produce a warning that was malformed. Now just ignore that
> >>   and use only the latest value of said option.
> >
> >This one will likely impact usage as well. linux-yocto does want to report when
> >there is an override, not as an error, but for informational purposes - "Where
> >does my option get clobbered?"
> 
> I haven't looked at the patches yet (and I will shortly), but if that
> is within a single fragment, I can live with it going away, since it is
> easy to check that outside of the merge script.
> 
> But if this is a redefinition between fragments, that's something different
> and something that I capture and report to users, and yes, I
> currently take it from the output of the merge_config run. If it goes
> away, I'd have to recreate it somehow.
> 
> So if this can at least be maintained as enabled via a parameter, that
> would be be ideal. Otherwise, I'll have to recreate the output some
> other way.

It still reports redundancies across different fragments. It just fixes the grep
so it doesn't display two options from the same file.

-- 
Darren Hart
Intel Open Source Technology Center
