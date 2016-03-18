Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:54607 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbcCRNlg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 09:41:36 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
Date: Fri, 18 Mar 2016 14:41:03 +0100
Message-ID: <12216502.1fD0EQ8zlH@wuerfel>
In-Reply-To: <56EBFC41.7010803@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com> <4819806.6rjMriPpyK@wuerfel> <56EBFC41.7010803@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 18:31:53 Vineet Gupta wrote:
> 
> > On a related note, I have submitted a patch that turns CONFIG_CC_OPTIMIZE_FOR_SIZE
> > into a choice statement, so we actually get the -Wmaybe-uninitialized warnings
> > in an allyesconfig or allmodconfig build. It would be trivial to extend that
> > to give the choice between -Os, -O2 and -O3, and then pick -O3 in a defconfig,
> > over the -O2 default.
> 
> Is it posted already. I couldn't find it with quick googling.
> 
> 
https://lkml.org/lkml/2016/2/12/315

	Arnd
