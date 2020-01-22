Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.110.172]:54282 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729047AbgAVKD4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 05:03:56 -0500
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH] kconfig: Sanitize make randconfig generated .config
Date: Wed, 22 Jan 2020 10:03:44 +0000
Message-Id: <20200122100344.50751-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, vincenzo.frascino@arm.com

"make randconfig" calculates the probability of a tristate option (yes,
mod, no) based on srand()/rand() and can be fed with a seed.
At the last step of randconfig some option are chosen randomly and their
tristate set based on similar mechanism.
After this passage the resulting .config is not sanitized, hence it
might result in an inconsistent set of options being selected.

This was noticed on arm64 using KCONFIG_SEED=0x40C5E904. During
randomize_choice_values() CONFIG_BIG_ENDIAN is enabled. Since CONFIG_EFI
was enabled at a previous step, and depends on !CONFIG_BIG_ENDIAN the
resulting .config is inconsistent.

Fix the issue making sure that randconfig sanitizes the generated
.config as a last step.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 scripts/kconfig/conf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1f89bf1558ce..c0fcaa4e9762 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -654,6 +654,11 @@ int main(int ac, char **av)
 	case randconfig:
 		/* Really nothing to do in this loop */
 		while (conf_set_all_new_symbols(def_random)) ;
+		/*
+		 * .config at this point might contain
+		 * incompatible options. Sanitize it.
+		 */
+		sym_clear_all_valid();
 		break;
 	case defconfig:
 		conf_set_all_new_symbols(def_default);
-- 
2.25.0
