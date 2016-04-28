Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:35538 "EHLO
	mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752631AbcD1V3q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 17:29:46 -0400
Received: by mail-qk0-f175.google.com with SMTP id q76so33679378qke.2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Apr 2016 14:29:45 -0700 (PDT)
Date: Thu, 28 Apr 2016 17:29:42 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] kbuild: fix ksym_dep_filter when multiple EXPORT_SYMBOL()
 on the same line
Message-ID: <alpine.LFD.2.20.1604281718520.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org

In kernel/cgroup.c there is:

    #define SUBSYS(_x)                                             \
        DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_enabled_key);    \
        DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_on_dfl_key);     \
        EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_enabled_key);         \
        EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_on_dfl_key);

The expansion of this macro causes multiple EXPORT_SYMBOL_GPL() instances
to appear on the same preprocessor line output, confusing the sed script
expecting only one of them per line.  Unfortunately this can't be fixed
nicely in the sed script as sed's regexp can't do non greedy matching.

Fix this by turning any semicolon into a line break before filtering.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 36e9475395..1f0d41cc73 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -281,7 +281,7 @@ ksym_dep_filter =                                                            \
 	    $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;        \
 	  boot*|build*|*cpp_lds_S|dtc|host*|vdso*) : ;;                      \
 	  *) echo "Don't know how to preprocess $(1)" >&2; false ;;          \
-	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
+	esac | tr ";" "\n" | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
 
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
