Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f195.google.com ([209.85.222.195]:40549 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfCEQqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Mar 2019 11:46:35 -0500
MIME-Version: 1.0
References: <20190304201930.1622839-1-arnd@arndb.de> <20190304201930.1622839-2-arnd@arndb.de>
 <a94c3c6a-481e-96a5-74e1-8c3299c74129@metux.net> <CAK8P3a0vdhCTNTF-K0mXjRWkPvv0qr3nf_52=8n6zTa7p3ELLw@mail.gmail.com>
 <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
In-Reply-To: <54a7d035-155f-c47b-1db1-acb851b3aec6@metux.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Mar 2019 17:46:17 +0100
Message-ID: <CAK8P3a1-AYWtNEqwb4ZMpXKDwGB_ZGLj==uBakh0+L=5g=BQQw@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86: apuv2: fix input dependencies
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linus Walleij <linusw@kernel.org>, Enrico Weigelt <info@metux.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 5, 2019 at 2:50 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 05.03.19 09:23, Arnd Bergmann wrote:
>
> hmm, if circular deps happen, wouldn't that mean we've got some deeper
> problems in here ? IMHO, dependencies should always form a DAG (except
> for some really rare cases).
>
> Do you recall any actual problem w/ input vs gpio vs. drivers ?
> I'd like to have a closer look at it.

Not with gpio. Most of the circular dependencies I've seen tend to
revolve around drivers/gpu/drm, which uses more 'select' statements
than most other subsystems. Those dependencies often touch
backlight, acpi, fbdev and other things then.

       Arnd
