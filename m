Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f46.google.com ([74.125.83.46]:52160 "EHLO
        mail-pg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751267AbdJBTUQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 15:20:16 -0400
Received: by mail-pg0-f46.google.com with SMTP id u144so778795pgb.8
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2017 12:20:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH 0/3] Makefile: Introduce CONFIG_CC_STACKPROTECTOR_AUTO
Date: Mon,  2 Oct 2017 12:20:04 -0700
Message-Id: <1506972007-80614-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Ingo Molnar <mingo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Nicholas Piggin <npiggin@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, kernel-hardening@lists.openwall.com

As described in the final patch:

Nearly all modern compilers support a stack-protector option, and nearly
all modern distributions enable the kernel stack-protector, so enabling
this by default in kernel builds would make sense. However, Kconfig does
not have knowledge of available compiler features, so it isn't safe to
force on, as this would unconditionally break builds for the compilers
or architectures that don't have support. Instead, this introduces a new
option, CONFIG_CC_STACKPROTECTOR_AUTO, which attempts to discover the best
possible stack-protector available, and will allow builds to proceed even
if the compiler doesn't support any stack-protector.

This option is made the default so that kernels built with modern
compilers will be protected-by-default against stack buffer overflows,
avoiding things like the recent BlueBorne attack. Selection of a specific
stack-protector option remains available, including disabling it.


This has lived over the weekend in 0-day, which noticed that sh needed
a small fix (which has actually been needed since the addition of the
_STRONG stack-protector, some time ago).

Thanks,

-Kees

