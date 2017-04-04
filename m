Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60866 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751782AbdDDD4c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 23:56:32 -0400
MIME-Version: 1.0
In-Reply-To: <20170403202033.GB29829@ravnborg.org>
References: <20170318215823.GS4152@decadent.org.uk> <CAK7LNAQFx-yPj2c52sZ0LSv=UnQz-ATGJGkzT5wV7tq-GmvARw@mail.gmail.com>
 <7bebf377-1268-ee02-c19b-f2d16d69cf79@suse.com> <20170403202033.GB29829@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Apr 2017 12:56:26 +0900
Message-ID: <CAK7LNARgpsWh5xZr=6VhD6GpY2MQSWzvqKC9L382Dzm4Dx4Kow@mail.gmail.com>
Subject: Re: [PATCH] Kbuild.include: addtree: Remove quotes before matching path
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.com>, Ben Hutchings <ben@decadent.org.uk>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable@vger.kernel.org, 856474@bugs.debian.org

Hi Sam,


2017-04-04 5:20 GMT+09:00 Sam Ravnborg <sam@ravnborg.org>:
> On Mon, Apr 03, 2017 at 03:25:10PM +0200, Michal Marek wrote:
>> On 2017-04-03 09:42, Masahiro Yamada wrote:
>> > Each Makefile knows it wants to see
>> > additional headers in the source tree, or objtree.
>> >
>> > I am guessing the right approach in a long run is,
>> > we require -I to specify $(srctree) or $(objtree) explicitly.
>> >
>> > ccflags-y := -I$(srctree)/foo/bar/baz
>> >
>> > or
>> >
>> > ccflags-y := -I$(objtree)/foo/bar/baz
>> >
>> >
>> > (For the latter, we can omit $(objtree)/ as it is ./)
>> >
>> >
>> > Then, delete $(call flags,_c_flags) after the conversion.
>>
>> Agreed. The addtree function is more of a hack to make things just work
>> with O=, but AFAIK there is no clean way to implement VPATH for -I
>> arguments. So it's sensible to get rid of the hack. It looks like it's
>> going to be lot of work though:
>>
>> $ git grep -e '-I' -- '*Makefile*' | wc -l
>> 732
>> $ git grep -e '-I *\$(\(src\|obj\)tree)' -- '*Makefile*' | wc -l
>> 166
>
> There was a goal long time ago that moving the kernel source should
> not trigger a rebuild.
> Any hardcoded path would violate this (like $(srctree), $(objtree))

Even if we avoid hard-coding $(srctree) in each Makefile,
"addtree" will modify the -I paths and the modified paths
will be recorded in .*.cmd files.


If we really want to achieve the goal,
my old patch seemed to have a point:
https://patchwork.kernel.org/patch/4511991/
This was rejected due to side effects, anyway.


-- 
Best Regards
Masahiro Yamada
