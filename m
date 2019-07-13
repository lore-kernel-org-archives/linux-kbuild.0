Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41689 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfGMGHq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jul 2019 02:07:46 -0400
Date: Fri, 12 Jul 2019 23:07:41 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: add --hash-style= and --build-id unconditionally
Message-ID: <20190713060741.GA76046@archlinux-threadripper>
References: <20190713040110.18210-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713040110.18210-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org

On Sat, Jul 13, 2019 at 01:01:10PM +0900, Masahiro Yamada wrote:
> As commit 1e0221374e30 ("mips: vdso: drop unnecessary cc-ldoption")
> explained, these flags are supported by the minimal required version
> of binutils.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Also supported by ld.lld; I tested both arm and x86, the build ID shows
up fine.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
