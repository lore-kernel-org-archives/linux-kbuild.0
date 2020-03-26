Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36549 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZRuo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 13:50:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id j29so3254207pgl.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 10:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-12-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-12-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Mar 2020 10:50:17 -0700
Message-ID: <CAKwvOd=3APTxrLD7U+hhMYoQm_ZTktckk-jurpwundm=w-pqKw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] x86: add comments about the binutils version to
 support code in as-instr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, clang-built-linux <clang-built-linux@googlegroups.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>

On Thu, Mar 26, 2020 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> We raise the minimal supported binutils version from time to time.
> The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
> required binutils version to 2.21").
>
> We need to keep these as-instr checks because binutils 2.21 does not
> support them.
>
> I hope this will be a good hint which one can be dropped when we
> bump the minimal binutils version next time.
>
> As for the Clang/LLVM builds, we require very new LLVM version,
> so the LLVM integrated assembler supports all of them.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Change the patch order and rebase
>
>  arch/x86/Kconfig.assembler | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
> index 91230bf11a14..a5a1d2766b3a 100644
> --- a/arch/x86/Kconfig.assembler
> +++ b/arch/x86/Kconfig.assembler
> @@ -3,15 +3,25 @@
>
>  config AS_AVX2
>         def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
> +       help
> +         Supported by binutils >= 2.22 and LLVM integrated assembler
>
>  config AS_AVX512
>         def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
> +       help
> +         Supported by binutils >= 2.25 and LLVM integrated assembler
>
>  config AS_SHA1_NI
>         def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
> +       help
> +         Supported by binutils >= 2.24 and LLVM integrated assembler
>
>  config AS_SHA256_NI
>         def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
> +       help
> +         Supported by binutils >= 2.24 and LLVM integrated assembler
>
>  config AS_ADX
>         def_bool $(as-instr,adox %eax$(comma)%eax)
> +       help
> +         Supported by binutils >= 2.23 and LLVM integrated assembler
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
