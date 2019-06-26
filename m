Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:39708 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfFZOav (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jun 2019 10:30:51 -0400
Date: Wed, 26 Jun 2019 16:30:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: add more hints about SUBDIRS replacement
Message-ID: <20190626143046.GA12510@ravnborg.org>
References: <20190625085127.9446-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625085127.9446-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Herbert Xu <herbert@gondor.apana.org.au>, Xi Wang <wangxi11@huawei.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Tue, Jun 25, 2019 at 05:51:27PM +0900, Masahiro Yamada wrote:
> Commit 0126be38d988 ("kbuild: announce removal of SUBDIRS if used")
> added a hint about the 'SUBDIRS' replacement, but it was not clear
> enough.
> 
> Multiple people sent me similar questions, patches.
> 
>   https://lkml.org/lkml/2019/1/17/456
> 
> I did not mean to suggest M= for building a subdirectory in the kernel
> tree.
> 
> >From the commit 669efc76b317 ("net: hns3: fix compile error"), people
> already (ab)use M=... to do that because it seems to work to some extent.
> 
> Documentation/kbuild/kbuild.txt says M= and KBUILD_EXTMOD are used for
> building external modules.
> 
> In fact, Kbuild supports the single target '%/' for this purpose, but
> this may not be noticed much.
> 
> Kindly add more hints.
> 
> Makefile:213: ================= WARNING ================
> Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
> Makefile:215:
> Makefile:216: If you are building an individual subdirectory
> Makefile:217: in the kernel tree, you can do like this:
> Makefile:218: $ make path/to/dir/you/want/to/build/
> Makefile:219: (Do not forget the trailing slash)
> Makefile:220:
> Makefile:221: If you are building an external module,
> Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
> Makefile:223: ==========================================
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Nice!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
