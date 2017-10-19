Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:37448 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdJSAmK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 20:42:10 -0400
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJ0KSEdK+D3Cq=anV6J7RxAfjGpEdi7fss=866dvndJ=g@mail.gmail.com>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com>
 <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
 <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com>
 <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
 <20171017185206.dquho5wtr5f6pwmv@sirena.co.uk> <CAGXu5jL1bYxHTOAFvO7O=a+3NP1zU8rOisF0WBoX6Sg0EyvQ6g@mail.gmail.com>
 <20171017125645.3f8f6c4516fc641bbf94ed09@linux-foundation.org> <CAGXu5jJ0KSEdK+D3Cq=anV6J7RxAfjGpEdi7fss=866dvndJ=g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Oct 2017 09:41:05 +0900
Message-ID: <CAK7LNATRRu5XxOwRFy7gLbXRHc+OBOFiJ5_B44ZT_hP09DzOnw@mail.gmail.com>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Kees,

2017-10-18 5:06 GMT+09:00 Kees Cook <keescook@chromium.org>:
> On Tue, Oct 17, 2017 at 12:56 PM, Andrew Morton
> <akpm@linux-foundation.org> wrote:
>> On Tue, 17 Oct 2017 11:53:10 -0700 Kees Cook <keescook@chromium.org> wrote:
>>
>>> On Tue, Oct 17, 2017 at 11:52 AM, Mark Brown <broonie@kernel.org> wrote:
>>> > On Tue, Oct 17, 2017 at 08:47:06PM +0200, Arnd Bergmann wrote:
>>> >
>>> >> To clarify: with my gcc-4.9/gcc-5 build, -mstack-protector-guard=tls
>>> >> has no effect,
>>> >> the output is the same as with -mstack-protector-guard=global using the Ubuntu
>>> >> compilers of the same version.
>>> >
>>> > Jumping in here...  on IRC Arnd suggested reverting 123c48cf899d
>>> > ("Makefile: introduce CONFIG_CC_STACKPROTECTOR_AUTO") from -next.  What
>>> > do you think Kees?
>>>
>>> Until we sort this out, yes, agreed. Andrew, can you pull the patches?
>>
>> Sure.  All these?
>>
>> sh-boot-add-static-stack-protector-to-pre-kernel.patch
>> makefile-move-stackprotector-availability-out-of-kconfig.patch
>
> This one can stay. (It does actually fix another case no one else noticed.)
>
>> makefile-introduce-config_cc_stackprotector_auto.patch
>> makefile-introduce-config_cc_stackprotector_auto-fix.patch
>> makefile-introduce-config_cc_stackprotector_auto-fix-2.patch
>> makefile-introduce-config_cc_stackprotector_auto-fix-3.patch
>
> Yes, these should get dropped for the moment, thanks. Arnd and I have
> been trying to get to the bottom of it.
>
> -Kees


I see this series is repeating apply/drop,
so I am not tracking down the latest status.

When you have a chance for re-spin,
please replace

   KBUILD_CFLAGS += -DCONFIG_CC_STACKPROTECTOR
   KBUILD_AFLAGS += -DCONFIG_CC_STACKPROTECTOR

with

   KBUILD_CPPFLAGS += -DCONFIG_CC_STACKPROTECTOR


-- 
Best Regards
Masahiro Yamada
