Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:44609 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753855AbeFDOLa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jun 2018 10:11:30 -0400
In-Reply-To: <20180530121922.22122-3-npiggin@gmail.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [v5, 2/4] powerpc/kbuild: remove CROSS32 defines from top level powerpc Makefile
Message-Id: <40zxgh6WhFz9s08@ozlabs.org>
Date: Tue,  5 Jun 2018 00:11:25 +1000 (AEST)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

On Wed, 2018-05-30 at 12:19:20 UTC, Nicholas Piggin wrote:
> Switch VDSO32 build over to use CROSS32_COMPILE directly, and have
> it pass in -m32 after the standard c_flags. This allows endianness
> overrides to be removed and the endian and bitness flags moved into
> standard flags variables.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/af3901cbbd3de182aafb8ee553c825

cheers
