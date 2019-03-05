Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36726 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfCEN41 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 08:56:27 -0500
MIME-Version: 1.0
References: <20190304201930.1622839-1-arnd@arndb.de> <20190304201930.1622839-2-arnd@arndb.de>
 <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net> <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
 <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
In-Reply-To: <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Mar 2019 15:56:15 +0200
Message-ID: <CAHp75Vcd0eNCBtxb1huMBGFF9JXmropHv2YA1eh-yK3iMFfuFQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

On Tue, Mar 5, 2019 at 3:50 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 05.03.19 09:23, Arnd Bergmann wrote:

> > 1. try to use 'depends on' if you can
>
> Well, this has the unpleasant side effect that we often have to enable
> a lot of things, just to even see the individual driver. For people who
> just wanna configure a kernel for their board, this is a bit nasty.
>
> But, okay, I'm going to do this w/ my own tool - I've written a small
> tool that allows easy kernel reconfiguration on a higher level: you
> can just pick some board templates and enable high level features like
> eth, gpu, etc - it automatically creates a .config for you. I'm going
> announce it on lkml soon.

Darren gave a talk about merging kernel configs to get something like
you want to.
This tool is quite long already lying around. merge_config.sh in your
kernel source tree.

-- 
With Best Regards,
Andy Shevchenko
