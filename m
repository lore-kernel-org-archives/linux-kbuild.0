Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:45302 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753060Ab1AQWcz (ORCPT <rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Mon, 17 Jan 2011 17:32:55 -0500
Message-ID: <4D34C38F.70807@suse.cz>
Date: Mon, 17 Jan 2011 23:32:47 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix for scripts/builddeb (non-x86, and with output option)
References: <4D34C237.306@eecg.toronto.edu>
In-Reply-To: <4D34C237.306@eecg.toronto.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Livio Soares <livio@eecg.toronto.edu>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kbuild@vger.kernel.org

On 17.1.2011 23:27, Livio Soares wrote:
> 
>    Hi Michal and Ted,

Hi,

please do not send patches privately, CC at least the linux-kbuild
mailing list. I'll have a look at your patch tomorrow.

Michal

> 
>    I've just tried to build Debian  packages on the git version of the
> Linux  kernel, and  the  build  failed while  trying  to generate  the
> headers package.  The  problem seems to come from 2  issues: (1) I use
> the 'O=' option to place build files out of the source tree, and (2) I
> build using both x86 and powerpc architectures.
> 
>    The build seems to have been broken by commit:
> cd8d60a20a4516016c117ac0f1ac7b06ff606f7e 
> 
>    I'm attaching  a patch  that fixes both  issues on my  system. Feel
> free to tweak/adapt if you see any problems with it.
> 
>    Cheers,
> 
> 		Livio
> 
> Signed-off-by: Livio Soares <livio@eecg.toronto.edu>
> 
> From 24aa58ab53b9adfa1a6f8269e470d5f554627be9 Mon Sep 17 00:00:00 2001
> From: Livio Soares <livio@eecg.toronto.edu>
> Date: Mon, 17 Jan 2011 15:29:06 -0500
> Subject: [PATCH] Two fixes to builddeb script, regarding the built of header package:
> 
> 1) Previous behavior assumed the build was executed inside the
>    source tree (no 'O=' option).
> 
> 2) Previous behavior assumed 'x86' architecture.
> ---
>  scripts/package/builddeb |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b0b2357..418d3fa 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -238,13 +238,13 @@ EOF
>  fi
>  
>  # Build header package
> -find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$
> -find arch/x86/include include scripts -type f >> /tmp/files$$
> -(cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$)
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> -tar -c -f - -T /tmp/files$$ | (cd $destdir; tar -xf -)
> -(cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
> +(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$;
> +    find arch/${SRCARCH}/include include scripts -type f >> /tmp/files$$;
> +    tar -c -f - -T /tmp/files$$ | (cd $destdir; tar -xf -) )
> +(cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$; 
> +    tar -c -f - -T /tmp/objfiles$$ | (cd $destdir; tar -xf -) )
>  rm -f /tmp/files$$ /tmp/objfiles$$
>  arch=$(dpkg --print-architecture)
>  

