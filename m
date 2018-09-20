Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33224 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387830AbeITX6n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Sep 2018 19:58:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id d4-v6so4760551pfn.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 11:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-16-miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <20180920172301.21868-16-miguel.ojeda.sandonis@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Sep 2018 11:13:48 -0700
Message-ID: <CAKwvOdnF=65Fj3zXP5KWVqWkKKFoPMvKox0iWFTObxdQiSgqog@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] Compiler Attributes: ext4: remove local
 __nonstring definition
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, adilger.kernel@dilger.ca, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net, konstantin@linuxfoundation.org, "David S. Miller" <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, sandipan@linux.vnet.ibm.com, Andrey Konovalov <andreyknvl@google.com>, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will.deacon@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, paul.burton@mips.com, David Rientjes <rientjes@google.com>, w@1wt.eu, msebor@gmail.com, sparse@chrisli.org, Jonathan Corbet <corbet@lwn.net>, tytso@mit.edu, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com, Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org, Stefan Agner <stefan@agner.ch>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Sep 20, 2018 at 10:23 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Commit 072ebb3bffe6 ("ext4: add nonstring annotations to ext4.h")
> introduced a local definition of __nonstring to suppress some false
> positives in gcc 8's -Wstringop-truncation.
>
> Since now we support __nonstring for everyone, remove it.

... from a patch in the current series (Note to other reviewers).

>
> Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> ---
>  fs/ext4/ext4.h | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index caff935fbeb8..2acdfdad3d3f 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -45,15 +45,6 @@
>
>  #include <linux/compiler.h>
>
> -/* Until this gets included into linux/compiler-gcc.h */
> -#ifndef __nonstring
> -#if defined(GCC_VERSION) && (GCC_VERSION >= 80000)
> -#define __nonstring __attribute__((nonstring))
> -#else
> -#define __nonstring
> -#endif
> -#endif
> -
>  /*
>   * The fourth extended filesystem constants/structures
>   */
> --
> 2.17.1
>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
