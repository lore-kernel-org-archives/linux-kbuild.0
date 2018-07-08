Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19846 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932732AbeGHCcF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Jul 2018 22:32:05 -0400
MIME-Version: 1.0
In-Reply-To: <20180707010709.16648-7-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com> <20180707010709.16648-7-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 11:31:09 +0900
Message-ID: <CAK7LNAS0QpMLTK3okUtnefq9Y415URPT9Tsuj=ii0-FmLia-1g@mail.gmail.com>
Subject: Re: [PATCH 6/7] treewide: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>

2018-07-07 10:07 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> In preparation for enabling command line LDLIBS, re-name HOST_LOADLIBES to
> KBUILD_HOSTLDLIBS as the internal use only flags. This should not have any
> visible effects.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
>  Makefile              |  4 ++--
>  samples/bpf/Makefile  |  2 +-
>  scripts/Makefile.host | 10 +++++-----
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 319736b80016..d925af1fb11b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -363,7 +363,7 @@ KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
>                 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
>  KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
>  KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
> -HOST_LOADLIBES := $(HOST_LFS_LIBS)
> +KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS)
>
>  # Make variables (CC, etc...)
>  AS             = $(CROSS_COMPILE)as
> @@ -430,7 +430,7 @@ LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> -export CPP AR NM STRIP OBJCOPY OBJDUMP KBUILD_HOSTLDFLAGS HOST_LOADLIBES
> +export CPP AR NM STRIP OBJCOPY OBJDUMP KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
>  export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
>  export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
>
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 09f90955412e..c20fb2fa9c37 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -180,7 +180,7 @@ KBUILD_HOSTCFLAGS_trace_event_user.o += -I$(srctree)/tools/lib/bpf/
>  KBUILD_HOSTCFLAGS_sampleip_user.o += -I$(srctree)/tools/lib/bpf/
>  KBUILD_HOSTCFLAGS_task_fd_query_user.o += -I$(srctree)/tools/lib/bpf/
>
> -HOST_LOADLIBES         += $(LIBBPF) -lelf
> +KBUILD_HOSTLDLIBS              += $(LIBBPF) -lelf
>  HOSTLOADLIBES_tracex4          += -lrt
>  HOSTLOADLIBES_trace_output     += -lrt
>  HOSTLOADLIBES_map_perf_test    += -lrt
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 07acf5779f55..7b784413d921 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -85,7 +85,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
>  # host-csingle -> Executable
>  quiet_cmd_host-csingle         = HOSTCC  $@
>        cmd_host-csingle = $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
> -               $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
> +               $(KBUILD_HOSTLDLIBS) $(HOSTLOADLIBES_$(@F))
>  $(host-csingle): $(obj)/%: $(src)/%.c FORCE
>         $(call if_changed_dep,host-csingle)
>
> @@ -94,7 +94,7 @@ $(host-csingle): $(obj)/%: $(src)/%.c FORCE
>  quiet_cmd_host-cmulti  = HOSTLD  $@
>        cmd_host-cmulti  = $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ \
>                           $(addprefix $(obj)/,$($(@F)-objs)) \
> -                         $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F))
> +                         $(KBUILD_HOSTLDLIBS) $(HOSTLOADLIBES_$(@F))


For consistency, please rename
$(HOSTLOADLIBES_$(@F))
to
$(HOSTLDLIBS_$(@F))






-- 
Best Regards
Masahiro Yamada
