Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:58717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751473AbeFDOL2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jun 2018 10:11:28 -0400
In-Reply-To: <20180530121922.22122-4-npiggin@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v5, 3/4] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
Message-Id: <40zxgf2gKKz9s7Y@ozlabs.org>
Date: Tue,  5 Jun 2018 00:11:26 +1000 (AEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Wed, 2018-05-30 at 12:19:21 UTC, Nicholas Piggin wrote:
> The powerpc toolchain can compile combinations of 32/64 bit and
> big/little endian, so it's convenient to consider, e.g.,
> 
>   `CC -m64 -mbig-endian`
> 
> To be the C compiler for the purpose of invoking it to build target
> artifacts. So overriding the the CC variable to include thse flags
> works for this purpose.
> 
> Unfortunately that is not compatible with the way the proposed new
> Kconfig macro language will work.
> 
> After previous patches in this series, these flags can be carefully
> passed in using flags instead.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1421dc6d48296a9e91702743b31458

cheers
