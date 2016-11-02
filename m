Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62755 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756196AbcKBSaM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 14:30:12 -0400
MIME-Version: 1.0
In-Reply-To: <3e08ed31-b8bf-cba0-67f8-0a66d0cdeeb4@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
 <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
 <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com> <3e08ed31-b8bf-cba0-67f8-0a66d0cdeeb4@users.sourceforge.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Nov 2016 03:30:03 +0900
Message-ID: <CAK7LNARfBrH2ve9J8D=iq1mdk1j-G_kOXT7CL017uqBOYPRL=Q@mail.gmail.com>
Subject: Re: scripts/basic/fixdep: Complete error handling in print_cmdline()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Jim Davis <jim.epost@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-11-03 2:38 GMT+09:00 SF Markus Elfring <elfring@users.sourceforge.net>:
>>>> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
>>>
>>> Rather than scatter fragile magic numbers, like 10, throughout the
>>> code, if you're hell-bent on checking for printf errors you could
>>> write a little wrapper function that hid the magic number and bundled
>>> up the errno stuff.
>>
>>
>> BTW, how the magic number "10" was calculated?
>
> Does the passed format string indicate how many characters should be
> printed at least?

So, the check is a bit compromised.
The printf() should print at lease 10 characters.
If "target" or "cmdline" is not NULL, it should print more.




-- 
Best Regards
Masahiro Yamada
