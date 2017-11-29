Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:35427 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753012AbdK2Xoz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:44:55 -0500
Received: by mail-pl0-f66.google.com with SMTP id b96so3077007pli.2
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:44:55 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH 2/7] kbuild: add ld-if-name-version and linker-specific macros
Date: Wed, 29 Nov 2017 15:44:37 -0800
Message-Id: <20171129234442.655-3-samitolvanen@google.com>
In-Reply-To: <20171129234442.655-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

Add macros for testing both linker name and version.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Kbuild.include | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index a7c7843c2cf1..5d286d69e8dc 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -289,6 +289,18 @@ ld-version = $(call shell-cached,$(LD) --version | $(srctree)/scripts/ld-version
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
 ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
+# ld-if-name-version
+# Usage:  $(call ld-if-name-version, gold, -ge, 112000000, y)
+ld-if-name-version = $(shell [ $(ld-name) == $(1) ] && [ $(ld-version) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# bfd-ifversion
+# Usage:  $(call bfd-ifversion, -ge, 227000000, y)
+bfd-ifversion = $(call ld-if-name-version, bfd, $(1), $(2), $(3), $(4))
+
+# gold-ifversion
+# Usage:  $(call gold-ifversion, -ge, 112000000, y)
+gold-ifversion = $(call ld-if-name-version, gold, $(1), $(2), $(3), $(4))
+
 ######
 
 ###
-- 
2.15.0.531.g2ccb3012c9-goog

