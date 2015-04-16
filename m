Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0240.hostedemail.com ([216.40.44.240]:51573 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752545AbbDPQbs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 12:31:48 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 0C1D65DDD6
	for <linux-kbuild@vger.kernel.org>; Thu, 16 Apr 2015 16:23:17 +0000 (UTC)
Message-ID: <1429201390.2850.54.camel@perches.com>
Subject: Re: [PATCH] Support gcc 6 for building
From: Joe Perches <joe@perches.com>
Date: Thu, 16 Apr 2015 09:23:10 -0700
In-Reply-To: <20150416155626.GT2366@two.firstfloor.org>
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
	 <552F6B7C.7020406@suse.cz> <20150416155626.GT2366@two.firstfloor.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Michal Marek <mmarek@suse.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>

On Thu, 2015-04-16 at 17:56 +0200, Andi Kleen wrote:
> On Thu, Apr 16, 2015 at 09:57:48AM +0200, Michal Marek wrote:
> > On 2015-04-15 21:45, Andi Kleen wrote:
> > > From: Andi Kleen <ak@linux.intel.com>
> > > 
> > > gcc recently switched to a new version number scheme, where every version
> > > gets a new major version number. The current version is 5.x, the next 6.x, etc.
> > > 
> > > The gcc git repository trunk branch just switched to report 6.x for the next
> > > major release.
> > > 
> > > This breaks the way Linux selects compiler-gccX.h based on the major
> > > version. Every new version would require adding a new compiler-gccX.h file,
> > > which wouldn't really scale.
> > > 
> > > Let's assume that future gccs are fairly compatible (they are unlikely
> > > to break anything Linux is relying on). So we can just keep using
> > > compiler-gcc5.h, and select any specific differences with #if.
> > 
> > Good idea. With the new scheme, we could also merge back compiler-gcc5.h
> > and compiler-gcc4.h. The only difference is the KASAN_ABI_VERSION define.
> 
> Would be fine too. Are you doing that, or should I send a patch?

As compiler-gcc3.h is trivial, what about integrating
the whole thing into a single file and get rid of the
compiler-gcc<version>.h files?

That would deduplicate the __must_check and __used macros.

I added Sasha Levin to the cc's as he was the only
complainant the first time I suggested this.

https://lkml.org/lkml/2014/9/4/675

