Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f170.google.com ([209.85.160.170]:33766 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbfITNSi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 09:18:38 -0400
Received: by mail-qt1-f170.google.com with SMTP id r5so8634889qtd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 06:18:38 -0700 (PDT)
Message-ID: <1568985515.5576.195.camel@lca.pw>
Subject: Re: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild
 warning
From: Qian Cai <cai@lca.pw>
Date: Fri, 20 Sep 2019 09:18:35 -0400
In-Reply-To: <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
References: <1568898377.5576.186.camel@lca.pw>
         <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Christoph Hellwig <hch@lst.de>, Will Deacon <will@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, 2019-09-20 at 19:24 +0900, Masahiro Yamada wrote:
> Hi Qian,
> 
> On Thu, Sep 19, 2019 at 10:06 PM Qian Cai <cai@lca.pw> wrote:
> > 
> > The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
> > kbuild warning,
> > 
> > scripts/Makefile.asm-generic:25: redundant generic-y found in
> > arch/arm64/include/asm/Kbuild: dma-mapping.h
> > 
> > 
> 
> Which tree did you test?

It was yesterday's linux-next (next-20190918) with this config [1], but it seems
gone in today's linux-next.

[1] https://raw.githubusercontent.com/cailca/linux-mm/master/arm64.config

> 
> I tried the latest Linus tree (, which contains 5489c8e0cf03),
> but I did not see this warning.
> 
> 
> 
