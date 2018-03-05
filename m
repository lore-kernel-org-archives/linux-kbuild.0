Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44684 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752577AbeCEOxl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Mar 2018 09:53:41 -0500
Date: Mon, 5 Mar 2018 08:53:39 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: make use of pkg-config for libelf
Message-ID: <20180305145339.444neh5ablzofg42@treble>
References: <20180301125537.14160-1-pp@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180301125537.14160-1-pp@emlix.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philipp Puschmann <pp@emlix.com>, Robin Jarry <robin.jarry@6wind.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, peterz@infradead.org, linux-kbuild@vger.kernel.org

[ Adding Robin ]

Robin, does this fix the same issue as your recent patches?  If so, I'd
prefer this one because it doesn't need any new environment variables.

On Thu, Mar 01, 2018 at 01:55:37PM +0100, Philipp Puschmann wrote:
> For libelf with non-standard paths make use of pkg-config.
> 
> Signed-off-by: Philipp Puschmann <pp@emlix.com>
> ---
>  Makefile               | 4 +++-
>  tools/objtool/Makefile | 8 ++++++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 659a7780aeb3..31b296b0e941 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -953,8 +953,10 @@ endif
>  export mod_sign_cmd
>  
>  ifdef CONFIG_STACK_VALIDATION
> +  LIBELF_LIBS = $(shell pkg-config --libs libelf 2> /dev/null || \
> +                        echo -lelf)
>    has_libelf := $(call try-run,\
> -		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
> +		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(LIBELF_LIBS) -,1,0)
>    ifeq ($(has_libelf),1)
>      objtool_target := tools/objtool FORCE
>    else
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index e6acc281dd37..c565eff8c393 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -27,12 +27,16 @@ OBJTOOL_IN := $(OBJTOOL)-in.o
>  
>  all: $(OBJTOOL)
>  
> +LIBELF_LIBS     = $(shell pkg-config --libs libelf 2> /dev/null || \
> +                        echo -lelf)
> +LIBELF_INCLUDES = $(shell pkg-config --cflags libelf 2> /dev/null)
>  INCLUDES := -I$(srctree)/tools/include \
>  	    -I$(srctree)/tools/arch/$(HOSTARCH)/include/uapi \
> -	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include
> +	    -I$(srctree)/tools/objtool/arch/$(ARCH)/include \
> +	    $(LIBELF_INCLUDES)
>  WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed
>  CFLAGS   += -Wall -Werror $(WARNINGS) -fomit-frame-pointer -O2 -g $(INCLUDES)
> -LDFLAGS  += -lelf $(LIBSUBCMD)
> +LDFLAGS  += $(LIBELF_LIBS) $(LIBSUBCMD)
>  
>  # Allow old libelf to be used:
>  elfshdr := $(shell echo '\#include <libelf.h>' | $(CC) $(CFLAGS) -x c -E - | grep elf_getshdr)
> -- 
> 2.16.1
> 

-- 
Josh
