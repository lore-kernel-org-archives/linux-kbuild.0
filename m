Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52544 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgCZJWS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 05:22:18 -0400
Date: Thu, 26 Mar 2020 10:22:13 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Message-ID: <20200326092213.GA100918@gmail.com>
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Very little has changed from last time, and this whole series still
> looks good to me. I think I already ack'd most packages, but in case
> it helps:
> 
> Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Ingo Molnar <mingo@kernel.org>

> Since this touches a lot of stuff, it might be best to get it in as 
> early as possible during the merge window, as I imagine new code being 
> added is going to want to be touching those makefiles too.

I'd argue the opposite: please merge this later in the merge window, to 
not disrupt the vast body of other stuff that has already been lined up 
and has been tested, and to give time for these new bits to get tested 
some more.

Also, please get it into -next ASAP, today would be ideal for test 
coverage ...

Thanks,

	Ingo
