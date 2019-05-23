Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39938 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbfEWBuh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 May 2019 21:50:37 -0400
Date: Wed, 22 May 2019 18:50:32 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Message-ID: <20190523015032.GB17640@archlinux-epyc>
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
 <20190430093352.GA16941@archlinux-i9>
 <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Apr 30, 2019 at 11:46:44AM +0200, Arnd Bergmann wrote:
> Ah, I thought they were all fixed, as I don't see any remaining warnings
> in my tree. It seems that I never send this workaround for
> DECLARE_WAIT_QUEUE_HEAD_ONSTACK:
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index 5f3efabc36f4..cbe1ea0fce84 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
> wait_queue_head *wq_head, const char *n
>         } while (0)
> 
>  #ifdef CONFIG_LOCKDEP
> -# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
> -       ({ init_waitqueue_head(&name); name; })
> +# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
>                  \
> +       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
>          \
> +       .head           = ({
>          \
> +               static struct lock_class_key __key;
>          \
> +               lockdep_set_class_and_name(&(name).lock, &__key, #
> name);       \
> +               (struct list_head){ &(name).head, &(name).head };
>          \
> +       }),
>          \
> +}
> +
>  # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
>         struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
>  #else
> 
> Are there any others you see?
> 
>       Arnd

Hi Arnd,

Were you planning on sending this out for review? It would be nice to
get these fixed so we can get this warning enabled.

I am bumping the other patches/inquiries I have sent now.

Cheers,
Nathan
