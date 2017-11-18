Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18236 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937526AbdKREJM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 23:09:12 -0500
MIME-Version: 1.0
In-Reply-To: <1510072307-16819-3-git-send-email-yamada.masahiro@socionext.com>
References: <1510072307-16819-1-git-send-email-yamada.masahiro@socionext.com> <1510072307-16819-3-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 18 Nov 2017 13:08:27 +0900
Message-ID: <CAK7LNATMJMr-DSP=aukpbuOffBFwY-hP6a4NJenrCcivt5HmMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove all dummy assignments to obj-
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linux-MIPS <linux-mips@linux-mips.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ralf Baechle <ralf@linux-mips.org>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Daniel Borkmann <daniel@iogearbox.net>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2017-11-08 1:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Now kbuild core scripts create empty built-in.o where necessary.
> Remove "obj- := dummy.o" tricks.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
