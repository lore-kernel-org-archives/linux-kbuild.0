Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:54088 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932295AbcGKQTO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jul 2016 12:19:14 -0400
Date: Mon, 11 Jul 2016 17:19:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH RESEND] arm64: fix vdso-offsets.h dependency
Message-ID: <20160711161910.GE22099@e104818-lin.cambridge.arm.com>
References: <1463071155-7435-1-git-send-email-kevin.brodsky@arm.com>
 <20160708112759.GA22099@e104818-lin.cambridge.arm.com>
 <fd1c149d-fd08-cc90-4ba6-5d3217e835e7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd1c149d-fd08-cc90-4ba6-5d3217e835e7@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Michal Marek <mmarek@suse.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On Mon, Jul 11, 2016 at 04:29:26PM +0100, Kevin Brodsky wrote:
> On 08/07/16 12:27, Catalin Marinas wrote:
> >On Thu, May 12, 2016 at 05:39:15PM +0100, Kevin Brodsky wrote:
> >>I am not completely satisfied with the fix, since it uses a hack with
> >>the prepare and prepare0 rules that should not be used in arch
> >>Makefiles. However, all of my other attempts (including explicit
> >>dependencies on gettimeofday.S, etc. in arm64/kernel/Makefile) failed
> >>in some way. Hopefully, a Makefile wizard will come up with a better
> >>solution.
> >This is the patch I'm going to push to arm64 for-next/core. Thanks for
> >the report and attempt at fixing it, it saved me from trying to
> >understand what was going on:
> 
> First, thanks for taking care of this! Sorry for the delay in replying, I've been
> having trouble recently with my email client not showing up new messages in subfolders...
> 
> Now, unfortunately, I had already tried this solution (I think almost exactly this
> patch in fact), and it does not work. I confirmed this just now by applying the patch
> on master and compiling from a clean tree.The compilation of signal.c failed with:

I noticed this as well after an mrproper. The code seemed to be compiled
in order as long as there was an original generated/asm-offsets.h in
place.

> Therefore, please do not merge this patch, it can break the compilation quite easily.

Too late ;). But I'm reverting it now.

> > This indeed looks dodgy. I'm not sure about the makefile rules but would the above
> > override the "prepare" target in the top Makefile?
> 
> Rules are cumulative, they do not override each other. I am only making
> "vdso_prepare" an additional prerequisite of "prepare", with "vdso_prepare" depending
> on "prepare0" to ensure that asm-offsets.h is generated first. What is dodgy is that
> we are not supposed to add prerequisites to "prepare" in arch Makefiles, but again, I
> don't see how we can avoid doing that here. It seems to me that this is an oversight
> in the top-level Makefile, and I don't think that adding a prerequisite to "prepare"
> is unreasonable.

I'll merge your patch. An alternative would be to parse the vdso ELF at
run-time in the kernel and generate the offsets.

-- 
Catalin
