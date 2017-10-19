Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:46354 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750926AbdJSCTV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 22:19:21 -0400
Received: by mail-io0-f193.google.com with SMTP id 101so8355456ioj.3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Oct 2017 19:19:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATRRu5XxOwRFy7gLbXRHc+OBOFiJ5_B44ZT_hP09DzOnw@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com>
 <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
 <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com>
 <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
 <20171017185206.dquho5wtr5f6pwmv@sirena.co.uk> <CAGXu5jL1bYxHTOAFvO7O=a+3NP1zU8rOisF0WBoX6Sg0EyvQ6g@mail.gmail.com>
 <20171017125645.3f8f6c4516fc641bbf94ed09@linux-foundation.org>
 <CAGXu5jJ0KSEdK+D3Cq=anV6J7RxAfjGpEdi7fss=866dvndJ=g@mail.gmail.com> <CAK7LNATRRu5XxOwRFy7gLbXRHc+OBOFiJ5_B44ZT_hP09DzOnw@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 18 Oct 2017 19:19:19 -0700
Message-ID: <CAGXu5j+z_gb2W8yr+EZTONw_6LDh+a7m6ZwCiOM1ZfHNaWqboQ@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Oct 18, 2017 at 5:41 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Kees,
>
> 2017-10-18 5:06 GMT+09:00 Kees Cook <keescook@chromium.org>:
>> On Tue, Oct 17, 2017 at 12:56 PM, Andrew Morton
>> <akpm@linux-foundation.org> wrote:
>>> On Tue, 17 Oct 2017 11:53:10 -0700 Kees Cook <keescook@chromium.org> wrote:
>>>
>>>> On Tue, Oct 17, 2017 at 11:52 AM, Mark Brown <broonie@kernel.org> wrote:
>>>> > On Tue, Oct 17, 2017 at 08:47:06PM +0200, Arnd Bergmann wrote:
>>>> >
>>>> >> To clarify: with my gcc-4.9/gcc-5 build, -mstack-protector-guard=tls
>>>> >> has no effect,
>>>> >> the output is the same as with -mstack-protector-guard=global using the Ubuntu
>>>> >> compilers of the same version.
>>>> >
>>>> > Jumping in here...  on IRC Arnd suggested reverting 123c48cf899d
>>>> > ("Makefile: introduce CONFIG_CC_STACKPROTECTOR_AUTO") from -next.  What
>>>> > do you think Kees?
>>>>
>>>> Until we sort this out, yes, agreed. Andrew, can you pull the patches?
>>>
>>> Sure.  All these?
>>>
>>> sh-boot-add-static-stack-protector-to-pre-kernel.patch
>>> makefile-move-stackprotector-availability-out-of-kconfig.patch
>>
>> This one can stay. (It does actually fix another case no one else noticed.)
>>
>>> makefile-introduce-config_cc_stackprotector_auto.patch
>>> makefile-introduce-config_cc_stackprotector_auto-fix.patch
>>> makefile-introduce-config_cc_stackprotector_auto-fix-2.patch
>>> makefile-introduce-config_cc_stackprotector_auto-fix-3.patch
>>
>> Yes, these should get dropped for the moment, thanks. Arnd and I have
>> been trying to get to the bottom of it.
>>
>> -Kees
>
>
> I see this series is repeating apply/drop,
> so I am not tracking down the latest status.

They're currently dropped from -next while I figure out what's
breaking 0-day (I haven't had a chance to track it down yet).

> When you have a chance for re-spin,
> please replace
>
>    KBUILD_CFLAGS += -DCONFIG_CC_STACKPROTECTOR
>    KBUILD_AFLAGS += -DCONFIG_CC_STACKPROTECTOR
>
> with
>
>    KBUILD_CPPFLAGS += -DCONFIG_CC_STACKPROTECTOR

Ah! Sure. For some reason I thought CPPFLAGS weren't include in .S builds.

-Kees

-- 
Kees Cook
Pixel Security
