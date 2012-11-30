Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:33605 "EHLO
	viridian.itc.virginia.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030301Ab2K3UnJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 Nov 2012 15:43:09 -0500
Subject: Re: [PATCH 1/2] init.h: Remove __dev* sections from the kernel
Date: Fri, 30 Nov 2012 15:43:08 -0500
In-Reply-To: <50B91965.5030007@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20121130204308.7FDA08019A@viridian.itc.virginia.edu>
From: wfp5p@viridian.itc.virginia.edu (Bill Pemberton)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Jim Cromie <jim.cromie@gmail.com>, Borislav Petkov <borislav.petkov@amd.com>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Tony Lindgren <tony@atomide.com>, Jonathan Kliegman <kliegs@chromium.org>, Chris Zankel <chris@zankel.net>, Fengguang Wu <fengguang.wu@intel.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

H. Peter Anvin writes:
> 
> On 11/29/2012 10:43 AM, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > With the recent work to remove CONFIG_HOTPLUG, we are starting to get a
> > bunch of __devinit section warnings, despite CONFIG_HOTPLUG always being
> > enabled.  So, stop marking the sections entirely, by defining them away
> > the section markings in init.h
> >
> 
> Could we run a sed script over the kernel tree and generate patches to 
> remove the markings completely?
> 

That's how I've been generating the patches to remove the markings --
except it's a perl script.

-- 
Bill
