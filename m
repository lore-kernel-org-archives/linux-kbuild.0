Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:40042 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965109AbbBBXnO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Feb 2015 18:43:14 -0500
Date: Mon, 2 Feb 2015 15:43:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] tools: unbreak 'make tools/*'
Message-ID: <20150202234309.GB3992@ld-irv-0074>
References: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422506856-28631-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Borislav Petkov <bp@suse.de>, Arnaldo Carvalho de Melo <acme@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Ping?

On Wed, Jan 28, 2015 at 08:47:36PM -0800, Brian Norris wrote:
> The following targets should be supported from the top-level source
> directory, but were broken by commit 7e1c04779efd ("kbuild: Use relative
> path for $(objtree)"):
> 
>  $ make tools/
>  $ make tools/perf
>  $ make O=$(BUILDDIR) tools/perf
> 
> The tools/ and tools/% targets are passing the top-level build directory
> as an O= argument, so we need a full path, not a relative one, as the
> $(O) variable will be reinterpreted by the sub-makefile.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Michal Marek <mmarek@suse.cz>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 95a0e827ecd3..59033c8bf93a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1496,11 +1496,11 @@ image_name:
>  # Clear a bunch of variables before executing the submake
>  tools/: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
> -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/
> +	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(CURDIR) subdir=tools -C $(src)/tools/
>  
>  tools/%: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
> -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(objtree) subdir=tools -C $(src)/tools/ $*
> +	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(CURDIR) subdir=tools -C $(src)/tools/ $*
>  
>  # Single targets
>  # ---------------------------------------------------------------------------
> -- 
> 2.3.0.rc1
> 
