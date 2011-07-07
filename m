Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:43493 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755856Ab1GGMR7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jul 2011 08:17:59 -0400
Received: by fxd18 with SMTP id 18so1038091fxd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jul 2011 05:17:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E1585DB020000780004C890@nat28.tlf.novell.com>
References: <4E11F1C6020000780004C089@nat28.tlf.novell.com>
	<CAPk1OjGKD+i=RkfMq9GX_HeOdNSH1o5Bp2Ge6QXGy0edi+1kSQ@mail.gmail.com>
	<4E12F9EB020000780004C219@nat28.tlf.novell.com>
	<87oc16kils.fsf@rustcorp.com.au>
	<4E1585DB020000780004C890@nat28.tlf.novell.com>
Date: Thu, 7 Jul 2011 14:17:57 +0200
Message-ID: <CAPk1OjH4Otd-+q3tD6KYx9ZBT=zenYBvpQMm8LthPd1D1c+AKg@mail.gmail.com>
Subject: Re: sorting of exports breaks modpost's GPL checking
From: Alessio Igor Bogani <abogani@kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

Dear Mr. Beulich,

2011/7/7 Jan Beulich <JBeulich@novell.com>:
[...]
> Especially for the purpose of distros I think it is quite valuable to
> know at build time whether there's any inconsistency that would
> result in runtime problems (and you certainly don't expect that
> testing would manage to cover each and every obscure module).

I have just started working on this issue. I hope to fix as soon as
possible but the modpost.c's code isn't trivial so I'll could take
some days.

Any help by more experienced developers is appreciated.

Thanks!

Ciao,
Alessio
