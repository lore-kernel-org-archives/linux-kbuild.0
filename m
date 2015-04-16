Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:60491 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301AbbDPP43 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 11:56:29 -0400
Date: Thu, 16 Apr 2015 17:56:26 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] Support gcc 6 for building
Message-ID: <20150416155626.GT2366@two.firstfloor.org>
References: <1429127143-31745-1-git-send-email-andi@firstfloor.org>
 <552F6B7C.7020406@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552F6B7C.7020406@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andi Kleen <andi@firstfloor.org>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>

On Thu, Apr 16, 2015 at 09:57:48AM +0200, Michal Marek wrote:
> On 2015-04-15 21:45, Andi Kleen wrote:
> > From: Andi Kleen <ak@linux.intel.com>
> > 
> > gcc recently switched to a new version number scheme, where every version
> > gets a new major version number. The current version is 5.x, the next 6.x, etc.
> > 
> > The gcc git repository trunk branch just switched to report 6.x for the next
> > major release.
> > 
> > This breaks the way Linux selects compiler-gccX.h based on the major
> > version. Every new version would require adding a new compiler-gccX.h file,
> > which wouldn't really scale.
> > 
> > Let's assume that future gccs are fairly compatible (they are unlikely
> > to break anything Linux is relying on). So we can just keep using
> > compiler-gcc5.h, and select any specific differences with #if.
> 
> Good idea. With the new scheme, we could also merge back compiler-gcc5.h
> and compiler-gcc4.h. The only difference is the KASAN_ABI_VERSION define.

Would be fine too. Are you doing that, or should I send a patch?

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
