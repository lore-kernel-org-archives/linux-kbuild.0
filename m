Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47801 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393353AbfITKZb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 06:25:31 -0400
MIME-Version: 1.0
References: <1568898377.5576.186.camel@lca.pw>
In-Reply-To: <1568898377.5576.186.camel@lca.pw>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 20 Sep 2019 19:24:45 +0900
Message-ID: <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
Subject: Re: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian Cai <cai@lca.pw>
Cc: Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Qian,

On Thu, Sep 19, 2019 at 10:06 PM Qian Cai <cai@lca.pw> wrote:
>
> The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
> kbuild warning,
>
> scripts/Makefile.asm-generic:25: redundant generic-y found in
> arch/arm64/include/asm/Kbuild: dma-mapping.h
>
>

Which tree did you test?

I tried the latest Linus tree (, which contains 5489c8e0cf03),
but I did not see this warning.



-- 
Best Regards
Masahiro Yamada
