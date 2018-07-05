Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55808 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752551AbeGEFsK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 01:48:10 -0400
MIME-Version: 1.0
In-Reply-To: <20180702144711.22111-1-hch@lst.de>
References: <20180702144711.22111-1-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Jul 2018 14:47:19 +0900
Message-ID: <CAK7LNAS5md-Q3iyKNa4vraHWRa28E_RhuObJaxssBp2aWzrYDA@mail.gmail.com>
Subject: Re: include architecture Kconfig files from top-level Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

2018-07-02 23:47 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> Hi Masahiro,
>
> what do you think about the series below, which moves the includes
> of all the architecture independ Kconfig files to the top-level
> Kconfig instead of duplicating the includes in all architectures?
>
> Note that this only handles the low-hanging fruite, there are a lot
> of other bits that should probably be cleaned up to be common,
> but those will be not entirely trivial.

Basically, I am positive about this work.

As you have already noticed,
the UML breakage should be fixed.

If the reported problems are stretched out,
I think this is a nice cleanup.

Thanks.


> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
