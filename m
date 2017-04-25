Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:49826 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1949172AbdDYUHw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Apr 2017 16:07:52 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2] tags: honor COMPILED_SOURCE with apart output directory
References: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
        <CAK7LNAQN2ZRFETM818ySYSOx1Tykhq7RCYeyFv=x1ARH7w7cww@mail.gmail.com>
Date: Tue, 25 Apr 2017 22:07:47 +0200
In-Reply-To: <CAK7LNAQN2ZRFETM818ySYSOx1Tykhq7RCYeyFv=x1ARH7w7cww@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 25 Apr 2017 03:06:04 +0900")
Message-ID: <87shkwi73g.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Hi Robert,
>> diff --git a/scripts/tags.sh b/scripts/tags.sh
>> index a2ff3388e5ea..35cb64d5211c 100755
>> --- a/scripts/tags.sh
>> +++ b/scripts/tags.sh
>> @@ -106,7 +106,8 @@ all_compiled_sources()
>>                 case "$i" in
>>                         *.[cS])
>>                                 j=${i/\.[cS]/\.o}
>> -                               if [ -e $j ]; then
>> +                               k="${j#$tree}"
>> +                               if [ -e $j -o -e "$k" ]; then
>
>
> Do we need to check both srctree and objtree?
> I think checking objtree (after $tree is ripped off) is enough.

If I remember correctly, as this goes back a couple of monthes when I made the
tests of this patch, the srctree is checked for the case when the kernel is
compiled without O=, and objtree for the case with O=.

Cheers.

-- 
Robert
