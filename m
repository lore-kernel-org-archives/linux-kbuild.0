Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:42020 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751850AbbDTVYR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 17:24:17 -0400
Date: Mon, 20 Apr 2015 23:24:14 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH 0/2] Integrate compiler-gcc[345].h files into
 compiler-gcc.h
Message-ID: <20150420212414.GC2366@two.firstfloor.org>
References: <20150416162938.GU2366@two.firstfloor.org>
 <cover.1429212277.git.joe@perches.com>
 <20150420141713.e8611fcb6336ece7b4e84967@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150420141713.e8611fcb6336ece7b4e84967@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Segher Boessenkool <segher@kernel.crashing.org>, Sasha Levin <levinsasha928@gmail.com>, Anton Blanchard <anton@samba.org>, Alan Modra <amodra@gmail.com>

On Mon, Apr 20, 2015 at 02:17:13PM -0700, Andrew Morton wrote:
> On Thu, 16 Apr 2015 13:31:01 -0700 Joe Perches <joe@perches.com> wrote:
> 
> > Joe Perches (2):
> >   compiler-gcc.h: Neatening
> >   compiler-gcc: Integrate the various compiler-gcc[345].h files
> > 
> 
> We have at least three support-three-gcc-6 patchsets floating about. 
> Are we all happy with Joe's patchset?

It's fine for me.
> 
> 
> I expect Andi's
> http://ozlabs.org/~akpm/mmots/broken-out/lto-add-__noreorder-and-mark-initcalls-__noreorder.patch
> will need to be updated in response, which is why I didn't merge it.

I'll resend.

-Andi
> 

-- 
ak@linux.intel.com -- Speaking for myself only.
