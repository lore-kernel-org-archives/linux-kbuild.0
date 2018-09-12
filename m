Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43848 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726552AbeILPW5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 11:22:57 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8CAItBT100054
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Sep 2018 06:19:04 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mey8m4rh4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Sep 2018 06:19:04 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Wed, 12 Sep 2018 11:19:02 +0100
Date: Wed, 12 Sep 2018 12:18:55 +0200
From: Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH v2] tracing/Makefile: fix handling redefinition of
 CC_FLAGS_FTRACE
References: <your-ad-here.call-01536239243-ext-9397@work.hours>
 <20180910175956.22679-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180910175956.22679-1-paulo.r.zanoni@intel.com>
Message-Id: <your-ad-here.call-01536747535-ext-7211@work.hours>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>

On Mon, Sep 10, 2018 at 10:59:56AM -0700, Paulo Zanoni wrote:
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
> -mfentry in one of the files. That is because "make targz-pkg" calls
> "make modules_install" and the environment is already populated with
> the exported variables, CC_FLAGS_FTRACE being one of them. Then,
> -mfentry gets duplicated because it is not protected behind an ifndef
> block, like -pg.
> 
> To complicate the problem a little bit more, architectures can define
> their own version CC_FLAGS_FTRACE, so our code not only has to
> consider recursive Makefiles, but also architecture overrides.
> 
> So in this patch we move CC_FLAGFS_FTRACE up and unconditionally
                           CC_FLAGS_FTRACE
> define it to -pg. Then we let the architecture Makefiles possibly
> override it, and finally append the extra options later. This ensures
> the variable is always fully redefined at each invocation so recursive
> Makefiles don't keep appending, and hopefully it maintains the
> intended behavior on how architectures can override the defaults..
> 
> Thanks Steven Rostedt and Vasily Gorbik for the help on this
> regression.
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
>  Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4d5c883a98e5..a5ef6818157a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -616,6 +616,11 @@ CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
>  	$(call cc-disable-warning,maybe-uninitialized,)
>  export CFLAGS_GCOV
>  
> +# The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
> +ifdef CONFIG_FUNCTION_TRACER
> +  CC_FLAGS_FTRACE := -pg
> +endif
> +
>  # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
>  # values of the respective KBUILD_* variables
>  ARCH_CPPFLAGS :=
> @@ -755,9 +760,6 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
>  endif
>  
>  ifdef CONFIG_FUNCTION_TRACER
> -ifndef CC_FLAGS_FTRACE
> -CC_FLAGS_FTRACE := -pg
> -endif
>  ifdef CONFIG_FTRACE_MCOUNT_RECORD
>    # gcc 5 supports generating the mcount tables directly
>    ifeq ($(call cc-option-yn,-mrecord-mcount),y)
> -- 
> 2.17.1
> 

Acked-by: Vasily Gorbik <gor@linux.ibm.com>
