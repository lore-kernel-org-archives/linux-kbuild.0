Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41244 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbeJSKzL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Oct 2018 06:55:11 -0400
MIME-Version: 1.0
References: <20181017000809.GA21292@WindFlash> <20181017081115.GA22535@zn.tnic>
 <CAK7LNASVn7CB5uL9tCtNC2u4Ary5eb-vyiB_sS2ey5AZNweKAA@mail.gmail.com>
 <20181017083126.GB22535@zn.tnic> <CADvQ+rFa=XEuxLb=yPmtJE2QepBNjCVzjEY5urVzCaSF1tJBYw@mail.gmail.com>
 <20181018091606.GA20831@zn.tnic> <CAK7LNAQq7aE_2QYwqei7M9fg8Yen7-ucjz-t2E_hq2xkznKsQw@mail.gmail.com>
 <20181018165057.GH20831@zn.tnic> <CAK7LNAQhbn-qZg_Bywk8rf0+oZhVbDjJ=PtcKGCL+k4Fp-ijSw@mail.gmail.com>
In-Reply-To: <CAK7LNAQhbn-qZg_Bywk8rf0+oZhVbDjJ=PtcKGCL+k4Fp-ijSw@mail.gmail.com>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Thu, 18 Oct 2018 23:50:57 -0300
Message-ID: <CADvQ+rHRaoAME=tJBzkTg74K237SNm2hFN8mxFemDwa3CKQibA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Borislav Petkov <bp@alien8.de>, lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Thu, Oct 18, 2018 at 11:42 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Adding -Wshadow to KBUILD_HOSTCFLAGS emits another warning in Kconfig.
> Of course, it is easy to fix.
For v2, I already replaced '-Wshadow=local' for '-Wshadow' and fixed this
warning.

> But, I just started to think this option is a kind of harsh...

The v2 it's almost done. You think it will be useful, or should I drop it?

Regards,
Leonardo Bras
