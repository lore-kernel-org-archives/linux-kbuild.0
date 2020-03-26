Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19131 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCZUoG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:44:06 -0400
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com>
In-Reply-To: <20200326092213.GA100918@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Mar 2020 05:43:18 +0900
Message-ID: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi all,

On Thu, Mar 26, 2020 at 6:22 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Very little has changed from last time, and this whole series still
> > looks good to me. I think I already ack'd most packages, but in case
> > it helps:
> >
> > Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> > Since this touches a lot of stuff, it might be best to get it in as
> > early as possible during the merge window, as I imagine new code being
> > added is going to want to be touching those makefiles too.
>
> I'd argue the opposite: please merge this later in the merge window, to
> not disrupt the vast body of other stuff that has already been lined up
> and has been tested, and to give time for these new bits to get tested
> some more.

I agree.


> Also, please get it into -next ASAP, today would be ideal for test
> coverage ...

I collected more Reviewed-by and Acked-by,
then pushed this series to

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-asinstr

It will show up in -next soon.


-- 
Best Regards
Masahiro Yamada
