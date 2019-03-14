Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38319 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfCNLH0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Mar 2019 07:07:26 -0400
Received: by mail-lf1-f65.google.com with SMTP id a6so1515221lfl.5
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Mar 2019 04:07:25 -0700 (PDT)
Subject: Re: [PATCH v4] lib/string.c: implement a basic bcmp
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
 <20190313211335.165605-1-ndesaulniers@google.com>
 <953400721b6c4b869b9278c44e0aa796@AcuMS.aculab.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <2899ec10-2ab6-d3a3-37f5-d52395c03a8e@rasmusvillemoes.dk>
Date: Thu, 14 Mar 2019 12:07:22 +0100
MIME-Version: 1.0
In-Reply-To: <953400721b6c4b869b9278c44e0aa796@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@ACULAB.COM>, 'Nick Desaulniers' <ndesaulniers@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Cc: "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 14/03/2019 10.57, David Laight wrote:
> From: Nick Desaulniers
>> Sent: 13 March 2019 21:14
> ...
>> diff --git a/include/linux/string.h b/include/linux/string.h
>> index 7927b875f80c..6ab0a6fa512e 100644
>> --- a/include/linux/string.h
>> +++ b/include/linux/string.h
>> @@ -150,6 +150,9 @@ extern void * memscan(void *,int,__kernel_size_t);
>>  #ifndef __HAVE_ARCH_MEMCMP
>>  extern int memcmp(const void *,const void *,__kernel_size_t);
>>  #endif
>> +#ifndef __HAVE_ARCH_BCMP
>> +extern int bcmp(const void *,const void *,__kernel_size_t);
>> +#endif
> 
> Shouldn't that prototype always be present?

Yes and no. The problem is that asm/string.h may decide to implement
bcmp (or memcpy, memset, strcpy, ...) as a macro, which would break
rather badly when used to declare the function. And we can't undef the
macro temporarily. So I think the convention is that asm/string.h
provides the prototype before it #defines the macro, see e.g.
arch/x86/include/asm/string_32.h which has a #define of memcpy.

There is a fix for the "may be defined as a function-like macro", which is

extern int (bcmp)(const void *,const void *,__kernel_size_t);

I'd like to see that used rather than the ad hoc convention, but it is
of course somewhat unconventional C.

Rasmus
