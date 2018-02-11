Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27156 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbeBKGFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Feb 2018 01:05:14 -0500
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com [209.85.217.179]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w1B64nUJ016182
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Feb 2018 15:04:50 +0900
Received: by mail-ua0-f179.google.com with SMTP id d4so3099326uak.8
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Feb 2018 22:04:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180210142504.29890-2-npiggin@gmail.com>
References: <20180210142504.29890-1-npiggin@gmail.com> <20180210142504.29890-2-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 11 Feb 2018 15:04:08 +0900
Message-ID: <CAK7LNASne2L_VNWoirTWc497ALujGk-MjfzjtkJ4=1PS_SLLXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove incremental linking option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

(+CC Sam)

2018-02-10 23:25 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> This removes the old `ld -r` incremental link option, which has not
> been selected by any architecture since June 2017.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


Thanks for the last piece work!

BTW, as a loosely related topic,
I guess the following partial section analysis is not working any more.

# Do section mismatch analysis for each module/built-in.a
ifdef CONFIG_DEBUG_SECTION_MISMATCH
  cmd_secanalysis = ; scripts/mod/modpost $@
endif



If we use thin archive for built-in.o,
this is not ELF, so it is always skipped
by the following code.


if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
    (hdr->e_ident[EI_MAG1] != ELFMAG1) ||
    (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
    (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
        /* Not an ELF file - silently ignore it */
        return 0;


The final analysis is done against vmlinux.o, which is ELF.



Is it better to remove CONFIG_DEBUG_SECTION_MISMATCH?
Or, do you have an idea to fix it?


I CCed Sam, the author of commit 91341d4.




> ---
>  Documentation/kbuild/makefiles.txt | 10 ++++-
>  arch/Kconfig                       |  6 ---
>  scripts/Makefile.build             | 32 +++++---------
>  scripts/link-vmlinux.sh            | 91 ++++++++++++++------------------------
>  4 files changed, 51 insertions(+), 88 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 71e9feefb63c..750aea9edd35 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -153,8 +153,14 @@ more details, with real examples.
>         configuration.
>
>         Kbuild compiles all the $(obj-y) files.  It then calls
> -       "$(LD) -r" to merge these files into one built-in.o file.
> -       built-in.o is later linked into vmlinux by the parent Makefile.
> +       "$(AR) rcSTP" to merge these files into one built-in.o file.
> +       This is a thin archive without a symbol table, which makes it
> +       unsuitable as a linker input.
> +
> +       The scripts/link-vmlinux.sh script later makes an aggregate
> +       built-in.o with "${AR} rcsTP", which creates the thin archive
> +       with a symbol table and an index, making it a valid input for
> +       the final vmlinux link passes.
>
>         The order of files in $(obj-y) is significant.  Duplicates in
>         the lists are allowed: the first instance will be linked into
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 76c0b54443b1..8e0d665c8d53 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -596,12 +596,6 @@ config CC_STACKPROTECTOR_AUTO
>
>  endchoice
>
> -config THIN_ARCHIVES
> -       def_bool y
> -       help
> -         Select this if the architecture wants to use thin archives
> -         instead of ld -r to create the built-in.o files.
> -
>  config LD_DEAD_CODE_DATA_ELIMINATION
>         bool
>         help
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 47cddf32aeba..c43df53c7cce 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -450,15 +450,13 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
>  #
>  ifdef builtin-target
>
> -ifdef CONFIG_THIN_ARCHIVES
> -  cmd_make_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
> -  cmd_make_empty_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
> -  quiet_cmd_link_o_target = AR      $@
> -else
> -  cmd_make_builtin = $(LD) $(ld_flags) -r -o
> -  cmd_make_empty_builtin = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS)
> -  quiet_cmd_link_o_target = LD      $@
> -endif
> +# built-in.o archives are made with no symbol table or index which
> +# makes them small and fast, but unable to be used by the linker.
> +# scripts/link-vmlinux.sh builds an aggregate built-in.o with a symbol
> +# table and index.
> +cmd_make_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
> +cmd_make_empty_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS)
> +quiet_cmd_link_o_target = AR      $@
>
>  # If the list of objects to link is empty, just create an empty built-in.o
>  cmd_link_o_target = $(if $(strip $(obj-y)),\
> @@ -491,11 +489,8 @@ $(modorder-target): $(subdir-ym) FORCE
>  ifdef lib-target
>  quiet_cmd_link_l_target = AR      $@
>
> -ifdef CONFIG_THIN_ARCHIVES
> -  cmd_link_l_target = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(lib-y)
> -else
> -  cmd_link_l_target = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib-y)
> -endif
> +# lib target archives do get a symbol table and index
> +cmd_link_l_target = rm -f $@; $(AR) rcsTP$(KBUILD_ARFLAGS) $@ $(lib-y)
>
>  $(lib-target): $(lib-y) FORCE
>         $(call if_changed,link_l_target)
> @@ -543,13 +538,8 @@ $($(subst $(obj)/,,$(@:.o=-m)))), $^)
>
>  cmd_link_multi-link = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
>
> -ifdef CONFIG_THIN_ARCHIVES
> -  quiet_cmd_link_multi-y = AR      $@
> -  cmd_link_multi-y = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(link_multi_deps)
> -else
> -  quiet_cmd_link_multi-y = LD      $@
> -  cmd_link_multi-y = $(cmd_link_multi-link)
> -endif
> +quiet_cmd_link_multi-y = AR      $@
> +cmd_link_multi-y = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(link_multi_deps)
>
>  quiet_cmd_link_multi-m = LD [M]  $@
>  cmd_link_multi-m = $(cmd_link_multi-link)
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index c0d129d7f430..a55c24a86133 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -55,13 +55,11 @@ info()
>  #
>  archive_builtin()
>  {
> -       if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
> -               info AR built-in.o
> -               rm -f built-in.o;
> -               ${AR} rcsTP${KBUILD_ARFLAGS} built-in.o                 \
> -                                       ${KBUILD_VMLINUX_INIT}          \
> -                                       ${KBUILD_VMLINUX_MAIN}
> -       fi
> +       info AR built-in.o
> +       rm -f built-in.o;
> +       ${AR} rcsTP${KBUILD_ARFLAGS} built-in.o                 \
> +                               ${KBUILD_VMLINUX_INIT}          \
> +                               ${KBUILD_VMLINUX_MAIN}
>  }
>
>  # Link of vmlinux.o used for section mismatch analysis
> @@ -70,20 +68,13 @@ modpost_link()
>  {
>         local objects
>
> -       if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
> -               objects="--whole-archive                                \
> -                       built-in.o                                      \
> -                       --no-whole-archive                              \
> -                       --start-group                                   \
> -                       ${KBUILD_VMLINUX_LIBS}                          \
> -                       --end-group"
> -       else
> -               objects="${KBUILD_VMLINUX_INIT}                         \
> -                       --start-group                                   \
> -                       ${KBUILD_VMLINUX_MAIN}                          \
> -                       ${KBUILD_VMLINUX_LIBS}                          \
> -                       --end-group"
> -       fi
> +       objects="--whole-archive                                \
> +               built-in.o                                      \
> +               --no-whole-archive                              \
> +               --start-group                                   \
> +               ${KBUILD_VMLINUX_LIBS}                          \
> +               --end-group"
> +
>         ${LD} ${LDFLAGS} -r -o ${1} ${objects}
>  }
>
> @@ -96,46 +87,28 @@ vmlinux_link()
>         local objects
>
>         if [ "${SRCARCH}" != "um" ]; then
> -               if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
> -                       objects="--whole-archive                        \
> -                               built-in.o                              \
> -                               --no-whole-archive                      \
> -                               --start-group                           \
> -                               ${KBUILD_VMLINUX_LIBS}                  \
> -                               --end-group                             \
> -                               ${1}"
> -               else
> -                       objects="${KBUILD_VMLINUX_INIT}                 \
> -                               --start-group                           \
> -                               ${KBUILD_VMLINUX_MAIN}                  \
> -                               ${KBUILD_VMLINUX_LIBS}                  \
> -                               --end-group                             \
> -                               ${1}"
> -               fi
> -
> -               ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}             \
> +               objects="--whole-archive                        \
> +                       built-in.o                              \
> +                       --no-whole-archive                      \
> +                       --start-group                           \
> +                       ${KBUILD_VMLINUX_LIBS}                  \
> +                       --end-group                             \
> +                       ${1}"
> +
> +               ${LD} ${LDFLAGS} ${LDFLAGS_vmlinux} -o ${2}     \
>                         -T ${lds} ${objects}
>         else
> -               if [ -n "${CONFIG_THIN_ARCHIVES}" ]; then
> -                       objects="-Wl,--whole-archive                    \
> -                               built-in.o                              \
> -                               -Wl,--no-whole-archive                  \
> -                               -Wl,--start-group                       \
> -                               ${KBUILD_VMLINUX_LIBS}                  \
> -                               -Wl,--end-group                         \
> -                               ${1}"
> -               else
> -                       objects="${KBUILD_VMLINUX_INIT}                 \
> -                               -Wl,--start-group                       \
> -                               ${KBUILD_VMLINUX_MAIN}                  \
> -                               ${KBUILD_VMLINUX_LIBS}                  \
> -                               -Wl,--end-group                         \
> -                               ${1}"
> -               fi
> -
> -               ${CC} ${CFLAGS_vmlinux} -o ${2}                         \
> -                       -Wl,-T,${lds}                                   \
> -                       ${objects}                                      \
> +               objects="-Wl,--whole-archive                    \
> +                       built-in.o                              \
> +                       -Wl,--no-whole-archive                  \
> +                       -Wl,--start-group                       \
> +                       ${KBUILD_VMLINUX_LIBS}                  \
> +                       -Wl,--end-group                         \
> +                       ${1}"
> +
> +               ${CC} ${CFLAGS_vmlinux} -o ${2}                 \
> +                       -Wl,-T,${lds}                           \
> +                       ${objects}                              \
>                         -lutil -lrt -lpthread
>                 rm -f linux
>         fi
> --
> 2.15.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
