Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54982 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbeIRNQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 09:16:06 -0400
MIME-Version: 1.0
In-Reply-To: <db3a6d4ab976c12bfe90354ac370d541@agner.ch>
References: <20180918023157.23951-1-stefan@agner.ch> <CAK7LNASz4zabEdjO2AVscWbqGyjpEBE6Li7busC_sbYkuuJ7tQ@mail.gmail.com>
 <db3a6d4ab976c12bfe90354ac370d541@agner.ch>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Sep 2018 16:43:49 +0900
Message-ID: <CAK7LNASBtO3F3_JmRdstVsy1jUaisHuNZWiQd4ZLEyt3f9_z9g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow to use GCC toolchain not in Clang search path
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stefan,

2018-09-18 12:11 GMT+09:00 Stefan Agner <stefan@agner.ch>:
> On 17.09.2018 20:06, Masahiro Yamada wrote:
>> Hi Stefan,
>>
>> 2018-09-18 11:31 GMT+09:00 Stefan Agner <stefan@agner.ch>:
>>> When using a GCC cross toolchain which is not in a compiled in
>>> Clang search path, Clang reverts to the system assembler and
>>> linker. This leads to assembler or linker errors, depending on
>>> which tool is first used for a given architecture.
>>>
>>> It seems that Clang is not searching $PATH for a matching
>>> assembler or linker.
>>
>>
>> The current code passes the absolute path of toolchains
>> to --gcc-toolchain option.
>> In my understanding, this is enough for Clang
>> to find the proper linker and the assembler.
>>
>>
>> Why is the --prefix option also needed ?
>>
>
> It seems that Clang makes a difference between "toolchain" and search path for toolchain binaries.
>
> Without this patch building fails for the described use case, see the github link for more context.


OK, I confirmed this patch fixed the problem.


I will wait a little more just in case Nick has comments about this.



Thanks.



-- 
Best Regards
Masahiro Yamada
