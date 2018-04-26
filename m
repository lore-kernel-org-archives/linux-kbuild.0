Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:54288 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756665AbeDZVld (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Apr 2018 17:41:33 -0400
Received: by mail-it0-f68.google.com with SMTP id h143-v6so214706ita.4
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Apr 2018 14:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180426212807.196279-1-ndesaulniers@google.com>
In-Reply-To: <20180426212807.196279-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Apr 2018 21:41:21 +0000
Message-ID: <CAKwvOdnjgEWDo8vjOiAS_TsEoJFZZagJgaqBAdW99L-Nkr9BxA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: gcov: enable -fno-tree-loop-im if supported
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Prasad Sodagudi <psodagud@quicinc.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Masahiro and Michal,

The reporter has asked for their email address to be updated to:

psodagud@codeaurora.org

if you're ok with this version of the patch and choose to apply it, can you
please update the commit message. Otherwise, I'll make this change should
we need other changes necessitating a v2.
On Thu, Apr 26, 2018 at 2:29 PM Nick Desaulniers <ndesaulniers@google.com>
wrote:

> Clang does not recognize this compiler option.

> Reported-by: Prasad Sodagudi <psodagud@quicinc.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   Makefile | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

> diff --git a/Makefile b/Makefile
> index 83b6c541565a..7f653c924c18 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -623,7 +623,9 @@ all: vmlinux

>   KBUILD_CFLAGS  += $(call cc-option,-fno-PIE)
>   KBUILD_AFLAGS  += $(call cc-option,-fno-PIE)
> -CFLAGS_GCOV    := -fprofile-arcs -ftest-coverage -fno-tree-loop-im
$(call cc-disable-warning,maybe-uninitialized,)
> +CFLAGS_GCOV    := -fprofile-arcs -ftest-coverage \
> +       $(call cc-option,-fno-tree-loop-im) \
> +       $(call cc-disable-warning,maybe-uninitialized,)
>   export CFLAGS_GCOV CFLAGS_KCOV

>   # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
> --
> 2.17.0.441.gb46fe60e1d-goog



--
Thanks,
~Nick Desaulniers
