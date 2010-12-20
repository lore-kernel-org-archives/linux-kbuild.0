Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from service87.mimecast.com ([94.185.240.25]:37711 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932512Ab0LTQsg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 11:48:36 -0500
Subject: Re: [PATCHv2] kconfig: simplify
 select-with-unmet-direct-dependency warning
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <20101220151047.GB20492@sepie.suse.cz>
References: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
	 <20101220151047.GB20492@sepie.suse.cz>
Date: Mon, 20 Dec 2010 16:48:28 +0000
Message-ID: <1292863708.10292.7.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org

On Mon, 2010-12-20 at 15:10 +0000, Michal Marek wrote:
> On Mon, Dec 06, 2010 at 02:27:49PM -0500, Arnaud Lacombe wrote:
> > This is an attempt to simplify the expressing printed by kconfig when a
> > symbol is selected but still has direct unmet dependency.
> >
> > First, the symbol reverse dependency is split in sub-expression. Then,
> > each sub-expression is checked to ensure that it does not contains the
> > unmet dependency. This removes all the false-positive symbols which
> > already have the correct dependency. Finally, only the symbol doing the
> > "select" is printed, instead of the full dependency tree.
> >
> > CC: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> > ---
> >  scripts/kconfig/expr.c      |   35 ++++++++++++++++++++++++++++++++++-
> >  scripts/kconfig/lkc_proto.h |    2 +-
> >  scripts/kconfig/symbol.c    |    6 +++++-
> >  3 files changed, 40 insertions(+), 3 deletions(-)
> 
> I applied this to kbuild-2.6.git#kconfig now. If someone encounters a
> warning that hides the actual culprit due to this patch, we will have to
> solve it somehow, but otherwise these simplified expressions are wanted
> IMO.

It indeed simplified some of the long expressions but the resulting
expression looks slightly different. The original warning (I temporarily
removed the ARM CPU_32v6K dependency on CPU_V7 to trigger it):

warning: (CPU_V7 && !ARCH_OMAP2 || CPU_MMP2 && ARCH_MMP) selects
CPU_32v6K which has unmet direct dependencies (CPU_V6)

With this patch, I get:

warning: (CPU_V7 && CPU_MMP2) selects CPU_32v6K which has unmet direct
dependencies (CPU_V6)

Shouldn't we have a '||' between CPU_V7 and CPU_MMP2 (or something else,
comma)?


BTW, unrelated to this patch, I noticed this warning from CPU_MMP2 which
in general shouldn't happen:

config CPU_32v6K
	bool
	depends on CPU_V6

config CPU_MMP2
	bool
	select CPU_V6
	select CPU_32v6K

CPU_MMP2 selects both CPU_V6 and CPU_32v6K but we still get the warning
form CPU_MMP2. Is there an easy way to solve this?

-- 
Catalin


