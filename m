Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbfCMTBh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 15:01:37 -0400
Date: Wed, 13 Mar 2019 15:01:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] lib/string.c: implement a basic bcmp
Message-ID: <20190313150133.117e2b63@gandalf.local.home>
In-Reply-To: <CAKwvOdnheUi6Ho5u4akTLGa-tBeUq94hQJH0+a4ROe_aEUgo7g@mail.gmail.com>
References: <CAKwvOdmdEH1U9vOmVKo2Fn+hMPF9AB1enZ2rkpJcU9XHgR8Wng@mail.gmail.com>
        <20190313181719.87859-1-ndesaulniers@google.com>
        <20190313144013.37cab5c7@gandalf.local.home>
        <CAKwvOdnheUi6Ho5u4akTLGa-tBeUq94hQJH0+a4ROe_aEUgo7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, 13 Mar 2019 11:51:09 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:


> > This is confusing where the comment says "like memcmp but .." and then
> > just returns memcmp() unmodified. If anything, I would expect to see
> >
> >         return !!memcmp(cs, ct, conut);  
> 
> That's more work than strictly needed. memcmp already provides the
> semantics of bcmp.  memcmp just provides more meaning to the
> signedness of the return code, whereas bcmp does not.

I figured you would say as much ;-)

> 
> >
> > or have a better comment explaining why its the same.  
> 
> I could add something about "the signedness of the return code not
> providing any meaning."  What would you like to see in such a comment?

I think it's the wording that bothers me:

+ * bcmp - Like memcmp but a non-zero return code simply indicates a non-match.

What about:

  * bcmp - Like memcmp but non-zero only means a non-match

Then in the description say that bcmp() callers must not expect
anything more than zero and non-zero, as different implementations only
need to return non-zero for non matches. The non-zero has no other
meaning like it does in memcmp(). You could add that memcmp() itself is
one implementation of bcmp() but not vice versa.

-- Steve
