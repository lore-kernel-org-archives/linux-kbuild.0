Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47339 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeJPRIA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 13:08:00 -0400
MIME-Version: 1.0
References: <20181010222333.17794-1-bp@alien8.de> <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
 <20181011085234.GA25435@zn.tnic> <CAK7LNAS=Kr1W6SfwojEVdwpKy7Au9NRh-wd2Qfo5+aVQVDe9ZQ@mail.gmail.com>
 <20181011153245.GD25435@zn.tnic>
In-Reply-To: <20181011153245.GD25435@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Oct 2018 18:17:50 +0900
Message-ID: <CAK7LNAQv816_ViZVNrSS9rhLHQO_6Pbx9ZOMC1T1FNV3emqS=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fail the build early when no lz4 present
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Oct 12, 2018 at 12:33 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Oct 12, 2018 at 12:08:07AM +0900, Masahiro Yamada wrote:
> > Install lz4c, and run 'make' again.
> > Almost all objects have been built there,
> > so you will finish it soon.
>
> So when this LZ4 thing got added at the time, the lz4 package had to be
> downloaded and built and installed and it wasn't as easy as zypper in
> lz4 or apt-get install lz4.
>
> And I *might* install it if there were a human readable error message
> which would tell me so.
>
> And we should strive to be as user-friendly as possible. And no, this:
>
> /bin/sh: 1: lz4c: not found
> make[2]: *** [arch/x86/boot/compressed/Makefile:145: arch/x86/boot/compressed/vmlinux.bin.lz4] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [arch/x86/boot/Makefile:112: arch/x86/boot/compressed/vmlinux] Error 2
> make: *** [arch/x86/Makefile:290: bzImage] Error 2
> make: *** Waiting for unfinished jobs....
>
> is not user-friendly.
>
> > If you are building up a compile-test machine,
> > you will probably need to install various tools anyway.
>
> Yes, and look how perf tool solves this. Much much better.
>
> > I do not want to add ugly checks in random places.
>
> That's fair.
>
> What would be a fitting place to add such checks and be able to issue a
> human-readable error message to people?

Sorry for delay.

I have been thinking of this
because I have a motivation to
move libelf check in the top Makefile to somewhere else.

I just made a trial.


-- 
Best Regards
Masahiro Yamada
