Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53041 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933174AbdKPAQV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 19:16:21 -0500
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTuxTzTTB6PBesK1UktWbpQD_MN-w9J1S77Exn87-1AwA@mail.gmail.com>
References: <1510569641-28179-1-git-send-email-yamada.masahiro@socionext.com> <CAHC9VhTuxTzTTB6PBesK1UktWbpQD_MN-w9J1S77Exn87-1AwA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 09:15:36 +0900
Message-ID: <CAK7LNAQs_pAbJckzhao5B4dfYkvRPGkne6Xkd3ne0jBoJ9d_rA@mail.gmail.com>
Subject: Re: [PATCH] selinux: remove unnecessary assignment to subdir-
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eric Paris <eparis@parisplace.org>, selinux@tycho.nsa.gov, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>

2017-11-14 7:41 GMT+09:00 Paul Moore <paul@paul-moore.com>:
> On Mon, Nov 13, 2017 at 5:40 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Makefile.clean descends into $(subdir-y).  Dummy assignment to subdir-
>> is meaningless.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> I will pick this up for kbuild tree
>> since this is very trivial from the build system point of view.
>
> Okay, thanks.
>
> Acked-by: Paul Moore <paul@paul-moore.com>
>

Applied to linux-kbuild/kbuild.



-- 
Best Regards
Masahiro Yamada
