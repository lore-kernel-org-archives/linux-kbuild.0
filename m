Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:53635 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgCaEi5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 00:38:57 -0400
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-9-masahiroy@kernel.org>
 <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
In-Reply-To: <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Mar 2020 22:38:41 -0600
Message-ID: <CAHmME9q=Ymmot+c55uQGxy+ztc6ZMgiM0340RGF8wcE3D3TtvQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@infradead.org>

On Mon, Mar 30, 2020 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Also, I slightly prefer
>
>    #if defined(CONFIG_X86_32) && !defined(CONFIG_UML)
>
> to
>
>    #if defined(__i386__) && !defined(__arch_um__)

I would much prefer that too.

At some point it'd be nice to see this whole mess cleaned up with UML.
I've seen this a few places -- UML thinks its x86, except where it's
not, and then there are problems. For example, a lot of SIMD related
code has this.

Jason
