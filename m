Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:33339 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730096AbeGSNwH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Jul 2018 09:52:07 -0400
Date: Thu, 19 Jul 2018 15:11:49 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/9] kconfig: include common Kconfig files from
        top-level Kconfig
Message-ID: <20180719131149.GA12480@lst.de>
References: <20180708152004.21679-1-hch@lst.de> <20180708152004.21679-5-hch@lst.de> <CAK7LNAT5dzU-SOvqwnDs=bn3WA1_fmDj2abETmoHUdUExVF+WA@mail.gmail.com> <17c45e87-d9be-8453-1bce-18753e0a68b9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c45e87-d9be-8453-1bce-18753e0a68b9@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig <hch@lst.de>, Richard Weinberger <richard@nod.at>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jul 18, 2018 at 12:06:26AM -0700, Randy Dunlap wrote:
> All $ARCH look equivalent except for microblaze and nios2.
> For those, the config SWAP in init/Kconfig (line 221) comes before (and
> hence takes precedence) over arch/$(SRCARCH)/Kconfig settings, which is
> def_bool n for both microblaze and nios2.

Both of those are NOMMU architectures, so the default SWAP
decaration should do the right thing.

I wish the kconfig tools could warn about duplicate symbols, as they
are basically always bogus or at least very problematic.

I've update the kconfig-cleanup branch in git with the fixes, but
I didn't have time to do anything but a trivial x86 test yet.
