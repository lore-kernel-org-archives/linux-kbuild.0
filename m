Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34092 "EHLO
        mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751791AbdEDTug (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 May 2017 15:50:36 -0400
Received: by mail-pf0-f180.google.com with SMTP id e64so12344264pfd.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 May 2017 12:50:36 -0700 (PDT)
Date: Thu, 4 May 2017 12:50:34 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the
 'duplicate-decl-specifier' warning
Message-ID: <20170504195034.GZ128305@google.com>
References: <20170421213931.155210-1-mka@chromium.org>
 <20170421213931.155210-3-mka@chromium.org>
 <CAK7LNATD-KbP6GtV_j6NMgcPQYRigz5pA8fdos7hQSzQpL8czw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNATD-KbP6GtV_j6NMgcPQYRigz5pA8fdos7hQSzQpL8czw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, masahiroy@kernel.org

Hi Masahiro,

El Sun, Apr 30, 2017 at 11:01:11PM +0900 Masahiro Yamada ha dit:

> 2017-04-22 6:39 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > clang generates plenty of these warnings in different parts of the code.
> > They are mostly caused by container_of() and other macros which declare
> > a "const <type> *" variable for their internal use which triggers a
> > "duplicate 'const' specifier" warning if the <type> is already const
> > qualified.
> >
> > Wording-mostly-from: Michael Davidson <md@google.com>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> 
> 
> I think container_of() can be more simple,
> dropping the 'const'.
> 
> The following patch worked for me.
> 
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 4c26dc3..d53672b 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -846,11 +846,9 @@ static inline void ftrace_dump(enum
> ftrace_dump_mode oops_dump_mode) { }
>   * @ptr:       the pointer to the member.
>   * @type:      the type of the container struct this is embedded in.
>   * @member:    the name of the member within the struct.
> - *
>   */
>  #define container_of(ptr, type, member) ({                     \
> -       const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
> -       (type *)( (char *)__mptr - offsetof(type,member) );})
> +       (type *)((void *)(ptr) - offsetof(type, member));})
> 
>  /* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
>  #ifdef CONFIG_FTRACE_MCOUNT_RECORD

Thanks, this eliminates indeed a huge amount of these warnings.

The other big source of warnings is MODULE_DEVICE_TABLE which declares
a const alias of a type that in most cases is already const. One possible
solution would be to remove the 'additional' const qualifier, which
might leave some tables non-const. Another option could be some
hackery to suppress the warning just for the macro. Not sure if any of
this would be acceptable.

> For also this one,
> I'd like to try to fix the code rather than hiding warnings.

I totally agree with the general approach. My clang kernel builds
started with plenty of warnings disabled. I fixed the code for most of
them until I was left with these two extremely noisy ones, for which I
didn't see a clear path.

Cheers

Matthias
