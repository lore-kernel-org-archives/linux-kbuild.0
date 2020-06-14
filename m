Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26397 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgFNBv3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 21:51:29 -0400
MIME-Version: 1.0
References: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
 <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
In-Reply-To: <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 14 Jun 2020 10:50:13 +0900
Message-ID: <CAK7LNASpHO0SiaciFMJ46yZsix7yPn=E5+k8fqBaXHpayR=wxg@mail.gmail.com>
Subject: Re: [GIT PULL] more Kbuild updates for v5.8-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,

On Sun, Jun 14, 2020 at 5:43 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Jun 13, 2020 at 10:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> >  - fix build rules in binderfs sample
>
> .. oh, and now that this builds, it also made it obvious that the
> .gitignore file was missing.
>
>           Linus


Thank you for the fixes!


-- 
Best Regards
Masahiro Yamada
