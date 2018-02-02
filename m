Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:25282 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751833AbeBBQBx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:01:53 -0500
MIME-Version: 1.0
In-Reply-To: <1517245680-3361-1-git-send-email-psodagud@codeaurora.org>
References: <fd6fdda6c0080e72598eabd2c88d7df6@codeaurora.org> <1517245680-3361-1-git-send-email-psodagud@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 3 Feb 2018 01:01:00 +0900
Message-ID: <CAK7LNAQ1d5t5-UHsF1ZJ9tNLpGgbMGnDoHdht9=wNy5kLDVyxw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, segher@kernel.crashing.org, Greg Hackmann <ghackmann@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-30 2:08 GMT+09:00 Prasad Sodagudi <psodagud@codeaurora.org>:
> Currently -Wunused-variable warnings are disabled with
> clang and with gcc -Wunused-variable warnings are
> enabled, with this setting all unused local variables
> would be warned in clang as well.
>
> Disable -Wunused-const-variable warnings instead of
> disabling -Wunused-variable warnings, So that in both
> clang and GCC -Wunused-const-variable gets disabled.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>

The code is OK, but I'd like to make the log even clearer.


The commit subject
"kbuild: clang: Disable -Wunused-const-variable warnings"
sounds confusing.

-Wunused-const-variable was already disabled for clang
because it was implied by Wno-unused-variable.


So, this patch is effectively enabling -Wunused-variable, right?


How about something like follows?

------------------------->8---------------------------------------
kbuild: clang: disable unused variable warnings only when constant

Currently, GCC disables -Wunused-const-variable, but not
-Wunused-variable, so warns unused variables if they are
non-constant.

While, Clang does not warn unused variables at all regardless of
the const qualifier because -Wno-unused-const-variable is implied
by the stronger option -Wno-unused-variable.

Disable -Wunused-const-variable instead of -Wunused-variable so that
GCC and Clang work in the same way.
--------------------------->8--------------------------------------


If it is tedious to resend, shall I reword the log locally?
Let me your thought.







> ---
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 339397b..4b6c8e2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -698,7 +698,6 @@ KBUILD_CFLAGS += $(stackp-flag)
>
>  ifeq ($(cc-name),clang)
>  KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> @@ -716,9 +715,9 @@ else
>  # These warnings generated too much noise in a regular build.
>  # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  endif
>
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS  += -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  else
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
>



-- 
Best Regards
Masahiro Yamada
