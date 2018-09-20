Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46628 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728016AbeITX4b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Sep 2018 19:56:31 -0400
Received: by mail-pl1-f195.google.com with SMTP id t20-v6so1280693ply.13
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 11:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180920172301.21868-1-miguel.ojeda.sandonis@gmail.com> <20180920172301.21868-15-miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <20180920172301.21868-15-miguel.ojeda.sandonis@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Sep 2018 11:11:36 -0700
Message-ID: <CAKwvOdnSNezyMQuj4bT3HeEM8hp+YSZbUKO_u_C+jd2C0sRJ3g@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] Compiler Attributes: auxdisplay: panel: use __nonstring
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, adilger.kernel@dilger.ca, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net, konstantin@linuxfoundation.org, "David S. Miller" <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, sandipan@linux.vnet.ibm.com, Andrey Konovalov <andreyknvl@google.com>, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will.deacon@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, paul.burton@mips.com, David Rientjes <rientjes@google.com>, w@1wt.eu, msebor@gmail.com, sparse@chrisli.org, Jonathan Corbet <corbet@lwn.net>, tytso@mit.edu, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com, Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org, Stefan Agner <stefan@agner.ch>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Sep 20, 2018 at 10:23 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Let gcc know these arrays are not meant to be NUL-terminated
> by annotating them with the new __nonstring variable attribute;
> and remove the comment since it conveys the same information.
>
> Signed-off-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> ---
>  drivers/auxdisplay/panel.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
> index 3b25a643058c..21b9b2f2470a 100644
> --- a/drivers/auxdisplay/panel.c
> +++ b/drivers/auxdisplay/panel.c
> @@ -155,10 +155,9 @@ struct logical_input {
>                         int release_data;
>                 } std;
>                 struct {        /* valid when type == INPUT_TYPE_KBD */
> -                       /* strings can be non null-terminated */
> -                       char press_str[sizeof(void *) + sizeof(int)];
> -                       char repeat_str[sizeof(void *) + sizeof(int)];
> -                       char release_str[sizeof(void *) + sizeof(int)];
> +                       char press_str[sizeof(void *) + sizeof(int)] __nonstring;
> +                       char repeat_str[sizeof(void *) + sizeof(int)] __nonstring;
> +                       char release_str[sizeof(void *) + sizeof(int)] __nonstring;
>                 } kbd;
>         } u;
>  };
> --
> 2.17.1
>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
