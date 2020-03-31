Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:55724 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbgCaLCK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 07:02:10 -0400
Subject: Re: single target builds are broken
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
 <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
Date: Tue, 31 Mar 2020 13:01:59 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


On 3/31/20 11:49 AM, Masahiro Yamada wrote:
> On Tue, Mar 31, 2020 at 6:16 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>>
>>
>> Hi,
>>
>> I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
>> not specified in any kernel makefile, and this has worked just fine for
>> years.
>>
>> This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
>> (kbuild: make single targets work more correctly) and just gives an error:
>>
>> $ make kernel/test.o
>>     CALL    scripts/checksyscalls.sh
>>     CALL    scripts/atomic/check-atomics.sh
>>     DESCEND  objtool
>> make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
>> scripts/Makefile.build:502: recipe for target '__build' failed
>> make[1]: *** [__build] Error 2
>> Makefile:1670: recipe for target 'kernel' failed
>> make: *** [kernel] Error 2
> 
> 
> This is intentional to make the single target builds
> work in the same manner as the normal builds.
> 
> 
> The necessary CONFIG dependency must be met.
> 
> obj-$(CONFIG_FOO) += foo.o
> 
> foo.o can be built only when CONFIG_FOO is y/m.
> 
> 
> 
>> For top-level objects (e.g. 'make bar.o') the situation is even worse,
>> since make exits with status 0 without building anything :-/
> 
> 
> There is no .c or .S file at the top-level of the kernel source tree.
> 
> 'make bar.o' never happens.

It doesn't happen in mainline, but I often use that to small test things
in an isolated source file. As just one example you can do

#include <linux/sched.h>
unsigned int task_struct_size = sizeof(struct task_struct);

and then you can look in the object file to find the size. Or any other
of a million useful things that you might want to do without rebuilding
an actual source file or modifying makefiles.

>> Is there any chance we can get this back? It was super useful for me.
> 
> 
> What you want is "Let's build whatever", right?

It's really useful to be able to build object files separately, but as
if it was part of the kernel (so e.g. with all the gcc flags, include
paths, etc.).

> No, please add 'obj-y += test.o' if you want to
> test your local file.

This is a clear workflow regression for me. Why is it so absolutely
necessary to break the way it used to work?

At the very least, can we find a way to reduce the typing overhead for
testing one-offs like that? 'make STANDALONE=1 test.o' or something?


Vegard
