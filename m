Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:38450 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752187AbeBFK3T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 05:29:19 -0500
Received: by mail-ot0-f194.google.com with SMTP id h14so461279otj.5
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 02:29:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASPtFvZZBokDi2tRniGawVT=f_Atrsv3qzJV22S7rm8Yg@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
 <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com>
 <CAGw6cBvju1xb5q9ax=GWKeda+CYjztK371gJYETN9YC_Vs+Pww@mail.gmail.com> <CAK7LNASPtFvZZBokDi2tRniGawVT=f_Atrsv3qzJV22S7rm8Yg@mail.gmail.com>
From: Michael Forney <mforney@mforney.org>
Date: Tue, 6 Feb 2018 02:29:17 -0800
Message-ID: <CAGw6cBuEDUB5tyAr7iaxRQ167sbNboOgF4MnL4-Pd3X66R+g8Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2018-02-06, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> 2018-02-06 18:13 GMT+09:00 Michael Forney <mforney@mforney.org>:
>> Would you like me to include those other instances of `stat -c %s` in
>> this patch? I left them out for now because I wasn't sure if they
>> needed to be sent to various other maintainers as separate patches.
>
> I want all instances written in the same way
> once we make a decision.
>
> BTW, is the output format of ls(1) standardized?
> I am not familiar with this area.

Yes, it is[0]. The -d option turns on -l, which writes lines formatted like

"%s %u %s %s %u %s %s\n", <file mode>, <number of links>,
    <owner name>, <group name>, <size>, <date and time>,
    <pathname>

but instead of writing the <owner name> and <group name>, it writes
the numeric owner and group IDs (this avoids /etc/passwd and
/etc/group lookups as well as potential field splitting issues).

The <size> field is specified as "the value that would be returned for
the file in the st_size field of struct stat".

> Also, I am not a big fan of the mysterious two lines code.
> (We will have some more if we fix the rest of the instances)
>
>
> Perhaps, put
> set -- $(ls -dn $1)
> echo $5
>
> into "scripts/file-size.sh"  (any other suitable file name is OK)
> then, call it like this?
>
>    size1=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms1.o)
>    size2=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms2.o)
>
>
> Is this less uglier?

This sounds reasonable to me. I will make this change.

[0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html#tag_20_73_10
