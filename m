Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46596 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752003AbeBFPOO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 10:14:14 -0500
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com [209.85.217.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w16FE8a8014901
        for <linux-kbuild@vger.kernel.org>; Wed, 7 Feb 2018 00:14:09 +0900
Received: by mail-ua0-f182.google.com with SMTP id e18so1380339ual.6
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 07:14:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGw6cBuEDUB5tyAr7iaxRQ167sbNboOgF4MnL4-Pd3X66R+g8Q@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
 <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com>
 <CAGw6cBvju1xb5q9ax=GWKeda+CYjztK371gJYETN9YC_Vs+Pww@mail.gmail.com>
 <CAK7LNASPtFvZZBokDi2tRniGawVT=f_Atrsv3qzJV22S7rm8Yg@mail.gmail.com> <CAGw6cBuEDUB5tyAr7iaxRQ167sbNboOgF4MnL4-Pd3X66R+g8Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Feb 2018 00:13:27 +0900
Message-ID: <CAK7LNASb51UbgJLOkoV_L_bpZ0WQ8vHbANnkEyko3txhRSOKWg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Forney <mforney@mforney.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-02-06 19:29 GMT+09:00 Michael Forney <mforney@mforney.org>:
> On 2018-02-06, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> 2018-02-06 18:13 GMT+09:00 Michael Forney <mforney@mforney.org>:
>>> Would you like me to include those other instances of `stat -c %s` in
>>> this patch? I left them out for now because I wasn't sure if they
>>> needed to be sent to various other maintainers as separate patches.
>>
>> I want all instances written in the same way
>> once we make a decision.
>>
>> BTW, is the output format of ls(1) standardized?
>> I am not familiar with this area.
>
> Yes, it is[0]. The -d option turns on -l, which writes lines formatted like
>
> "%s %u %s %s %u %s %s\n", <file mode>, <number of links>,
>     <owner name>, <group name>, <size>, <date and time>,
>     <pathname>

OK.  Please add this evidence with the link
into the commit log.


> but instead of writing the <owner name> and <group name>, it writes
> the numeric owner and group IDs (this avoids /etc/passwd and
> /etc/group lookups as well as potential field splitting issues).
>
> The <size> field is specified as "the value that would be returned for
> the file in the st_size field of struct stat".
>
>> Also, I am not a big fan of the mysterious two lines code.
>> (We will have some more if we fix the rest of the instances)
>>
>>
>> Perhaps, put
>> set -- $(ls -dn $1)
>> echo $5
>>
>> into "scripts/file-size.sh"  (any other suitable file name is OK)
>> then, call it like this?
>>
>>    size1=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms1.o)
>>    size2=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms2.o)
>>
>>
>> Is this less uglier?
>
> This sounds reasonable to me. I will make this change.
>
> [0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html#tag_20_73_10
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
