Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:51246 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728515AbeGQNaR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jul 2018 09:30:17 -0400
Date: Tue, 17 Jul 2018 15:00:16 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/9] kconfig: include common Kconfig files from
        top-level Kconfig
Message-ID: <20180717130016.GB12575@lst.de>
References: <20180708152004.21679-1-hch@lst.de> <20180708152004.21679-5-hch@lst.de> <CAK7LNAT5dzU-SOvqwnDs=bn3WA1_fmDj2abETmoHUdUExVF+WA@mail.gmail.com> <e36e6b2c-0984-199e-8c19-3ec54b31c12e@infradead.org> <7d4e0925-3d6b-7698-1ef3-4c66500d8507@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d4e0925-3d6b-7698-1ef3-4c66500d8507@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig <hch@lst.de>, Richard Weinberger <richard@nod.at>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2018 at 11:42:54PM -0700, Randy Dunlap wrote:
> Well, there are 3 $ARCH-es that have an arch/$ARCH/mm/Kconfig file:
> arm, sh, and unicore32.
> 
> We can either merge those into arch/$ARCH/Kconfig or we can source
> arch/$ARCH/mm/Kconfig for all $ARCH (where most of these files will be
> empty).
> 
> Christoph, thoughts/ideas?

I'd say lets keep them for now, not good reason to change any of
this stuff.
