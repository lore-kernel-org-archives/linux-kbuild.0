Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:29913 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932266AbeBLA6Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Feb 2018 19:58:16 -0500
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com [209.85.213.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w1C0wDNk014793
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 09:58:14 +0900
Received: by mail-vk0-f44.google.com with SMTP id a63so7940408vkg.6
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Feb 2018 16:58:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180211211508.4261ebf2@roar.ozlabs.ibm.com>
References: <20180210142504.29890-1-npiggin@gmail.com> <20180210142504.29890-3-npiggin@gmail.com>
 <CAK7LNAT=9d9W8kTjzSTRATLvvHVUqQN-7h_owvon_a=oLy0T_A@mail.gmail.com> <20180211211508.4261ebf2@roar.ozlabs.ibm.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Feb 2018 09:57:32 +0900
Message-ID: <CAK7LNAQwrtJyydyvvjjtOngCkc9WLk9-0Pk57GpfCP9srAQQrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rename built-in.o to built-in.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-02-11 20:15 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> On Sun, 11 Feb 2018 13:38:04 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> 2018-02-10 23:25 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
>> > Incremental linking is gone, so rename built-in.o to built-in.a, which
>> > is the usual extension for archive files.
>> >
>> > This patch does two things, first is a simple search/replace:
>> >
>> > git grep -l 'built-in\.o' | xargs sed -i 's/built-in\.o/built-in\.a/g'
>> >
>> > The second is to invert nesting of nested text manipulations to avoid
>> > filtering built-in.a out from libs-y2:
>> >
>> > -libs-y2 := $(filter-out %.a, $(patsubst %/, %/built-in.a, $(libs-y)))
>> > +libs-y2 := $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))
>> >
>> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>
>>
>> I think this is the right thing to do, but I have no idea
>> why 'less kernel/built-in.a' shows strange output.
>> Do you have a clue?
>>
>>
>> Without this patch,
>> 'emacs kernel/built-in.o'
>> 'cat kernel/built-in.o'
>> 'less kernel/built-in.o'
>>
>> showed me the same content.
>>
>> $ less kernel/built-in.o | head -n 10
>> !<thin>
>> //                                              2964      `
>> fork.o/
>> exec_domain.o/
>> panic.o/
>> cpu.o/
>> exit.o/
>> softirq.o/
>> resource.o/
>> sysctl.o/
>>
>>
>>
>>
>> After applying this patch,
>> 'less kernel/built-in.a' is strange.
>>
>>
>> $ less kernel/built-in.a | head -n 10
>> rw-r--r-- 0/0  60216 Jan  1 09:00 1970 kernel/fork.o
>> rw-r--r-- 0/0   3648 Jan  1 09:00 1970 kernel/exec_domain.o
>> rw-r--r-- 0/0  20552 Jan  1 09:00 1970 kernel/panic.o
>> rw-r--r-- 0/0  87752 Jan  1 09:00 1970 kernel/cpu.o
>> rw-r--r-- 0/0  34136 Jan  1 09:00 1970 kernel/exit.o
>> rw-r--r-- 0/0  41448 Jan  1 09:00 1970 kernel/softirq.o
>> rw-r--r-- 0/0  40904 Jan  1 09:00 1970 kernel/resource.o
>> rw-r--r-- 0/0  60968 Jan  1 09:00 1970 kernel/sysctl.o
>> rw-r--r-- 0/0   4472 Jan  1 09:00 1970 kernel/sysctl_binary.o
>> rw-r--r-- 0/0  12472 Jan  1 09:00 1970 kernel/capability.o
>>
>>
>> However, 'cat kernel/built-in.a' works as I expect.
>>
>> $ cat  kernel/built-in.a | head -n 10
>> !<thin>
>> //                                              2964      `
>> fork.o/
>> exec_domain.o/
>> panic.o/
>> cpu.o/
>> exit.o/
>> softirq.o/
>> resource.o/
>> sysctl.o/
>>
>>
>>
>> Is my 'less' insane?
>> Or, is this intentional behavior of 'less'?
>
> Interesting, my less does not do that. Instead of the raw contents
> of the file, yours is providing output of `ar tv`, which is
> reconstructing more of the archive metadata. I guess it is keyed
> on the filename extension.

Ah, I see.  'ar tv' and 'less' gave me the same output.


> Do you have an alias for it, or maybe the distro patches the tool?

I use Ubuntu 16.04 LTS.

Not alias'ed

$ type less
less is hashed (/usr/bin/less)
$ /usr/bin/less kernel/built-in.a | head -n 10
rw-r--r-- 0/0  60216 Jan  1 09:00 1970 kernel/fork.o
rw-r--r-- 0/0   3648 Jan  1 09:00 1970 kernel/exec_domain.o
rw-r--r-- 0/0  20552 Jan  1 09:00 1970 kernel/panic.o
rw-r--r-- 0/0  87752 Jan  1 09:00 1970 kernel/cpu.o
rw-r--r-- 0/0  34136 Jan  1 09:00 1970 kernel/exit.o
rw-r--r-- 0/0  41448 Jan  1 09:00 1970 kernel/softirq.o
rw-r--r-- 0/0  40904 Jan  1 09:00 1970 kernel/resource.o
rw-r--r-- 0/0  60968 Jan  1 09:00 1970 kernel/sysctl.o
rw-r--r-- 0/0   4472 Jan  1 09:00 1970 kernel/sysctl_binary.o
rw-r--r-- 0/0  12472 Jan  1 09:00 1970 kernel/capability.o



Could be patched by the disto.




> It seems a bit rude for your less tool to reformat data for you.
>
> Thanks,
> Nick
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
