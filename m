Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35438 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968945AbdD3OPH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Apr 2017 10:15:07 -0400
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com [209.85.161.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id v3UEEisF022810
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Apr 2017 23:14:45 +0900
Received: by mail-yw0-f175.google.com with SMTP id 203so47849762ywe.0
        for <linux-kbuild@vger.kernel.org>; Sun, 30 Apr 2017 07:14:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492932183.31767.64.camel@decadent.org.uk>
References: <20170418010011.GC4152@decadent.org.uk> <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
 <1492932183.31767.64.camel@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 30 Apr 2017 23:14:43 +0900
Message-ID: <CAK7LNATV4vsczwkntLJPhvPew4NEL1JeckaBxeFk-6Q-Y_VfoQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Ben,


2017-04-23 16:23 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> On Sun, 2017-04-23 at 15:47 +0900, Masahiro Yamada wrote:
> [...]
>> I tested dtbs_install once again by myself, but
>> dtbinst-root is exported to the sub make
>> and the vendor directories are created correctly.
>>
>>
>> I checked the debian's forum you gave
>> > References: https://bugs.debian.org/833561
>>
>> In there, you mentioned:
>> "This looks like a bug in make, but we can at least work around it by
>> using a non-hyphenated variable name."
>>
>>
>> Does this issue happen on a specific Make version?
>>
>> I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
>> but I was not hit by the problem.
>
> I don't think this is make version dependent.  I can't reproduce the
> issue today with make 4.1.  But I would have been using the same
> version in August when I wrote that.
>
> What more can I say?  Clearly the hyphenated variable gets passed to
> the sub-make in most cases.  But it's not totally reliable because last
> year it wasn't working for us.
>
>> In the last post in the thread, you concluded:
>> "We believe that the bug you reported is fixed in the latest version of
>> linux, which is due to be installed in the Debian FTP archive."
>
> I didn't write that, it's a standard message generated for bugs marked
> as closed in a package changelog. :-)
>
>> If so, why is this patch here?
>> How is the dtbs_install procedure different in the Debian package?
>
> This is the patch I applied to the package.
>

Do you still need this patch for Debian?

If so, I can pick it up because it is apparently harmless
(maybe safer as you said).

However, I may add the following excuse in the git-log:

[masahiro
 I cound not reproduce the issue, but at least this patch is harmless.]




-- 
Best Regards
Masahiro Yamada
