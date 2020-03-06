Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.110.172]:57288 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgCFGgq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 01:36:46 -0500
From: Amit Daniel Kachhap <amit.kachhap@arm.com>
Subject: [PATCH v6 16/18] kconfig: Add support for 'as-option'
Date: Fri,  6 Mar 2020 12:05:23 +0530
Message-Id: <1583476525-13505-17-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1583476525-13505-1-git-send-email-amit.kachhap@arm.com>
References: <1583476525-13505-1-git-send-email-amit.kachhap@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Dave Martin <Dave.Martin@arm.com>, Amit Daniel Kachhap <amit.kachhap@arm.com>, James Morse <james.morse@arm.com>, Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Mark Brown <broonie@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

From: Vincenzo Frascino <vincenzo.frascino@arm.com>

Currently kconfig does not have a feature that allows to detect if the
used assembler supports a specific compilation option.

Introduce 'as-option' to serve this purpose in the context of Kconfig:

        config X
                def_bool $(as-option,...)

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
---
Changes since v5:
 * More descriptions for using /dev/zero.

 scripts/Kconfig.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 85334dc..a1c1925 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -31,6 +31,12 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(success,$(LD) -v $(1))
 
+# $(as-option,<flag>)
+# /dev/zero is used as output instead of /dev/null as some assembler cribs when
+# both input and output are same. Also both of them have same write behaviour so
+# can be easily substituted.
+as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
+
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
-- 
2.7.4
