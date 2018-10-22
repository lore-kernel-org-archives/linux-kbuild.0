Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f68.google.com ([209.85.161.68]:34965 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbeJVTTe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Oct 2018 15:19:34 -0400
Received: by mail-yw1-f68.google.com with SMTP id y76-v6so15821783ywd.2
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Oct 2018 04:01:29 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x64-v6sm10385283ywx.103.2018.10.22.04.01.28
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Oct 2018 04:01:28 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id o8-v6so15956233ybk.13
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Oct 2018 04:01:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANiq72n4+HDXPqr7xySSGx49g8vEcXaxO7a-By9cSg7YSxOS_A@mail.gmail.com>
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com> <20181021222712.GI1617@thunk.org>
 <CANiq72mXV6WTyHXNZJDTfFOpPrXD0zD6cB30bGOuKO44AvRiog@mail.gmail.com>
 <CAGXu5jKb-0H+smRAW6ngQKDZ-PbTThhMwhmu34iB8vjTa-4H8Q@mail.gmail.com> <CANiq72n4+HDXPqr7xySSGx49g8vEcXaxO7a-By9cSg7YSxOS_A@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 22 Oct 2018 03:53:12 -0700
Message-ID: <CAGXu5jLzfuEnWpJFL1Caq94nKbPps-QTaYGpge2CfZWj1Zzf9g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ted Ts'o <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dan <dan.carpenter@oracle.com>, Andreas Dilger <adilger.kernel@dilger.ca>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Olof Johansson <olof@lxom.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, David Miller <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Sandipan Das <sandipan@linux.vnet.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, David Woodhouse <dwmw2@infradead.org>, Will Deacon <will.deacon@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, Paul Burton <paul.burton@mips.com>, David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>, Martin Sebor <msebor@gmail.com>, Christopher Li <sparse@chrisli.org>, Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>, Dominique Martinet <asmadeus@codewreck.org>, Stefan Agner <stefan@agner.ch>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Ext4 Developers List <linux-ext4@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Oct 22, 2018 at 2:41 AM, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Oct 22, 2018 at 11:36 AM Kees Cook <keescook@chromium.org> wrote:
>>
>> We need to make sure the static analyzers are happy with either
>> method. Additionally, when was -Wimplicit-fallthrough added to GCC? If
>> it was added _before_ the attribute, we need to continue using the
>> comment style otherwise we lose coverage even with gcc itself.
>> Additionally, does Clang support this attribute (it supports
>> -Wimplicit-fallthrough).
>
> Please take a look at the rationale (also more details at the linked thread):
>
>   * gcc 7.1 added -Wimplicit-fallthrough at the same time as the
> attribute and the comment parsing.

Ah, perfect. I missed this. :)

>   * clang does *not* support the attribute in C.

Well that's not good. :)

-Kees

-- 
Kees Cook
Pixel Security
