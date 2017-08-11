Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35668 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750714AbdHKXcI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Aug 2017 19:32:08 -0400
MIME-Version: 1.0
In-Reply-To: <598C64A6.2090109@cn.fujitsu.com>
References: <1502198450-7374-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATGat99BK_N9SiyogotLcXFA5P__G-aV6jW+sEw-TGbvA@mail.gmail.com> <598C64A6.2090109@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Aug 2017 08:31:15 +0900
Message-ID: <CAK7LNATCsyg+mFGucfQaKGK_74yfW=vz8s4ii64FD9eV=ztUmw@mail.gmail.com>
Subject: Re: [PATCH] fixdep: trivial: typo fix and correction
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi.

2017-08-10 22:50 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
> Hi Masahiro-san
>
> On 08/10/2017 12:05 AM, Masahiro Yamada wrote:
>> 2017-08-08 22:20 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>
>> Applied to linux-kbuild/fixes.  Thanks!
>>
>
> I want to ask a question via this thread.
>
> I am tracing how each kernel source file compiled, and I met mounts-y in
> init/Makefile, I have trouble in finding the rule which compile
> $(mounts-y), but I clearly see the files in $(mounts-y) are compiled in
> the output of `make -n vmlinux`, but the files listed in mounts-y are
> not listed in obj-y. I think I must miss something, could you give some
> hint?
>


The magic is the following line:

scripts/Makefile.lib  line 55

# if $(foo-objs) exists, foo.o is a composite object
multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip
$($(m:.o=-objs)) $($(m:.o=-y))), $(m))))


If foo.o is added to obj-y and foo-objs or foo-y exist,
they are also expanded.





If you see init/Makefile, mounts.o is added to obj-y.

obj-y                          := main.o version.o mounts.o








-- 
Best Regards
Masahiro Yamada
