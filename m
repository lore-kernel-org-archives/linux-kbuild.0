Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:44280 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752700AbeGCNen (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 09:34:43 -0400
Date: Tue, 3 Jul 2018 15:35:22 +0200
From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from
        top-level Kconfig
Message-ID: <20180703133522.GA15589@lst.de>
References: <20180702144711.22111-1-hch@lst.de> <20180702144711.22111-2-hch@lst.de> <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 02, 2018 at 01:03:57PM -0700, Randy Dunlap wrote:
> Looks good overall.  I'm still doing some testing on it.
> 
> I would prefer to have init/Kconfig before arch/$(SRCARCH)/Kconfig.
> Is there a reason that you chose the ordering above?
> Any known dependencies?

I don't think there are and I'll give it a spin.

The series needs a resend due to arm and user mode linux issues the
builtbot found anyway.
