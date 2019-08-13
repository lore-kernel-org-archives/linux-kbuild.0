Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:46740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfHMHPZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:15:25 -0400
Date: Tue, 13 Aug 2019 00:15:20 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] kbuild: Change fallthrough comments to attributes
Message-ID: <20190813071520.GA5075@infradead.org>
References: <20190812214711.83710-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812214711.83710-1-nhuck@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, clang-built-linux@googlegroups.com

On Mon, Aug 12, 2019 at 02:47:11PM -0700, Nathan Huckleberry wrote:
> Clang does not support the use of comments to label
> intentional fallthrough. This patch replaces some uses
> of comments to attributesto cut down a significant number
> of warnings on clang (from ~50000 to ~200). Only comments
> in commonly used header files have been replaced.
> 
> Since there is still quite a bit of noise, this
> patch moves -Wimplicit-fallthrough to
> Makefile.extrawarn if you are compiling with
> clang.

That __attribute__ crap looks like a cat barfed over the keyboard.

Please fix up clang and keep the kernel source sane.
