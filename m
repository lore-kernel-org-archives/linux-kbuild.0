Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from helcar.hmeau.com ([216.24.177.18]:37414 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727238AbgCXL4J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 07:56:09 -0400
Date: Tue, 24 Mar 2020 22:55:27 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 16/16] crypto: x86 - clean up
 poly1305-x86_64-cryptogams.S by 'make clean'
Message-ID: <20200324115527.GC31003@gondor.apana.org.au>
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200324084821.29944-17-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324084821.29944-17-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux@googlegroups.com, linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 05:48:21PM +0900, Masahiro Yamada wrote:
> poly1305-x86_64-cryptogams.S is a generated file, so it should be
> cleaned up by 'make clean'.
> 
> Assigning it to the variable 'targets' teaches Kbuild that it is a
> generated file. However, this line is not evaluated while cleaning
> because scripts/Makefile.clean does not include include/config/auto.conf.
> 
> Removing the ifneq-conditional, so this file is correctly cleaned up.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/x86/crypto/Makefile | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
