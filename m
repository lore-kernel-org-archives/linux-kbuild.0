Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47254 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932237AbeBLDA4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Feb 2018 22:00:56 -0500
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com [209.85.217.172]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w1C30haM023203
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 12:00:44 +0900
Received: by mail-ua0-f172.google.com with SMTP id y17so6865934uaa.13
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Feb 2018 19:00:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1802112023470.31719@knanqh.ubzr>
References: <20180210142504.29890-1-npiggin@gmail.com> <20180210142504.29890-3-npiggin@gmail.com>
 <CAK7LNAT=9d9W8kTjzSTRATLvvHVUqQN-7h_owvon_a=oLy0T_A@mail.gmail.com>
 <20180211211508.4261ebf2@roar.ozlabs.ibm.com> <CAK7LNAQwrtJyydyvvjjtOngCkc9WLk9-0Pk57GpfCP9srAQQrg@mail.gmail.com>
 <nycvar.YSQ.7.76.1802112023470.31719@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 12 Feb 2018 12:00:02 +0900
Message-ID: <CAK7LNAR9OjW-dv+u+rRGma17+Bt2pUPntGRTCwW_drBQOzyqvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rename built-in.o to built-in.a
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

2018-02-12 10:26 GMT+09:00 Nicolas Pitre <nico@fluxnic.net>:
> On Mon, 12 Feb 2018, Masahiro Yamada wrote:
>
>> 2018-02-11 20:15 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
>> > On Sun, 11 Feb 2018 13:38:04 +0900
>> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> >
>> >> Is my 'less' insane?
>> >> Or, is this intentional behavior of 'less'?
>> >
>> > Interesting, my less does not do that. Instead of the raw contents
>> > of the file, yours is providing output of `ar tv`, which is
>> > reconstructing more of the archive metadata. I guess it is keyed
>> > on the filename extension.
>>
>> Ah, I see.  'ar tv' and 'less' gave me the same output.
>>
>>
>> > Do you have an alias for it, or maybe the distro patches the tool?
>>
>> I use Ubuntu 16.04 LTS.
>>
>> Not alias'ed
>>
>> $ type less
>> less is hashed (/usr/bin/less)
>> $ /usr/bin/less kernel/built-in.a | head -n 10
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
>> Could be patched by the disto.
>
> What do you get from:
>
> $ echo $LESSOPEN
>
> ?
>


You are right.
If I reset LESSOPEN, I got what I expect.


$ echo $LESSOPEN
| /usr/bin/lesspipe %s
$ LESSOPEN=  less kernel/built-in.a | head -n 10
!<thin>
//                                              2964      `
fork.o/
exec_domain.o/
panic.o/
cpu.o/
exit.o/
softirq.o/
resource.o/
sysctl.o/



-- 
Best Regards
Masahiro Yamada
