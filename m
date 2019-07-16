Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f182.google.com ([209.85.208.182]:39219 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728366AbfGPSqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 14:46:52 -0400
Received: by mail-lj1-f182.google.com with SMTP id v18so20983951ljh.6
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 11:46:51 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t137sm2953653lff.78.2019.07.16.11.46.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:46:49 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id d24so21002445ljg.8
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 11:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com> <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
 <20190716181324.GA41555@gmail.com>
In-Reply-To: <20190716181324.GA41555@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2019 11:46:32 -0700
Message-ID: <CAHk-=wjw5JGdP=1ezB4ZCQV1kCMR4K=NhSoA6AAOD1wuV=sH=A@mail.gmail.com>
Subject: Re: kbuild: Fail if gold linker is detected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Jul 16, 2019 at 11:13 AM Ingo Molnar <mingo@kernel.org> wrote:
>
> Then please make this a bit more apparent, such as:
>
>  "The gold linker has known issues of failing the build in random
>   but also in more predictible ways."

Maybe even mention a couple of particular known failure cases.

Just in case somebody decides to start up active gold development
again, and actually look at cases it fails at...

               Linus
