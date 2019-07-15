Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20811 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729968AbfGOMVx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 08:21:53 -0400
MIME-Version: 1.0
References: <20190709184919.20178-1-seth.forshee@canonical.com>
In-Reply-To: <20190709184919.20178-1-seth.forshee@canonical.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 15 Jul 2019 21:21:12 +0900
Message-ID: <CAK7LNAT1wrc0WVOKGTJ3f1RZ+EUjYtJxmKv_2N6mU2STAUg4RA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -fcf-protection=none to retpoline flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 10, 2019 at 3:49 AM Seth Forshee <seth.forshee@canonical.com> wrote:
>
> -mindirect-branch and -fcf-protection are not compatible, and
> so kernel builds fail with a gcc build where -fcf-protection is
> enabled by default. Add -fcf-protection=none to the retpoline
> flags to fix this.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---

Applied to linux-kbuild. Thanks.



>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 3e4868a6498b..050f11d19777 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -636,6 +636,10 @@ RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
>  RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
>  RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
>  RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
> +# -mindirect-branch is incompatible with -fcf-protection, so ensure the
> +# latter is disabled
> +RETPOLINE_CFLAGS += $(call cc-option,-fcf-protection=none,)
> +RETPOLINE_VDSO_CFLAGS += $(call cc-option,-fcf-protection=none,)
>  export RETPOLINE_CFLAGS
>  export RETPOLINE_VDSO_CFLAGS
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
