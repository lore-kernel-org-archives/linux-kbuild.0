Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34490 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3JrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 05:47:02 -0400
MIME-Version: 1.0
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com> <20190430093352.GA16941@archlinux-i9>
In-Reply-To: <20190430093352.GA16941@archlinux-i9>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 30 Apr 2019 11:46:44 +0200
Message-ID: <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Apr 30, 2019 at 11:33 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > > point, it has not been used because -Wuninitialized has been disabled,
> > > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > > on finding some bugs [1]. In my experience, it appears to be more
> > > accurate than GCC and catch some things that GCC can't.
> > >
> > > All of these warnings have now been fixed in -next across arm, arm64,
> > > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > > to prevent more from easily creeping in.
> > >
> > > As of next-20190429:
> > >
> > > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > > 45
> > >
> > > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >
> > > Masahiro, I am not sure how you want to handle merging this with regards
> > > to all of the patches floating around in -next but I wanted to send this
> > > out to let everyone know this is ready to be turned on.
> > >
> > > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > > randconfigs?
> >
> > No, I don't see any with the patches that I submitted. I haven't checked
> > if there are any that still need to get merged into linux-next though.
> >
> > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > index 768306add591..f4332981ea85 100644
> > > --- a/scripts/Makefile.extrawarn
> > > +++ b/scripts/Makefile.extrawarn
> > > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> > >  endif
> > >  endif
> >
> > This doesn't look right. Shouldn't you remove the line that turns off
> > -Wuninitilized
> > instead of adding only -Wsometimes-uninitialized?
>
> Well, there are still some outstanding issues with -Wuninitialized
> right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
> add warnings to the build but if you feel strongly, we could turn it on
> then fix them after.

Ah, I thought they were all fixed, as I don't see any remaining warnings
in my tree. It seems that I never send this workaround for
DECLARE_WAIT_QUEUE_HEAD_ONSTACK:

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 5f3efabc36f4..cbe1ea0fce84 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
wait_queue_head *wq_head, const char *n
        } while (0)

 #ifdef CONFIG_LOCKDEP
-# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
-       ({ init_waitqueue_head(&name); name; })
+# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
                 \
+       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
         \
+       .head           = ({
         \
+               static struct lock_class_key __key;
         \
+               lockdep_set_class_and_name(&(name).lock, &__key, #
name);       \
+               (struct list_head){ &(name).head, &(name).head };
         \
+       }),
         \
+}
+
 # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
        struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
 #else

Are there any others you see?

      Arnd
