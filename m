Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f171.google.com ([209.85.160.171]:46431 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfEGF4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 01:56:08 -0400
Received: by mail-qt1-f171.google.com with SMTP id i31so17650777qti.13
        for <linux-kbuild@vger.kernel.org>; Mon, 06 May 2019 22:56:07 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 May 2019 05:55:55 +0000
Message-ID: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
Subject: Error message when compiler not present
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: Christophe LEROY <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>

Hello,

The other day I was attempting a kernel build and stumbled across this:

$ CROSS_COMPILE=foo make
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
/bin/sh: 1: foogcc: not found
/bin/sh: 1: foogcc: not found
scripts/kconfig/conf  --syncconfig Kconfig
./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
Compiler lacks asm-goto support.
make: *** [arch/x86/Makefile:302: checkbin] Error 1

I had something more sensible for CROSS_COMPILE, but the point is it
did not exist in my $PATH.

I tried the patch below but there's still something calling the
$(CROSS_COMPILE)gcc before gcc-version:

$ CROSS_COMPILE=foo  make
/bin/sh: 1: foogcc: not found
make: foogcc: Command not found
Compiler lacks asm-goto support.

This isn't a big deal but if there's a simple fix it would be nice to clean up.

Cheers,

Joel

--- a/scripts/gcc-version.sh
+++ b/scripts/gcc-version.sh
@@ -8,6 +8,11 @@

 compiler="$*"

+if [ -x "command -v ${#compiler}" ]; then
+       echo "Error: Compiler not found." >&2
+       exit 1
+fi
+
 if [ ${#compiler} -eq 0 ]; then
        echo "Error: No compiler specified." >&2
        printf "Usage:\n\t$0 <gcc-command>\n" >&2
