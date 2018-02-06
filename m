Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:56453 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752256AbeBFJ50 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 04:57:26 -0500
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com [209.85.217.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w169vBwl022195
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Feb 2018 18:57:12 +0900
Received: by mail-ua0-f171.google.com with SMTP id f5so786960ual.8
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2018 01:57:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGw6cBvju1xb5q9ax=GWKeda+CYjztK371gJYETN9YC_Vs+Pww@mail.gmail.com>
References: <20180128225838.1275-1-mforney@mforney.org> <CAGw6cBuHm+D1pdzZFmOrWjPaspE6CTS_-gG6zLFJLLU-aS4nxA@mail.gmail.com>
 <CAK7LNARURw7O5qrAvEvy6SEiDtPKzb=6HtZo84ANLqUCHFHmrw@mail.gmail.com> <CAGw6cBvju1xb5q9ax=GWKeda+CYjztK371gJYETN9YC_Vs+Pww@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 6 Feb 2018 18:56:30 +0900
Message-ID: <CAK7LNASPtFvZZBokDi2tRniGawVT=f_Atrsv3qzJV22S7rm8Yg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use ls(1) instead of stat(1) to obtain file size
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Forney <mforney@mforney.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-02-06 18:13 GMT+09:00 Michael Forney <mforney@mforney.org>:
> On 2018-02-06, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>> I sometimes see patches that address portability.
>> But, the resulted code is generally ugly.
>> (I would not say this is too ugly in this case.)
>>
>>
>> Also, I see some more instances.
>> If 'stat' is a problem,
>> do you have an idea for alternative of "stat -c %Y"?
>
> I'm not aware of a portable alternative for that. However, it is only
> used in a single place for backing up uImage and System.map. If the
> `stat -c %Y` command produces no stdout, it uses the .old extension
> instead which seems like reasonable fallback behavior.

Ah, right.


>> $ git grep 'stat -c'
>> Documentation/acpi/ssdt-overlays.txt:dd if=$tmp
>> of="$EFIVARFS/$name-$guid" bs=$(stat -c %s $tmp)
>> arch/arm/boot/deflate_xip_data.sh:file_end=$(stat -c "%s" "$XIPIMAGE")
>> arch/blackfin/boot/install.sh:  local stamp=$(stat -c %Y ${file}
>> 2>/dev/null)
>> arch/powerpc/boot/wrapper:strip_size=$(stat -c %s $vmz.$$)
>> tools/testing/selftests/efivarfs/efivarfs.sh:   if [ $(stat -c %s
>> $file) -ne 5 ]; then
>
> Would you like me to include those other instances of `stat -c %s` in
> this patch? I left them out for now because I wasn't sure if they
> needed to be sent to various other maintainers as separate patches.

I want all instances written in the same way
once we make a decision.

BTW, is the output format of ls(1) standardized?
I am not familiar with this area.


Also, I am not a big fan of the mysterious two lines code.
(We will have some more if we fix the rest of the instances)


Perhaps, put
set -- $(ls -dn $1)
echo $5

into "scripts/file-size.sh"  (any other suitable file name is OK)
then, call it like this?

   size1=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms1.o)
   size2=$($CONFIG_SHELL $srctree/scripts/file-size.sh .tmp_kallsyms2.o)


Is this less uglier?



-- 
Best Regards
Masahiro Yamada
