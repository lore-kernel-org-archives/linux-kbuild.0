Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:35888 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756924Ab3EHRoo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 13:44:44 -0400
Message-ID: <518A8EE6.90206@infradead.org>
Date: Wed, 08 May 2013 10:44:06 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: make sparse (CHECK) user-selectable
References: <1368026580-26897-1-git-send-email-pc+lkml@asdf.org>
In-Reply-To: <1368026580-26897-1-git-send-email-pc+lkml@asdf.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Phil Carmody <pc+lkml@asdf.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/08/13 08:23, Phil Carmody wrote:
> I've got a tweaked version as well as the system default,
> so make the sparse binary that's run user-selectable.
> 

I'm confused about why this patch is necessary since I already do

$ make O=builddir CHECK=/path/to/sparse all

> Signed-off-by: Phil Carmody <pc+lkml@asdf.org>
> ---
>  Makefile |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a3a834b..e7a4851 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -338,7 +338,9 @@ GENKSYMS	= scripts/genksyms/genksyms
>  INSTALLKERNEL  := installkernel
>  DEPMOD		= /sbin/depmod
>  PERL		= perl
> -CHECK		= sparse
> +ifndef CHECK
> +  CHECK		= sparse
> +endif
>  
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void $(CF)
> 


-- 
~Randy
