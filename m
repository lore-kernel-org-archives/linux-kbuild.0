Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60204 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751662AbcJJUAD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2016 16:00:03 -0400
Date: Mon, 10 Oct 2016 14:49:27 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: honor '-s' option for tools/*
Message-ID: <20161010194927.haq5eqwjuzujvjb6@treble>
References: <20161010123812.1425903-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161010123812.1425903-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jiri Olsa <jolsa@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 10, 2016 at 02:36:37PM +0200, Arnd Bergmann wrote:
> When building with 'make -s' on x86, we always see the output for descending into
> the tools/objtool directory when CONFIG_STACK_VALIDATION is set, but we should not
> see any output. There are three related problems causing this:
> 
> * we override the MAKEFLAGS variable when entering tools, keeping only
>   the -j and --j% options around when we should also propagate the -s
>   flag (for some make versions) as well as the 's' character in the first
>   word of the variable.
> 
> * The build system in tools/build/Makefile.build that is used for some
>   parts of the build process of objtool implements the same
>   logic as the normal kbuild, using 'quiet_$(cmd)' to indicate the
>   string that should be printed, but lacks the logic to skip that
>   when building with 'make -s'.
> 
> * The /other/ build system in tools/scripts/Makefile.include that is also
>   used for building objtool checks for the 's' flag in the beginning of
>   the first word of Makeflags, which works for GNU make 3.x, but not for
>   GNU make 4.x, which has it in the end of that word.
> 
> This changes all three of the above to behave just like Kbuild does,
> and print no output with 'make -s' regardless of the version of that
> tool, but otherwise behaves as before. In case of
> tools/scripts/Makefile.include, I decided to use an identical
> conditional block to set the $(quiet) variable for consistency,
> even though it is not used in the same way.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Makefile                       |  5 +++--
>  tools/build/Makefile.build     | 10 ++++++++++
>  tools/scripts/Makefile.include | 12 +++++++++++-
>  3 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d5289117360b..3638bb27ba2c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1612,11 +1612,12 @@ image_name:
>  # Clear a bunch of variables before executing the submake
>  tools/: FORCE
>  	$(Q)mkdir -p $(objtree)/tools
> -	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(filter --j% -j,$(MAKEFLAGS))" O=$(shell cd $(objtree) && /bin/pwd) subdir=tools -C $(src)/tools/
> +	echo MAKEFLAGS=\""$(MAKEFLAGS)"\"

I think this echo wasn't meant to be left in?

Otherwise it seems to work for me.


-- 
Josh
