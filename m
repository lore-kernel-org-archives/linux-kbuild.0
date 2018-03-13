Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:46340 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbeCMGXx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Mar 2018 02:23:53 -0400
Received: by mail-ua0-f193.google.com with SMTP id d1so8452600ual.13
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 23:23:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180313061603.jsgiumet23uqi6hl@gmail.com>
References: <20180313061109.72629-1-dianders@chromium.org> <20180313061109.72629-3-dianders@chromium.org>
 <20180313061603.jsgiumet23uqi6hl@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Mar 2018 23:23:50 -0700
Message-ID: <CAD=FV=UEuWww=H=TY=E8JvEmrobDNi5+rbTXvTAmZ2brpK+sdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: Don't mess with the .cache.mk when root
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Mathieu Malaterre <malat@debian.org>, Dave Hansen <dave.hansen@intel.com>, Yang Shi <yang.s@alibaba-inc.com>, Guenter Roeck <linux@roeck-us.net>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>

Hi,

On Mon, Mar 12, 2018 at 11:16 PM, Ingo Molnar <mingo@kernel.org> wrote:
>
> * Douglas Anderson <dianders@chromium.org> wrote:
>
>> +# Don't create Makefile caches if running as root since they can't be deleted
>> +# easily; in the real world we might be root when doing "sudo make install"
>> +ifeq ($(shell id -u),0)
>> +export KBUILD_NOCACHE := 1
>> +endif
>
> Please don't do this - many prominent kernel developers build their kernels as
> root - this makes the build slower for them, and also bifurcates testing.

Ah, interesting.  I hadn't realized that!

I'm OK with dropping this patch myself.  It was mostly addressing a
potential problem pointed out by Masahiro Yamada when we were talking
about .cache.mk, but I don't think anyone has actually experienced the
problems listed in the CL description.  I suppose the other option
would be to go back to keying off the "install" target (like v2 of
this patch did), but it kinda feels like if someone did "sudo make
install" and then followed up by a non-sudo "make" they probably would
be able to figure out how to fix it without much trouble (just do a
"sudo make clean").

In case it's not obvious, though, we should still try to land patch #1
of this series.  That's a real problems that people reported when the
.cache.mk stuff first landed and then folks tried to upgrade their
gcc.

-Doug
