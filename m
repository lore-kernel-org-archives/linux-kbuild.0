Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:40200 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726994AbeJQQ0a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 12:26:30 -0400
Date: Wed, 17 Oct 2018 10:31:26 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Message-ID: <20181017083126.GB22535@zn.tnic>
References: <20181017000809.GA21292@WindFlash>
 <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org, willy6545@gmail.com, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Oct 17, 2018 at 05:21:01PM +0900, Masahiro Yamada wrote:
> scripts/Makefile.extrawarn provides options for the target compiler (CC),
> whereas this patch adds -Wshadow=local for the host compiler (HOSTCC).

Aha, this wants to fix shadowing for the host tools, ok.

Next question: why not -Wshadow simply?

Also, -Wshadow for the target compiler is an extra warning (W=2). Why is
it enabled by default here?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
