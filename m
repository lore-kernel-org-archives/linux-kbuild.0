Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbeIFGoA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Sep 2018 02:44:00 -0400
Date: Wed, 5 Sep 2018 22:10:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC 1/2] tracing/Makefile: fix handling redefinition of
 CC_FLAGS_FTRACE
Message-ID: <20180905221059.73663a6e@vmware.local.home>
In-Reply-To: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
References: <20180905223600.20994-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: linux-kbuild@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On Wed,  5 Sep 2018 15:35:59 -0700
Paulo Zanoni <paulo.r.zanoni@intel.com> wrote:

> As a Kernel developer, I make heavy use of "make targz-pkg" in order
> to locally compile and remotely install my development Kernels. The
> nice feature I rely on is that after a normal "make", "make targz-pkg"
> only generates the tarball without having to recompile everything.
> 
> That was true until commit f28bc3c32c05 ("tracing: Handle
> CC_FLAGS_FTRACE more accurately"). After it, running "make targz-pkg"
> after "make" will recompile the whole Kernel tree, making my
> development workflow much slower.
> 
> The Kernel is choosing to recompile everything because it claims the
> command line has changed. A diff of the .cmd files show a repeated
> -mfentry in one of the files. It seems that something on make
> targz-pkg triggers the double -mfentry but not the double -pg.

It's probably because the addition of -mfentry isn't protected behind a
ifndef block (like you added in this patch).

> 
> So this patch attempts to deal with that problem by handling -mfentry
> and others just like we handle -pg: don't append them if
> CC_FLAGS_FTRACE is already defined. I'm not a Makefile expert and so I
> can't claim this won't break anything else, hopefully if this patch
> gets applied it will have a Reviewed-by tag from some actual Makefile
> expert. I can claim this patch fixes the specific regression I
> reported.
> 
> Fixes: commit f28bc3c32c05 ("tracing: Handle CC_FLAGS_FTRACE more
>  accurately")
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> ---
>  Makefile | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 19948e556941..2c8df481b4f1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -755,28 +755,30 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
>  endif
>  
>  ifdef CONFIG_FUNCTION_TRACER
> -ifndef CC_FLAGS_FTRACE
> -CC_FLAGS_FTRACE := -pg
> -endif
> +cc_flags_ftrace_ := -pg

I have no problem with this patch, but why the extra underscore at the
end of cc_flags_ftrace_, and not just cc_flags_ftrace?

-- Steve

>  ifdef CONFIG_FTRACE_MCOUNT_RECORD
>    # gcc 5 supports generating the mcount tables directly
>    ifeq ($(call cc-option-yn,-mrecord-mcount),y)
> -    CC_FLAGS_FTRACE	+= -mrecord-mcount
> +    cc_flags_ftrace_	+= -mrecord-mcount
>      export CC_USING_RECORD_MCOUNT := 1
>    endif
>    ifdef CONFIG_HAVE_NOP_MCOUNT
>      ifeq ($(call cc-option-yn, -mnop-mcount),y)
> -      CC_FLAGS_FTRACE	+= -mnop-mcount
> +      cc_flags_ftrace_	+= -mnop-mcount
>        CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
>      endif
>    endif
>  endif
>  ifdef CONFIG_HAVE_FENTRY
>    ifeq ($(call cc-option-yn, -mfentry),y)
> -    CC_FLAGS_FTRACE	+= -mfentry
> +    cc_flags_ftrace_	+= -mfentry
>      CC_FLAGS_USING	+= -DCC_USING_FENTRY
>    endif
>  endif
> +
> +ifndef CC_FLAGS_FTRACE
> +  CC_FLAGS_FTRACE := $(cc_flags_ftrace_)
> +endif
>  export CC_FLAGS_FTRACE
>  KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
>  KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
