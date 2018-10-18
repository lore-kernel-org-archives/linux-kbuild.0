Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f42.google.com ([209.85.210.42]:42577 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbeJRIjW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Oct 2018 04:39:22 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com> <20181017083126.GB22535@zn.tnic>
In-Reply-To: <20181017083126.GB22535@zn.tnic>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 17 Oct 2018 21:40:53 -0300
Message-ID: <CADvQ+rFa=XEuxLb=yPmtJE2QepBNjCVzjEY5urVzCaSF1tJBYw@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hello Boris,


> Next question: why not -Wshadow simply?

Good question. I can change it to -Wshadow and fix stuff for v2.

>
> Also, -Wshadow for the target compiler is an extra warning (W=2). Why is
> it enabled by default here?

The idea was to put it as default and fix all the shadowing warnings.
What do you think?  I am open to suggestions.

Thank you,
Leonardo Bras


> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.
