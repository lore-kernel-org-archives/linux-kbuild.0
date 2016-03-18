Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:33152 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753602AbcCRNCP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 09:02:15 -0400
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc
 4.8
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
 <3287558.oO5rz13nxZ@wuerfel> <56EBDBD0.6090001@synopsys.com>
 <4819806.6rjMriPpyK@wuerfel>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <56EBFC41.7010803@synopsys.com>
Date: Fri, 18 Mar 2016 18:31:53 +0530
MIME-Version: 1.0
In-Reply-To: <4819806.6rjMriPpyK@wuerfel>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 05:43 PM, Arnd Bergmann wrote:
> I think it's dangerous to use -O3 in one architecture when nothing else
> uses it. If you don't have a strong reason to use -O3, maybe just drop that
> use the default -O2 -Wmaybe-uninitialized like everyone else does.

I know what u mean. In fact top level makefile change has bitten us atleast once.
However ARC gcc tends to generate better code (likely others do too) at -O3 and
increased inlining etc reflects in several benchmarks. Maybe its due to the
micro-architecture and smaller hardware call return stack - I'm not sure. So I'm
ready to pay that maintenance price. And it has been like this for 5+ years and I
fear that switching to -O2 might unravel something unwarranted for.

OTOH, I'd rather prefer -O3 for all arches but that ain't gonna happen for obvious
reasons :-)

> On a related note, I have submitted a patch that turns CONFIG_CC_OPTIMIZE_FOR_SIZE
> into a choice statement, so we actually get the -Wmaybe-uninitialized warnings
> in an allyesconfig or allmodconfig build. It would be trivial to extend that
> to give the choice between -Os, -O2 and -O3, and then pick -O3 in a defconfig,
> over the -O2 default.

Is it posted already. I couldn't find it with quick googling.

Thx,
-Vineet
