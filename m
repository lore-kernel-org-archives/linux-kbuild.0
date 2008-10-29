Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:38805 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327AbYJ2TGE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 15:06:04 -0400
Date: Wed, 29 Oct 2008 20:07:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: KBUILD: do not include arch/<ARCH>/include/asm in find-sources twice.
Message-ID: <20081029190707.GD22105@uranus.ravnborg.org>
References: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@hellion.org.uk>
Cc: linux-kbuild@vger.kernel.org

On Tue, Oct 28, 2008 at 01:36:25PM +0000, Ian Campbell wrote:
> Architectures which have moved their includes to arch/<ARCH>/include
> now list the headers twice in the source listing used by "make
> cscope" and friends, causing those tools to list symbols twice.
> 
> Skipping these files in the ALLSOURCE_ARCHS pass rather than removing
> the ALLINCLUDE_ARCHS pass preserves the semantics of the later.
> 
> Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: linux-kbuild@vger.kernel.org
> 
> diff -r a613b893f5b5 Makefile
> --- a/Makefile	Mon Oct 27 10:29:49 2008 +0000
> +++ b/Makefile	Tue Oct 28 13:33:04 2008 +0000
> @@ -1435,7 +1435,8 @@
>  define find-sources
>          ( for arch in $(ALLSOURCE_ARCHS) ; do \
>  	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
> -	            -name $1 -print; \
> +		    -wholename $(__srctree)arch/$${arch}/include/asm -type d -prune \
> +	            -o -name $1 -print; \
>  	  done ; \
>  	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
>  	       -name $1 -print; \
> 

Hi Ian.

I would much rather prefer to see a patch that
- support the platforms of arm and others
- uses the fact that all arch have their header files moved
  to arch/$ARCH/include
  [Ignore the archs that are lacking behind]

And if we could simplify this "find file" list on top of that it would be extra bonus.

	Sam
