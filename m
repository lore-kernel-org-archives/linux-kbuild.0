Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35909 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfCMTeP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 15:34:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id e4so2592161edi.3
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 12:34:14 -0700 (PDT)
Subject: Re: [PATCH v2] lib/string.c: implement a basic bcmp
References: <CAKwvOdmdEH1U9vOmVKo2Fn+hMPF9AB1enZ2rkpJcU9XHgR8Wng@mail.gmail.com>
 <20190313181719.87859-1-ndesaulniers@google.com>
 <20190313144013.37cab5c7@gandalf.local.home>
 <CAKwvOdnheUi6Ho5u4akTLGa-tBeUq94hQJH0+a4ROe_aEUgo7g@mail.gmail.com>
 <20190313150133.117e2b63@gandalf.local.home>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <65c69aac-696c-0534-2243-679db926d527@rasmusvillemoes.dk>
Date: Wed, 13 Mar 2019 20:34:11 +0100
MIME-Version: 1.0
In-Reply-To: <20190313150133.117e2b63@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On 13/03/2019 20.01, Steven Rostedt wrote:
> On Wed, 13 Mar 2019 11:51:09 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
> 
>>>
>>> or have a better comment explaining why its the same.  
>>
>> I could add something about "the signedness of the return code not
>> providing any meaning."  What would you like to see in such a comment?
> 
> I think it's the wording that bothers me:
> 
> + * bcmp - Like memcmp but a non-zero return code simply indicates a non-match.
> 
> What about:
> 
>   * bcmp - Like memcmp but non-zero only means a non-match
> 
> Then in the description say that bcmp() callers must not expect
> anything more than zero and non-zero,

Yes, but let's completely avoid mentioning memcmp in the summary.

bcmp - return 0 if and only if the buffers have identical contents
@a: pointer to first buffer
@b: pointer to second buffer
@len: size of buffers

The sign or magnitude of a non-zero return value has no particular
meaning, and architectures may implement their own more efficient
bcmp(). So while this particular implementation is a simple (tail) call
to memcmp, do not rely on anything but whether the return value is zero
or non-zero.

Rasmus
