Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45341 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751140AbaFMLjf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2014 07:39:35 -0400
Message-ID: <539AE2F5.30301@suse.cz>
Date: Fri, 13 Jun 2014 13:39:33 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] builddeb: fix missing headers in linux-headers package
References: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>
In-Reply-To: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Maximilian Attems <maks@debian.org>

Dne 15.4.2014 13:51, Fathi Boudra napsal(a):
> The kernel headers package (linux-headers) doesn't include several
> header files required to build out-of-tree modules.
> 
> It makes the package unusable on e.g. ARM architecture:
>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
>  fatal error: mach/memory.h: No such file or directory
>  #include <mach/memory.h>
>  ^
>  compilation terminated.
> 
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  Changes from v1:
>  - add missing module.lds, mips/Kbuild.platforms and Platform files
>  - generically look for all include directories in arch/$SRCARCH

Ben, is this version OK to merge? Does the package now match the
official Debian ones?

Thanks,
Michal


>  scripts/package/builddeb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f46e4dd..42b1e20 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -287,9 +287,11 @@ EOF
>  
>  fi
>  
> -# Build header package
> +# Build kernel header package
>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
>  (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
> +(cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform >> "$objtree/debian/hdrsrcfiles")
> +(cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f >> "$objtree/debian/hdrsrcfiles")
>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"



