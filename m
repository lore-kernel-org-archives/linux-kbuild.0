Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:51413 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752014AbdKGRi5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 12:38:57 -0500
Received: by mail-pg0-f48.google.com with SMTP id p9so11588169pgc.8
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 09:38:57 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 0/3] Makefile: Introduce CONFIG_CC_STACKPROTECTOR_AUTO
Date: Tue,  7 Nov 2017 09:38:37 -0800
Message-Id: <1510076320-69931-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

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


This has lived over the last several days without any unfixed 0day failures.

v2:
- under ..._AUTO, warn and continue on _all_ stack protector failure cases
- fix 32-bit boot regression due to lazy gz.
- set CONFIG_CC_STACKPROTECTOR_NONE for tiny.config.

Thanks,

-Kees
