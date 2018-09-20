Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35376 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeIUAB2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Sep 2018 20:01:28 -0400
Received: by mail-pg1-f195.google.com with SMTP id 205-v6so3863643pgd.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 11:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-14-miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <20180920172301.21868-14-miguel.ojeda.sandonis@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Sep 2018 11:16:31 -0700
Message-ID: <CAKwvOdmVfqMSox3nR57i=5GzSfV8szeaK1REs2X_gtmv7x1f4Q@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] Compiler Attributes: enable -Wstringop-truncation
 on W=1 (gcc >= 8)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, adilger.kernel@dilger.ca, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net, konstantin@linuxfoundation.org, "David S. Miller" <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, sandipan@linux.vnet.ibm.com, Andrey Konovalov <andreyknvl@google.com>, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will.deacon@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, paul.burton@mips.com, David Rientjes <rientjes@google.com>, w@1wt.eu, msebor@gmail.com, sparse@chrisli.org, Jonathan Corbet <corbet@lwn.net>, tytso@mit.edu, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com, Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org, Stefan Agner <stefan@agner.ch>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Sep 20, 2018 at 10:23 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Commit 217c3e019675 ("disable stringop truncation warnings for now")
> disabled -Wstringop-truncation since it was too noisy.
>
> Having __nonstring available allows us to let GCC know that a string
> is not meant to be NUL-terminated, which helps suppressing some
> -Wstringop-truncation warnings.
>
> Note that using __nonstring actually triggers other warnings
> (-Wstringop-overflow, which is on by default) which may be real
> problems. Therefore, cleaning up -Wstringop-truncation warnings
> also buys us the ability to uncover further potential problems.
>
> To encourage the use of __nonstring, we put the warning back at W=1.
> In the future, if we end up with a fairly warning-free tree,
> we might want to enable it by default.
>
> Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 8d5357053f86..b8f36f5f43f2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -29,6 +29,7 @@ warning-1 += $(call cc-option, -Wmissing-include-dirs)
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-option, -Wpacked-not-aligned)
> +warning-1 += $(call cc-option, -Wstringop-truncation)
>  warning-1 += $(call cc-disable-warning, missing-field-initializers)
>  warning-1 += $(call cc-disable-warning, sign-compare)
>
> --
> 2.17.1
>

I was sad to see these go in the first place.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
