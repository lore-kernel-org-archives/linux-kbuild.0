Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38819 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfCMSvV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 14:51:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id n125so2010504pfn.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 11:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdmdEH1U9vOmVKo2Fn+hMPF9AB1enZ2rkpJcU9XHgR8Wng@mail.gmail.com>
 <20190313181719.87859-1-ndesaulniers@google.com> <20190313144013.37cab5c7@gandalf.local.home>
In-Reply-To: <20190313144013.37cab5c7@gandalf.local.home>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Mar 2019 11:51:09 -0700
Message-ID: <CAKwvOdnheUi6Ho5u4akTLGa-tBeUq94hQJH0+a4ROe_aEUgo7g@mail.gmail.com>
Subject: Re: [PATCH v2] lib/string.c: implement a basic bcmp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 13, 2019 at 11:40 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 13 Mar 2019 11:17:15 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > +#ifndef __HAVE_ARCH_BCMP
> > +/**
> > + * bcmp - Like memcmp but a non-zero return code simply indicates a non-match.
> > + * @cs: One area of memory.
> > + * @ct: Another area of memory.
> > + * @count: The size of the areas.
> > + */
> > +#undef bcmp
> > +int bcmp(const void *cs, const void *ct, size_t count)
> > +{
> > +     return memcmp(cs, ct, count);
>
> This is confusing where the comment says "like memcmp but .." and then
> just returns memcmp() unmodified. If anything, I would expect to see
>
>         return !!memcmp(cs, ct, conut);

That's more work than strictly needed. memcmp already provides the
semantics of bcmp.  memcmp just provides more meaning to the
signedness of the return code, whereas bcmp does not.

>
> or have a better comment explaining why its the same.

I could add something about "the signedness of the return code not
providing any meaning."  What would you like to see in such a comment?
-- 
Thanks,
~Nick Desaulniers
