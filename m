Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:36805 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbdDETBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Apr 2017 15:01:33 -0400
Received: by mail-pg0-f41.google.com with SMTP id g2so12758339pge.3
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Apr 2017 12:01:32 -0700 (PDT)
Date: Wed, 5 Apr 2017 12:01:30 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/7] Makefile, x86, LLVM: disable unsupported
 optimization flags
Message-ID: <20170405190130.GD145051@google.com>
References: <20170317001520.85223-1-md@google.com>
 <20170317001520.85223-3-md@google.com>
 <CAK7LNAR2efi4e3-st-hP3T7v=Hkb81beKibgYeKzxs3Q3kP0uA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAR2efi4e3-st-hP3T7v=Hkb81beKibgYeKzxs3Q3kP0uA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michael Davidson <md@google.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Shaohua Li <shli@kernel.org>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-raid@vger.kernel.org

Hi Masahiro,

El Thu, Apr 06, 2017 at 03:08:26AM +0900 Masahiro Yamada ha dit:

> 2017-03-17 9:15 GMT+09:00 Michael Davidson <md@google.com>:
> > Unfortunately, while clang generates a warning about these flags
> > being unsupported it still exits with a status of 0 so we have
> > to explicitly disable them instead of just using a cc-option check.
> >
> > Signed-off-by: Michael Davidson <md@google.com>
> 
> 
> Instead, does the following work for you?
> https://patchwork.kernel.org/patch/9657285/

Thanks for the pointer, I was about to give this change (or rather its
ancestor) a rework myself :)

> You need to use
> $(call cc-option, ...)
> for -falign-jumps=1 and -falign-loops=1

I can confirm that this works.

Thanks

Matthias
