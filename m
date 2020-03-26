Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20175 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgCZVNB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:13:01 -0400
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com> <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
 <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
In-Reply-To: <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Mar 2020 06:12:19 +0900
Message-ID: <CAK7LNAQNx0TxWGCzNM-2JqfEJuyDKnLMcqJv8Be_9_Ty5wv5Lg@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Ingo Molnar <mingo@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Mar 27, 2020 at 5:46 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Mar 26, 2020 at 2:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I collected more Reviewed-by and Acked-by,
> > then pushed this series to
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > kbuild-asinstr
>
> But not the version of the penultimate patch that Nick ack'd....

Dropped Nick's Reviewed-by.


-- 
Best Regards
Masahiro Yamada
