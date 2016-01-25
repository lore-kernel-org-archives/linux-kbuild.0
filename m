Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:38017 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751913AbcAYQXC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Jan 2016 11:23:02 -0500
Received: by mail-wm0-f45.google.com with SMTP id b14so88534770wmb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jan 2016 08:23:01 -0800 (PST)
Subject: Re: Dependency issue through subdir's
References: <56A6080C.2070006@kbingham.co.uk> <56A62187.3070805@suse.com>
From: Kieran Bingham <kieran@kbingham.co.uk>
Message-ID: <56A64BE2.9030105@kbingham.co.uk>
Date: Mon, 25 Jan 2016 16:22:58 +0000
MIME-Version: 1.0
In-Reply-To: <56A62187.3070805@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Michal,

Thanks for your fast response!

On 25/01/16 13:22, Michal Marek wrote:
> On 2016-01-25 12:33, Kieran Bingham wrote:
>> This is functional on a make -j1 build, however at -j2 and above (from a
>> clean build), kbuild attempts to generate my file before
>> include/generated/timeconst.h resulting in the following error:
>>
>> --- 8< ---
>>   GEN     scripts/gdb/linux/constants.py
>> In file included from sources/linux/include/linux/ktime.h:25:0,
>>                  from /linux/include/linux/rcupdate.h:47,
>>                  from /linux/include/linux/rbtree.h:34,
>>                  from /linux/include/linux/mm_types.h:9,
>>                  from /linux/arch/x86/include/asm/pgtable.h:448,
>>                  from /linux/scripts/gdb/linux/constants.py.in:16:
>> sources/linux/include/linux/jiffies.h:10:33: fatal error:
>> generated/timeconst.h: No such file or directory
>> --- >8 ---
> [...]
>> 2) Move the code that generates this file to /Kbuild. However I don't
>> like the idea of putting non-essential generator at the top level build
> 
> You can keep the code in scripts/gdb/..., just move it out of $(always)
> and have the toplevel Kbuild file call something like
> 
>   $(MAKE) $(obj)=scripts/gdb/linux build_constants
> 

Looks like this will have to be the path forwards, as it appears I do
need some of the generated headers...

> 
>> 3) Add #ifndef __GENERATE_CONSTANTS_PY__ across any reference to
>> generated header files, such as in ktime.h, and define that with my
>> Preprocessor statement.

Hrm ...
This simply moves the error on to the next generated file :
generated/bounds.h: which unfortunately I do need!

> 
> If you do not need the generated headers, this might be the least evil.
> We already have the COMPILE_OFFSETS and __GENERATING_BOUNDS_H defines
> for a similar purpose.
> 
> Michal
> 

I've got a working patch now for the $(MAKE) version,
however I've had to use $(build)=scripts/gdb/linux build_constants to
make it work.


Thanks again for your help
-- 
Regards

Kieran Bingham
