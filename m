Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from helcar.hmeau.com ([216.24.177.18]:37400 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbgCXLz7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 07:55:59 -0400
Date: Tue, 24 Mar 2020 22:54:55 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 13/16] crypto: curve25519 - do not pollute dispatcher
 based on assembler
Message-ID: <20200324115455.GB31003@gondor.apana.org.au>
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200324084821.29944-14-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324084821.29944-14-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux@googlegroups.com, linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>

On Tue, Mar 24, 2020 at 05:48:18PM +0900, Masahiro Yamada wrote:
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> 
> Since we're doing a static inline dispatch here, we normally branch
> based on whether or not there's an arch implementation. That would have
> been fine in general, except the crypto Makefile prior used to turn
> things off -- despite the Kconfig -- resulting in us needing to also
> hard code various assembler things into the dispatcher too. The horror!
> Now that the assembler config options are done by Kconfig, we can get
> rid of the inconsistency.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  include/crypto/curve25519.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
