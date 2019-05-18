Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20260 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfERFRp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 01:17:45 -0400
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com>
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 May 2019 14:16:50 +0900
Message-ID: <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Michal Marek <michal.lkml@markovi.net>

On Fri, May 17, 2019 at 4:48 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> Sometimes it's useful to be able to explicitly ensure certain headers
> remain self-contained, i.e. that they are compilable as standalone
> units, by including and/or forward declaring everything they depend on.
>
> Add special target header-test-y where individual Makefiles can add
> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> generate a dummy C file per header that gets built as part of extra-y.
>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  Documentation/kbuild/makefiles.txt |  7 +++++++
>  init/Kconfig                       |  9 +++++++++
>  scripts/Makefile.build             | 10 ++++++++++
>  scripts/Makefile.lib               |  3 +++
>  4 files changed, 29 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 03c065855eaf..73df58e5ea0c 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1036,6 +1036,13 @@ When kbuild executes, the following steps are followed (roughly):
>         In this example, extra-y is used to list object files that
>         shall be built, but shall not be linked as part of built-in.a.
>
> +    header-test-y
> +
> +       header-test-y specifies headers (*.h) in the current directory that
> +       should be compile tested to ensure they are self-contained,
> +       i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
> +       this autogenerates dummy sources to include the headers, and builds them
> +       as part of extra-y.
>
>  --- 6.7 Commands useful for building a boot image
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 4592bf7997c0..d91b157201b1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -95,6 +95,15 @@ config COMPILE_TEST
>           here. If you are a user/distributor, say N here to exclude useless
>           drivers to be distributed.
>
> +config HEADER_TEST
> +       bool "Compile test headers that should be standalone compilable"
> +       help
> +         Compile test headers listed in header-test-y target to ensure they are
> +         self-contained, i.e. compilable as standalone units.
> +
> +         If you are a developer or tester and want to ensure the requested
> +         headers are self-contained, say Y here. Otherwise, choose N.
> +
>  config LOCALVERSION
>         string "Local version - append to kernel release"
>         help
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 76ca30cc4791..4d4bf698467a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -291,6 +291,16 @@ quiet_cmd_cc_lst_c = MKLST   $@
>  $(obj)/%.lst: $(src)/%.c FORCE
>         $(call if_changed_dep,cc_lst_c)
>
> +# Dummy C sources for header test (header-test-y target)
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_header_test = HDRTEST $@
> +      cmd_header_test = echo "\#include \"$(<F)\"" > $@
> +
> +# FIXME: would be nice to be able to limit this implicit rule to header-test-y
> +$(obj)/%.header_test.c: $(src)/%.h FORCE
> +       $(call if_changed,header_test)
> +
>  # Compile assembler sources (.S)
>  # ---------------------------------------------------------------------------
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 8a1f64f17740..c2839de06485 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>  endif
>
> +# Test self-contained headers
> +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
> +
>  # Add subdir path
>
>  extra-y                := $(addprefix $(obj)/,$(extra-y))
> --
> 2.20.1
>


Thanks, probably we should do this.

At least, this check will be useful
for uapi headers since the kernel does not
test the self-containedness of
exported headers, (then turned out be problematic
later in user-space).

I will take a little time to considier
how far we can extend the idea about
"headers should be self-contained".

Thank you.



-- 
Best Regards
Masahiro Yamada
