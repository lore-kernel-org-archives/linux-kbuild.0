Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33894 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbeKCBRb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Nov 2018 21:17:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id u6-v6so2243633ljd.1
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Nov 2018 09:09:53 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 4-v6sm2312961ljw.84.2018.11.02.09.09.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Nov 2018 09:09:52 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id j4-v6so2194049ljc.12
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Nov 2018 09:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com>
In-Reply-To: <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Nov 2018 09:09:32 -0700
Message-ID: <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Vasily Gorbik <gor@linux.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dan.carpenter@oracle.com, adilger.kernel@dilger.ca, yamada.masahiro@socionext.com, michal.lkml@markovi.net, rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, David Miller <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, tglx@linutronix.de, Ingo Molnar <mingo@kernel.org>, paullawrence@google.com, sandipan@linux.vnet.ibm.com, andreyknvl@google.com, David Woodhouse <dwmw2@infradead.org>, will.deacon@arm.com, Philippe Ombredanne <pombredanne@nexb.com>, paul.burton@mips.com, rientjes@google.com, w@1wt.eu, msebor@gmail.com, Chris Li <sparse@chrisli.org>, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com, Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org, stefan@agner.ch, luc.vanoostenryck@gmail.com, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri, Nov 2, 2018 at 2:43 AM Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
> You're right, version checks shouldn't matter here. But __no_sanitize_address_or_inline
> shouldn't have been added in the first place, because we already have almost the same
>__no_kasan_or_inline:

Ahh, very good.

Vasily, Martin - since __no_sanitize_address_or_inline was added just
for s390, would you mind replacing it with __no_kasan_or_inline
instead, and testing that in whatever failed before?

Then we can just remove that unnecessary symbol #define entirely..

Thanks,

                 Linus
