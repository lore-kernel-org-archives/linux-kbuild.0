Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:51235 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728515AbeGQN3n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jul 2018 09:29:43 -0400
Date: Tue, 17 Jul 2018 14:59:41 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/9] kconfig: include common Kconfig files from
        top-level Kconfig
Message-ID: <20180717125941.GA12575@lst.de>
References: <20180708152004.21679-1-hch@lst.de> <20180708152004.21679-5-hch@lst.de> <CAK7LNAT5dzU-SOvqwnDs=bn3WA1_fmDj2abETmoHUdUExVF+WA@mail.gmail.com> <e36e6b2c-0984-199e-8c19-3ec54b31c12e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36e6b2c-0984-199e-8c19-3ec54b31c12e@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig <hch@lst.de>, Richard Weinberger <richard@nod.at>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2018 at 11:33:38PM -0700, Randy Dunlap wrote:
> Thanks for noticing that.
> 
> I have tested all $ARCH (except um) with "allmodconfig" and so far, arch/sh/
> is the only one that has a problem.

I'm a little busy right now, I'll got back to fix sh and retest in a few
days hopefully.
