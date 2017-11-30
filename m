Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:38567 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751982AbdK3XjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:16 -0500
Received: by mail-it0-f65.google.com with SMTP id r6so508637itr.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:16 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 4/7] kbuild: add __ld-ifversion and linker-specific macros
Date: Thu, 30 Nov 2017 15:39:02 -0800
Message-Id: <20171130233905.130602-5-samitolvanen@google.com>
In-Reply-To: <20171130233905.130602-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171130233905.130602-1-samitolvanen@google.com>
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
index 899863e4cd05..2991b463b4ce 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -285,6 +285,18 @@ ld-version = $(call shell-cached,$(LD) --version | $(srctree)/scripts/ld-version
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
 ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
+# __ld-ifversion
+# Usage:  $(call __ld-ifversion, gold, -ge, 112000000, y)
+__ld-ifversion = $(shell [ $(ld-name) == $(1) ] && [ $(ld-version) $(2) $(3) ] && echo $(4) || echo $(5))
+
+# bfd-ifversion
+# Usage:  $(call bfd-ifversion, -ge, 227000000, y)
+bfd-ifversion = $(call __ld-ifversion, bfd, $(1), $(2), $(3), $(4))
+
+# gold-ifversion
+# Usage:  $(call gold-ifversion, -ge, 112000000, y)
+gold-ifversion = $(call __ld-ifversion, gold, $(1), $(2), $(3), $(4))
+
 ######
 
 ###
-- 
2.15.0.531.g2ccb3012c9-goog

