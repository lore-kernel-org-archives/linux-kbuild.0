Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47462 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbbJ1FCs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 01:02:48 -0400
Date: Wed, 28 Oct 2015 14:02:24 +0900
From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] merge_config misc reworks and testcases
Message-ID: <20151028050224.GB1854@malice.jf.intel.com>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com

On Wed, Oct 28, 2015 at 09:42:01AM +0900, Olof Johansson wrote:
> Hi,
> 
> Somewhat wide distribution list here, since I've added everyone who's
> touched the script, with the presumption that those have been the major
> users of it. Please make sure none of these changes break your use cases.

+Bruce. I think you were going to test these with the linux-yocto tooling. Did
you get a chance to run that test? I'd like your thoughts on the two comments
below:

> 
> I've done some reworks of merge_config.sh. I was quite hesitant to start
> this since there are no good ways to see if your changes break others
> or not, so the first thing I did was to add some tests. I know this is
> highly unorthodox so try not to panic. :-)
> 
> As far as what this series does is:
> 
> - Adds a way to pass in CONFIG_FOO=<value> on the command line, it gets
>   treated as a single-entry fragment file
> 
> - The script now prints the warnings on stderr, and returns non-0 when
>   something is encountered

This one might impact linux-yocto usage, Bruce? That said, it seems like the
right thing to do. So I'd still like to see it go in, but we may need to plan to
update the dependent tooling to use it.

> 
> - Optionally, it'll also return non-0 when a redundant entry is found. I
>   presumed people rely on -r not being a failure so I did this separately
> 
> - CONFIG_FOO=n and "# CONFIG_FOO is not set" is now treated the same,
>   and using the former doesn't cause an invalid warning when the results
>   are checked at the end
> 
> - Slightly odd things happened if a fragment contains the same option
>   twice: It'd produce a warning that was malformed. Now just ignore that
>   and use only the latest value of said option.

This one will likely impact usage as well. linux-yocto does want to report when
there is an override, not as an error, but for informational purposes - "Where
does my option get clobbered?"



-- 
Darren Hart
Intel Open Source Technology Center
