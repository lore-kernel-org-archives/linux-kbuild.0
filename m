Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23818 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754579AbeCSCiZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Mar 2018 22:38:25 -0400
MIME-Version: 1.0
In-Reply-To: <9026b476c29fdd2d68b2e90ab0a155d0@agner.ch>
References: <1511784913-3396-1-git-send-email-yamada.masahiro@socionext.com> <9026b476c29fdd2d68b2e90ab0a155d0@agner.ch>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Mar 2018 11:37:41 +0900
Message-ID: <CAK7LNAQKzXK_MYAEh0kke96wA0MWmKhUjZhnbugX5WTf2kyTVw@mail.gmail.com>
Subject: Re: kbuild: move cc-option and cc-disable-warning after incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>

2018-03-19 9:41 GMT+09:00 Stefan Agner <stefan@agner.ch>:
> Hi Masahiro,
>
> On 27.11.2017 13:15, Masahiro Yamada wrote:
>> Geert reported commit ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before
>> incl. arch Makefile") broke cross-compilation using a cross-compiler
>> that supports less compiler options than the host compiler.
>>
>> For example,
>>
>>   cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"
>>
>> This problem happens on architectures that setup CROSS_COMPILE in their
>> arch/*/Makefile.
>>
>> Move the cc-option and cc-disable-warning back to the original position,
>> but keep the Clang target options.
>
> This seems to break arm (32-bit) clang support for me. It seems to break
> correct compiler flag detection in some way.
>
> Just moving no-integrated-as back to before including the arch Makefile
> seems to fix the issue:

Sorry, looks like I broke it.



> --- a/Makefile
> +++ b/Makefile
> @@ -487,6 +487,7 @@ CLANG_GCC_TC        :=
> --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
>  KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> +KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
>  endif
>
>  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern
> -mindirect-branch-register
> @@ -744,7 +745,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning,
> tautological-compare)
>  # See modpost pattern 2
>  KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
>  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
> -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
>  KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
>  else
>
> Does that sound like a reasonable fix?


Yes, I think so.


For consistency, please move
KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
as well.




-- 
Best Regards
Masahiro Yamada
