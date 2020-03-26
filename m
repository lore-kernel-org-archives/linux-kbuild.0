Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:35275 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbgCZISJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:18:09 -0400
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Mar 2020 02:12:54 -0600
Message-ID: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Very little has changed from last time, and this whole series still
looks good to me. I think I already ack'd most packages, but in case
it helps:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Since this touches a lot of stuff, it might be best to get it in as
early as possible during the merge window, as I imagine new code being
added is going to want to be touching those makefiles too.
