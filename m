Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr690115.outbound.protection.outlook.com ([40.107.69.115]:49344
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732319AbfAKTGr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Jan 2019 14:06:47 -0500
From: Paul Burton <paul.burton@mips.com>
Subject: [PATCH v2] kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with ftrace
 & GCC <= 4.7
Date: Fri, 11 Jan 2019 19:06:44 +0000
Message-ID: <20190111190538.6744-1-paul.burton@mips.com>
References: <CAK7LNAS-r4gZOxdJCNaQwHtOYbxHbdupu57qncWkE+bhGfb_7g@mail.gmail.com>
In-Reply-To: <CAK7LNAS-r4gZOxdJCNaQwHtOYbxHbdupu57qncWkE+bhGfb_7g@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <pburton@wavecomp.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicholas Piggin <npiggin@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

When building using GCC 4.7 or older, -ffunction-sections & the -pg flag
used by ftrace are incompatible. This causes warnings or build failures
(where -Werror applies) such as the following:

  arch/mips/generic/init.c:
    error: -ffunction-sections disabled; it makes profiling impossible

This used to be taken into account by the ordering of calls to cc-option
from within the top-level Makefile, which was introduced by commit
90ad4052e85c ("kbuild: avoid conflict between -ffunction-sections and
-pg on gcc-4.7"). Unfortunately this was broken when the
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION cc-option check was moved to
Kconfig in commit e85d1d65cd8a ("kbuild: test dead code/data elimination
support in Kconfig"), because the flags used by this check no longer
include -pg.

Fix this by not allowing CONFIG_LD_DEAD_CODE_DATA_ELIMINATION to be
enabled at the same time as ftrace/CONFIG_FUNCTION_TRACER when building
using GCC 4.7 or older.

Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: e85d1d65cd8a ("kbuild: test dead code/data elimination support in Kc=
onfig")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: stable@vger.kernel.org # v4.19+
Cc: linux-kbuild@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
Changes in v2:
- Invert the dependency as Masahiro suggested.
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index d47cb77a220e..513fa544a134 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1124,6 +1124,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	bool "Dead code and data elimination (EXPERIMENTAL)"
 	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	depends on EXPERT
+	depends on !(FUNCTION_TRACER && CC_IS_GCC && GCC_VERSION < 40800)
 	depends on $(cc-option,-ffunction-sections -fdata-sections)
 	depends on $(ld-option,--gc-sections)
 	help
--=20
2.20.1
