Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:49560 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754579Ab1EBQJp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2011 12:09:45 -0400
Date: Mon, 2 May 2011 09:09:43 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for May 2 (uml builds fail)
Message-Id: <20110502090943.4a978f4c.rdunlap@xenotime.net>
In-Reply-To: <20110502160405.GE15769@sepie.suse.cz>
References: <20110502150150.d932642f.sfr@canb.auug.org.au>
	<20110502081948.1ccb9aef.rdunlap@xenotime.net>
	<20110502160405.GE15769@sepie.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sam@ravnborg.org

On Mon, 2 May 2011 18:04:05 +0200 Michal Marek wrote:

> On Mon, May 02, 2011 at 08:19:48AM -0700, Randy Dunlap wrote:
> > On Mon, 2 May 2011 15:01:50 +1000 Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Changes since 20110429:
> > 
> > 
> > uml builds on i386 or x86_64 fail with: (I'm using O=outputdir if it matters)
> > 
> >   GEN     /lnx/src/NEXT/linux-next-20110502/UM64/Makefile
> > scripts/kconfig/conf --silentoldconfig arch/um/Kconfig.x86
> >   GEN     /lnx/src/NEXT/linux-next-20110502/UM64/Makefile
> > /lnx/src/NEXT/linux-next-20110502/scripts/Makefile.asm-generic:9: /lnx/src/NEXT/linux-next-20110502/arch/um/include/asm/Kbuild: No such file or directory
> > make[2]: *** No rule to make target `/lnx/src/NEXT/linux-next-20110502/arch/um/include/asm/Kbuild'.  Stop.
> 
> This patch should fix it.

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.


> Michal
> 
> Subject: [PATCH] kbuild: Fix Makefile.asm-generic for um
> 
> Do nothing if arch/$(SRCARCH)/include/asm/Kbuild does not exist, which
> is the case of um.
> 
> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
> index a687cb6..490122c 100644
> --- a/scripts/Makefile.asm-generic
> +++ b/scripts/Makefile.asm-generic
> @@ -6,7 +6,7 @@
>  # a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/asm)
>  
>  kbuild-file := $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> -include $(kbuild-file)
> +-include $(kbuild-file)
>  
>  include scripts/Kbuild.include
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
