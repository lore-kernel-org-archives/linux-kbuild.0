Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lithops.sigma-star.at ([195.201.40.130]:44378 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387962AbeGWLrg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jul 2018 07:47:36 -0400
From: Richard Weinberger <richard@nod.at>
Subject: Re: include architecture Kconfig files from top-level Kconfig v2
Date: Mon, 23 Jul 2018 12:46:51 +0200
Message-ID: <8939171.tHQiqpY3WF@blindfold>
In-Reply-To: <20180708152004.21679-1-hch@lst.de>
References: <20180708152004.21679-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org

Am Sonntag, 8. Juli 2018, 17:19:55 CEST schrieb Christoph Hellwig:
> Hi Masahiro,
> 
> what do you think about the series below, which moves the includes
> of all the architecture independ Kconfig files to the top-level
> Kconfig instead of duplicating the includes in all architectures?
> 
> Note that this only handles the low-hanging fruite, there are a lot
> of other bits that should probably be cleaned up to be common,
> but those will be not entirely trivial.
> 
> Changes since v1:
>  - add back a remove source statement from arch/arm/Kconfig
>  - various fixes from Randy
>  - various UML patches to be able to use the common Kconfig

For the UML bits,

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

