Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:59666 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751514AbcCRMOL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 08:14:11 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
Date: Fri, 18 Mar 2016 13:13:32 +0100
Message-ID: <4819806.6rjMriPpyK@wuerfel>
In-Reply-To: <56EBDBD0.6090001@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com> <3287558.oO5rz13nxZ@wuerfel> <56EBDBD0.6090001@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 16:13:28 Vineet Gupta wrote:
> On Friday 18 March 2016 03:59 PM, Arnd Bergmann wrote:
> > On Friday 18 March 2016 15:50:11 Vineet Gupta wrote:
> >> Sure, but I prefer this to be only for gcc 4.8 as this warning seems to be
> >> healthy in small doses  At least it keeps the door open for future discussion
> >> with gcc guys !
> > 
> > FWIW, testing on ARM with gcc-6.0 -O3, I also get tons of maybe-uninitialized
> > warnings. It's unlikely that this is architecture specific or fixed in newer
> > compiler versions.
> 
> So we disable this for good just like -Os.
> What a shame - seemed like a reasonable safety net for programming errors.

Yes, it's an immensely useful warning, if you manage to avoid the
false positives.

> >> The following nested construct actually works - does that look OK to you ?
> >>
> >> ARCH_CFLAGS += -O3 $(call cc-ifversion, -lt, 0408, $(call cc-disable-warning,maybe-uninitialized,))
> > 
> > Yes, that seems ok.
> 
> There was typo actually -lt needed to be -eq
> 
> > I don't really understand why -O3 is needed though, maybe it's better to
> > assume that it won't be needed in future gcc versions and do
> 
> Not sure what you mean, -O3 for triggering the warnings or -O3 in ARC makefile at all.
> Assuming it's latter, this is how its been forever and was added consciously as
> performance seemed better with -O3 than the default -O2.

I think it's dangerous to use -O3 in one architecture when nothing else
uses it. If you don't have a strong reason to use -O3, maybe just drop that
use the default -O2 -Wmaybe-uninitialized like everyone else does.

On a related note, I have submitted a patch that turns CONFIG_CC_OPTIMIZE_FOR_SIZE
into a choice statement, so we actually get the -Wmaybe-uninitialized warnings
in an allyesconfig or allmodconfig build. It would be trivial to extend that
to give the choice between -Os, -O2 and -O3, and then pick -O3 in a defconfig,
over the -O2 default.

	Arnd
