Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:44287 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752700AbeGCNfh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 09:35:37 -0400
Date: Tue, 3 Jul 2018 15:36:16 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from
        top-level Kconfig
Message-ID: <20180703133616.GB15589@lst.de>
References: <20180702144711.22111-1-hch@lst.de> <20180702144711.22111-2-hch@lst.de> <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org> <4dfba139-43a2-5949-3221-39cae3191ae7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dfba139-43a2-5949-3221-39cae3191ae7@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 02, 2018 at 01:08:16PM -0700, Randy Dunlap wrote:
> > I would prefer to have init/Kconfig before arch/$(SRCARCH)/Kconfig.
> 
> Ugh, that won't get this set correctly on x86_64:
> CONFIG_PGTABLE_LEVELS=2

Did you try it?  As far as I can tell modern kconfig isn't really
order sensitive any more.
