Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32540 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbeJSKq0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Oct 2018 06:46:26 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
 <20181017083126.GB22535@zn.tnic> <CADvQ+rFa=XEuxLb=yPmtJE2QepBNjCVzjEY5urVzCaSF1tJBYw@mail.gmail.com>
 <20181018091606.GA20831@zn.tnic> <CAK7LNAQq7aE_2QYwqei7M9fg8Yen7-ucjz-t2E_hq2xkznKsQw@mail.gmail.com>
 <20181018165057.GH20831@zn.tnic>
In-Reply-To: <20181018165057.GH20831@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 Oct 2018 11:41:31 +0900
Message-ID: <CAK7LNAQhbn-qZg_Bywk8rf0+oZhVbDjJ=PtcKGCL+k4Fp-ijSw@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Oct 19, 2018 at 1:53 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Fri, Oct 19, 2018 at 01:39:21AM +0900, Masahiro Yamada wrote:
> > It is not realistic to enable this warning option by default.
>
> I believe the question is whether to enable that warning by default in
> KBUILD_HOSTCFLAGS. Enabling it by default for the target kernel is of
> course, too noisy. That's why it is hidden behind W=2 there.


Sorry, I misunderstood the question.

The difference about the noisiness between CC and HOSTCC
is just comes from the amount of source code.

Adding -Wshadow to KBUILD_HOSTCFLAGS emits another warning in Kconfig.
Of course, it is easy to fix.
But, I just started to think this option is a kind of harsh...


--
Best Regards
Masahiro Yamada
