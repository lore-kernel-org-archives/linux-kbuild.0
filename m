Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41851 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754108AbcFPPIP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Jun 2016 11:08:15 -0400
Date: Thu, 16 Jun 2016 10:08:09 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: List libelf-devel as an alternative
Message-ID: <20160616150809.f3tdj6hxdbypbboc@treble>
References: <20160616105420.13b4dbf2@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160616105420.13b4dbf2@endymion>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kbuild@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>, Michal Marek <mmarek@suse.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>

On Thu, Jun 16, 2016 at 10:54:20AM +0200, Jean Delvare wrote:
> On openSUSE, the libelf development files are in package libelf-devel.
> 
> Signed-off-by: Jean Delare <jdelvare@suse.de>
> Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> Cc: Jiri Olsa <jolsa@redhat.com>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

> ---
>  Makefile                   |    2 +-
>  tools/perf/config/Makefile |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-4.6.orig/Makefile	2016-05-16 00:43:13.000000000 +0200
> +++ linux-4.6/Makefile	2016-06-16 10:42:26.990587718 +0200
> @@ -1013,7 +1013,7 @@ ifdef CONFIG_STACK_VALIDATION
>    ifeq ($(has_libelf),1)
>      objtool_target := tools/objtool FORCE
>    else
> -    $(warning "Cannot use CONFIG_STACK_VALIDATION, please install libelf-dev or elfutils-libelf-devel")
> +    $(warning "Cannot use CONFIG_STACK_VALIDATION, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
>      SKIP_STACK_VALIDATION := 1
>      export SKIP_STACK_VALIDATION
>    endif
> --- linux-4.6.orig/tools/perf/config/Makefile	2016-05-16 00:43:13.000000000 +0200
> +++ linux-4.6/tools/perf/config/Makefile	2016-06-16 10:43:29.517409971 +0200
> @@ -243,7 +243,7 @@ else
>        LIBC_SUPPORT := 1
>      endif
>      ifeq ($(LIBC_SUPPORT),1)
> -      msg := $(warning No libelf found, disables 'probe' tool and BPF support in 'perf record', please install elfutils-libelf-devel/libelf-dev);
> +      msg := $(warning No libelf found, disables 'probe' tool and BPF support in 'perf record', please install libelf-dev, libelf-devel or elfutils-libelf-devel);
>  
>        NO_LIBELF := 1
>        NO_DWARF := 1
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

-- 
Josh
