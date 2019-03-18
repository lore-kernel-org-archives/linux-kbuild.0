Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37459 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfCRWXf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 18:23:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id q206so12373508pgq.4
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 15:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
 <CAKwvOdnms16AC3jPcc_7MXD7QF43dKvHsi+aqmsz0wX-u1GTpA@mail.gmail.com>
 <20190318215605.GJ112750@google.com> <0275C6DD-7F77-4D51-9C35-B25ECF61EB0F@zytor.com>
In-Reply-To: <0275C6DD-7F77-4D51-9C35-B25ECF61EB0F@zytor.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Mar 2019 15:23:23 -0700
Message-ID: <CAKwvOd=yefHpPryGsZX3s6SFzmMt9kX6TqoGfp6-5A-KoZsy4Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: use -Oz instead of -Os when using clang"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthias Kaehlcke <mka@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Peter Zijlstra <peterz@infradead.org>, Manoj Gupta <manojgupta@chromium.org>, Tiancong Wang <tcwang@chromium.org>, Stephen Hines <srhines@google.com>, clang-built-linux@googlegroups.com

On Mon, Mar 18, 2019 at 3:07 PM <hpa@zytor.com> wrote:
>
> On March 18, 2019 2:56:05 PM PDT, Matthias Kaehlcke <mka@chromium.org> wrote:
> >> >  KBUILD_CFLAGS  += $(call cc-disable-warning, int-in-bool-context)
> >> >
> >> >  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> >> > -KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> >> > +KBUILD_CFLAGS  += -Os
> >> >  else
> >> >  KBUILD_CFLAGS   += -O2
> >> >  endif
>
> Would be nice, still, to have -Ok.

April fools *is* coming up. 0:-)
-- 
Thanks,
~Nick Desaulniers
