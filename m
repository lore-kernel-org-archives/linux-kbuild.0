Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726256AbgD1WOk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:40 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Date: Tue, 28 Apr 2020 15:14:14 -0700
Message-Id: <20200428221419.2530697-1-natechancellor@gmail.com>
In-Reply-To: <20200423171807.29713-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, Sami Tolvanen <samitolvanen@google.com>, Dmitry Golovin <dima@golovin.in>, Sedat Dilek <sedat.dilek@gmail.com>

Hi all,

This series allows ld.lld to properly and completely link the MIPS vDSO.

Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
ld.bfd checks.

Patch 2 moves disabling of the VDSO to Kconfig. This allows us to avoid
a warning with LD=ld.lld during the clean phase, when we do not have
access to CONFIG_LD_IS_LLD.

Patch 3 prepares for the shift from $(CC) to $(LD) and is probably a
worthwhile change aside from this series because GCC 4.6 is the minimum
version allowed to build the kernel.

Patch 4 does the actual shift from $(CC) to $(LD) to link the VDSO.

Patch 5 allows LD=ld.lld to build the VDSO fully through Kconfig.

I have build tested 32r2_defconfig, 32r2el_defconfig, 64r2_defconfig,
and 64r2el_defconfig with GCC and 32r2el_defconfig and
malta_kvm_guest_defconfig with clang. There is a separate issue with the
64-bit configs (https://github.com/ClangBuiltLinux/linux/issues/884) and
ld.lld does not support the triple OUTPUT_FORMAT linker script macro so
32r2_defconfig errors out in a manner similar to GCC without patch 3:
https://github.com/llvm/llvm-project/blob/46a75436f811d0e6a2c76c669140a7e9471cd2a3/lld/ELF/ScriptParser.cpp#L430
TODO: File an LLVM bug upstream

Please let me know if there are any issues!

Cheers,
Nathan
