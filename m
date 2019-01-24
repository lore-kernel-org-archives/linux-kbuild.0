Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39860 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbfAXE31 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jan 2019 23:29:27 -0500
MIME-Version: 1.0
References: <1547607401-20118-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547607401-20118-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 24 Jan 2019 13:28:35 +0900
Message-ID: <CAK7LNASPGoBLqGbujYA5uvEDzLXdzU919_+jgJaD5Vwr++8tPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: skip 'addtree' and 'flags' magic for external
 module build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 17, 2019 at 1:18 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When building an external module, $(obj) is the absolute path to it.
>
> The header search paths from ccflags-y etc. should not be tweaked.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.

(2/2 was discarded.)


>  scripts/Makefile.host |  6 ++++--
>  scripts/Makefile.lib  | 11 ++++++-----
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 0393f75..a115259 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -67,13 +67,15 @@ _hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
>  _hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
>                   $(HOSTCXXFLAGS_$(basetarget).o)
>
> -ifeq ($(KBUILD_SRC),)
>  __hostc_flags  = $(_hostc_flags)
>  __hostcxx_flags        = $(_hostcxx_flags)
> -else
> +
> +ifeq ($(KBUILD_EXTMOD),)
> +ifneq ($(KBUILD_SRC),)
>  __hostc_flags  = -I$(obj) $(call flags,_hostc_flags)
>  __hostcxx_flags        = -I$(obj) $(call flags,_hostcxx_flags)
>  endif
> +endif
>
>  hostc_flags    = -Wp,-MD,$(depfile) $(__hostc_flags)
>  hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 12b88d0..ecad15b 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -137,14 +137,14 @@ _c_flags += $(if $(patsubst n%,, \
>         $(CFLAGS_KCOV))
>  endif
>
> -# If building the kernel in a separate objtree expand all occurrences
> -# of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
> -
> -ifeq ($(KBUILD_SRC),)
>  __c_flags      = $(_c_flags)
>  __a_flags      = $(_a_flags)
>  __cpp_flags     = $(_cpp_flags)
> -else
> +
> +# If building the kernel in a separate objtree expand all occurrences
> +# of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
> +ifeq ($(KBUILD_EXTMOD),)
> +ifneq ($(KBUILD_SRC),)
>
>  # -I$(obj) locates generated .h files
>  # $(call addtree,-I$(obj)) locates .h files in srctree, from generated .c files
> @@ -155,6 +155,7 @@ __c_flags   = $(if $(obj),$(call addtree,-I$(src)) -I$(obj)) \
>  __a_flags      = $(call flags,_a_flags)
>  __cpp_flags     = $(call flags,_cpp_flags)
>  endif
> +endif
>
>  c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>                  -include $(srctree)/include/linux/compiler_types.h       \
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
