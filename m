Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:49970 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751412Ab2LWSog (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Dec 2012 13:44:36 -0500
Date: Sun, 23 Dec 2012 19:44:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fix: spaces in srctree and objtree paths no longer
	break builds.
Message-ID: <20121223184431.GA1685@merkur.ravnborg.org>
References: <CAK2BWArN+HmtQMYJ8R_sBMQsahrR8TYeTTsyLUU9AvvFJFD=dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK2BWArN+HmtQMYJ8R_sBMQsahrR8TYeTTsyLUU9AvvFJFD=dQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sunil Beta Baskar <betasam@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 23, 2012 at 08:59:20PM +0530, Sunil Beta Baskar wrote:
> Signed-off-by: Sunil Beta <betasam@gmail.com>
> ---
>  Makefile |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 07bc925..c2ae267 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -149,8 +149,13 @@ else
>  _all: modules
>  endif
> 
> -srctree        := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
> +srctree            := $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
>  objtree        := $(CURDIR)
> +
> +# FIX! spaces in path can break build
> +srctree         := $(shell echo $(srctree) | sed "s/ /\\\ /g" )
> +objtree         := $(shell echo $(objtree) | sed "s/ /\\\ /g" )
> +
>  src        := $(srctree)
>  obj        := $(objtree)

I applied your patch manually (the patch is broken).
My build failed like this:
  SYSHDR  arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h
/bin/sh: /home/sam/kernel/my\ space.git/arch/x86/syscalls/syscallhdr.sh: No such file or directory
make[1]: *** [arch/x86/syscalls/../include/generated/uapi/asm/unistd_32.h] Error 127

This it in other words not enough.

	Sam
