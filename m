Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f65.google.com ([209.85.161.65]:38313 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388109AbeIUBpF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Sep 2018 21:45:05 -0400
Received: by mail-yw1-f65.google.com with SMTP id n21-v6so4272658ywh.5
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 12:59:57 -0700 (PDT)
Received: from mail-yw1-f46.google.com (mail-yw1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id m16-v6sm4938440ywd.32.2018.09.20.12.59.56
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 12:59:56 -0700 (PDT)
Received: by mail-yw1-f46.google.com with SMTP id h134-v6so1110739ywc.9
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 12:59:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180920172301.21868-14-miguel.ojeda.sandonis@gmail.com>
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-14-miguel.ojeda.sandonis@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 20 Sep 2018 12:52:57 -0700
Message-ID: <CAGXu5jKZYEK7Asy4KwtfVVxHLFbpeqpWWEOM-60h7h4gj3JZrw@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] Compiler Attributes: enable -Wstringop-truncation
 on W=1 (gcc >= 8)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Olof Johansson <olof@lxom.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Sandipan Das <sandipan@linux.vnet.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will.deacon@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, Paul Burton <paul.burton@mips.com>, David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>, Martin Sebor <msebor@gmail.com>, Christopher Li <sparse@chrisli.org>, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>, Dominique Martinet <asmadeus@codewreck.org>, Stefan Agner <stefan@agner.ch>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Ext4 Developers List <linux-ext4@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Sep 20, 2018 at 10:22 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
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

Yessss. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

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



-- 
Kees Cook
Pixel Security
