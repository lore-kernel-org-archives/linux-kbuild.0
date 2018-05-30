Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:65425 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753765AbeE3Oex (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 10:34:53 -0400
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com [209.85.217.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w4UEYo0i002721
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 23:34:51 +0900
Received: by mail-ua0-f171.google.com with SMTP id f30-v6so10851336uab.11
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 07:34:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530121922.22122-4-npiggin@gmail.com>
References: <20180530121922.22122-1-npiggin@gmail.com> <20180530121922.22122-4-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 May 2018 23:34:09 +0900
Message-ID: <CAK7LNASXBa5ATT6nx5bcvH1LCQFR--VJJXXZeoOXBc9TAAfOLA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] powerpc/kbuild: Use flags variables rather than
 overriding LD/CC/AS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Segher Boessenkool <segher@kernel.crashing.org>

2018-05-30 21:19 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> The powerpc toolchain can compile combinations of 32/64 bit and
> big/little endian, so it's convenient to consider, e.g.,
>
>   `CC -m64 -mbig-endian`
>
> To be the C compiler for the purpose of invoking it to build target
> artifacts. So overriding the the CC variable to include thse flags
> works for this purpose.

When I applied this patch, I changed the following.

"the the" -> "the"
"thse" -> "these"


Please let me know if my fix-up is bad.






> Unfortunately that is not compatible with the way the proposed new
> Kconfig macro language will work.
>
> After previous patches in this series, these flags can be carefully
> passed in using flags instead.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> Since v1: removed extra -EB in the recordmcount script (thanks mpe)
> ---
>  arch/powerpc/Makefile                          | 16 +++++++++-------
>  .../powerpc/tools/gcc-check-mprofile-kernel.sh | 12 ++++++++----
>  scripts/recordmcount.pl                        | 18 +++++++++++++++++-
>  3 files changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 167b26a0780c..6faf1d6ad9dd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -75,13 +75,15 @@ endif
>  endif
>
>  ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
> -override LD    += -EL
> +KBUILD_CFLAGS  += -mlittle-endian
> +LDFLAGS                += -EL
>  LDEMULATION    := lppc
>  GNUTARGET      := powerpcle
>  MULTIPLEWORD   := -mno-multiple
>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>  else
> -override LD    += -EB
> +KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +LDFLAGS                += -EB
>  LDEMULATION    := ppc
>  GNUTARGET      := powerpc
>  MULTIPLEWORD   := -mmultiple
> @@ -94,19 +96,19 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)             += $(call cc-option,-mabi=elfv1)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mabi=elfv2
>  endif
>
> -cflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
> -cflags-$(CONFIG_CPU_BIG_ENDIAN)                += $(call cc-option,-mbig-endian)
>  ifneq ($(cc-name),clang)
>    cflags-$(CONFIG_CPU_LITTLE_ENDIAN)   += -mno-strict-align
>  endif
>
> +cflags-$(CONFIG_CPU_BIG_ENDIAN)                += $(call cc-option,-mbig-endian)
> +cflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
>  aflags-$(CONFIG_CPU_BIG_ENDIAN)                += $(call cc-option,-mbig-endian)
>  aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
>
>  ifeq ($(HAS_BIARCH),y)
> -override AS    += -a$(BITS)
> -override LD    += -m elf$(BITS)$(LDEMULATION)
> -override CC    += -m$(BITS)
> +KBUILD_CFLAGS  += -m$(BITS)
> +KBUILD_AFLAGS  += -m$(BITS) -Wl,-a$(BITS)
> +LDFLAGS                += -m elf$(BITS)$(LDEMULATION)
>  KBUILD_ARFLAGS += --target=elf$(BITS)-$(GNUTARGET)
>  endif
>
> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> index 061f8035bdbe..a7dd0e5d9f98 100755
> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> @@ -7,17 +7,21 @@ set -o pipefail
>  # To debug, uncomment the following line
>  # set -x
>
> +# -mprofile-kernel is only supported on 64le, so this should not be invoked
> +# for other targets. Therefore we can pass in -m64 and -mlittle-endian
> +# explicitly, to take care of toolchains defaulting to other targets.
> +
>  # Test whether the compile option -mprofile-kernel exists and generates
>  # profiling code (ie. a call to _mcount()).
>  echo "int func() { return 0; }" | \
> -    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
> -    grep -q "_mcount"
> +    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
> +    2> /dev/null | grep -q "_mcount"
>
>  # Test whether the notrace attribute correctly suppresses calls to _mcount().
>
>  echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
> -    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
> -    grep -q "_mcount" && \
> +    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
> +    2> /dev/null | grep -q "_mcount" && \
>      exit 1
>
>  echo "OK"
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index 191eb949d52c..fe06e77c15eb 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -266,13 +266,29 @@ if ($arch eq "x86_64") {
>      $objcopy .= " -O elf32-sh-linux";
>
>  } elsif ($arch eq "powerpc") {
> +    my $ldemulation;
> +
>      $local_regex = "^[0-9a-fA-F]+\\s+t\\s+(\\.?\\S+)";
>      # See comment in the sparc64 section for why we use '\w'.
>      $function_regex = "^([0-9a-fA-F]+)\\s+<(\\.?\\w*?)>:";
>      $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s\\.?_mcount\$";
>
> +    if ($endian eq "big") {
> +           $cc .= " -mbig-endian ";
> +           $ld .= " -EB ";
> +           $ldemulation = "ppc"
> +    } else {
> +           $cc .= " -mlittle-endian ";
> +           $ld .= " -EL ";
> +           $ldemulation = "lppc"
> +    }
>      if ($bits == 64) {
> -       $type = ".quad";
> +        $type = ".quad";
> +        $cc .= " -m64 ";
> +        $ld .= " -m elf64".$ldemulation." ";
> +    } else {
> +        $cc .= " -m32 ";
> +        $ld .= " -m elf32".$ldemulation." ";
>      }
>
>  } elsif ($arch eq "arm") {
> --
> 2.17.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
