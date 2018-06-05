Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:55086 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751534AbeFEFu6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jun 2018 01:50:58 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Jun 2018 07:50:56 +0200
From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v5 24/31] kconfig: add CC_IS_GCC and GCC_VERSION
In-Reply-To: <CAK7LNAQ9t-eRRb_mYunEAocaYksOTr=4sw+pExhMd9AvMx+zOw@mail.gmail.com>
References: <1527499328-13213-1-git-send-email-yamada.masahiro@socionext.com>
 <1527499328-13213-25-git-send-email-yamada.masahiro@socionext.com>
 <dbd4d0dc92ba45dcae81cbab8ab8ba29@agner.ch>
 <CAK7LNAQ9t-eRRb_mYunEAocaYksOTr=4sw+pExhMd9AvMx+zOw@mail.gmail.com>
Message-ID: <9a58f4b4e488a3bfc41aba39bc73f8ff@agner.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild-owner@vger.kernel.org

On 05.06.2018 02:07, Masahiro Yamada wrote:
> Hi Stefan
> 
> 2018-06-05 6:49 GMT+09:00 Stefan Agner <stefan@agner.ch>:
>> Hi Masahiro,
>>
>> On 28.05.2018 11:22, Masahiro Yamada wrote:
>>> This will be useful to specify the required compiler version,
>>> like this:
>>>
>>> config FOO
>>>         bool "Use Foo"
>>>         depends on GCC_VERSION >= 40800
>>>         help
>>>           This feature requires GCC 4.8 or newer.
>>>
>>
>> I tried using CC_IS_GCC today while using clang. It seems that it is set
>> to y despite I am using CC=clang.
>>
>> .config looks like this after config:
>>
>> ...
>> CONFIG_CC_IS_GCC=y
>> CONFIG_GCC_VERSION=40201
>> CONFIG_CC_IS_CLANG=y
>> CONFIG_CLANG_VERSION=60000
>> ...
>>
>>
>> I am using clang 6.0.0 on Arch Linux, which seems to return a version
>> when using gcc-version.sh:
>> ./scripts/gcc-version.sh clang | sed 's/^0*//'
>> 402
>>
>> I guess that should not be the case?
>>
> 
> 
> What will 'clang --version' print on your machine?

$ clang --version
clang version 6.0.0 (tags/RELEASE_600/final)
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir:
/home/ags/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin

I use a symlink to clang in my cross compiler toolchain, that is why
InstalledDir points to a GCC toolchain.

--
Stefan
