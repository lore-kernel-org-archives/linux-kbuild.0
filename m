Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61994 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751629AbdEGWsc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 18:48:32 -0400
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com [209.85.161.179]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id v47Mm3Fj027424
        for <linux-kbuild@vger.kernel.org>; Mon, 8 May 2017 07:48:04 +0900
Received: by mail-yw0-f179.google.com with SMTP id l135so22137972ywb.2
        for <linux-kbuild@vger.kernel.org>; Sun, 07 May 2017 15:48:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
References: <20170507145609.4395-1-n54@gmx.com> <1494176499.31950.34.camel@perches.com>
 <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com> <1494188521.31950.43.camel@perches.com>
 <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 May 2017 07:48:02 +0900
Message-ID: <CAK7LNAQJCq3DnEXgCMGyT-3J8PoKVXg=fukS9N5xdnke77AwVA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>
Cc: Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, apw@canonical.com

2017-05-08 5:37 GMT+09:00 Kamil Rytarowski <n54@gmx.com>:
> On 07.05.2017 22:22, Joe Perches wrote:
>> On Sun, 2017-05-07 at 22:14 +0200, Kamil Rytarowski wrote:
>>> On 07.05.2017 19:01, Joe Perches wrote:
>>>> On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
>>>>> The default NetBSD package manager is pkgsrc and it installs Perl
>>>>> along other third party programs under custom and configurable prefix.
>>>>> The default prefix for binary prebuilt packages is /usr/pkg, and the
>>>>> Perl executable lands in /usr/pkg/bin/perl.
>>>>>
>>>>> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
>>>>> the most portable solution that should work for almost everybody.
>>>>> Perl's executable is detected automatically.
>>>>>
>>>>> This change switches -w option passed to the executable with more
>>>>> modern "use warnings;" approach. There is no functional change to the
>>>>> default behavior.
>>>>
>>>> Functionality would then depend on user $PATH.
>>>
>>> Yes.
>>>
>>>> Better?  <shrug>
>>>
>>> Correct.
>>>
>>> In pkgsrc we have automatic scripts to adjust shebangs for scripting
>>> languages (Perl, Python, Bash etc). But in this case I build the Linux
>>> kernel out of the pkgsrc context on my NetBSD workstation.
>>>
>>> Exactly the same change has been accepted in qemu, currently it's
>>> waiting to be merged with master. from the "-trival" branch.
>>>
>>> In my case I won't be enforced to keep fixing it manually every time I
>>> sync with HEAD. Another point is that the Linux version of this script
>>> is model and projects fork it, and we need to keep adjusting it downstream.
>>>
>>>>
>>>> For the perl "-w", adding "use warnings;" instead of
>>>> "-w" seems sensible enough.  Is any build environment
>>>> using a perl version below 5.6?
>>>>
>>>
>>> 5.6 was released in 2003.
>>
>> I know a person using 5.8 (cough: Andrew Morton), but 5.6
>> really is quite old.
>>
>
> It was just decided to depend on GNU Make 3.81 (released 2010).

I think 3.81 was released in 2006
and 3.82 in 2010.





-- 
Best Regards
Masahiro Yamada
