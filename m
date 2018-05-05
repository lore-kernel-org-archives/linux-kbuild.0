Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22213 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750830AbeEEKRD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 May 2018 06:17:03 -0400
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 5 May 2018 19:16:13 +0900
Message-ID: <CAK7LNAR59KjaJdDNwJaSR_79s84hBj_MqMQ=PaFqJqzBKLUsJA@mail.gmail.com>
Subject: [RFC] Removal of CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-arch <linux-arch@vger.kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Miao <realmz6@gmail.com>, James Hogan <jhogan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi.


CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX was selected
by BLACKFIN and METAG.

Now that both architectures removed in the previous
merge window, there is no more user of this CONFIG option.


My question is,
is it OK to remove CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX entirely?


In other words,
  - Is there possibility to revive Blackfin/Metag support?
  - Do future architectures need HAVE_UNDERSCORE_SYMBOL_PREFIX?

I guess (hope) they are unlikely to happen.



If we can remove CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX,
several tools (modpost, genksyms, adjust_autoksyms.sh, etc.)
will be simplified.

Also, VMLINUX_SYMBOL() in include/asm-generic/vmlinux.lds.h
can be removed.  So, the linker script will become more readable.


Is it OK to move forward the clean-ups?
Comments are appreciated.


-- 
Best Regards
Masahiro Yamada
