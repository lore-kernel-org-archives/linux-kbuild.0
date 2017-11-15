Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:39713 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758960AbdKOVew (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:52 -0500
Received: by mail-io0-f193.google.com with SMTP id x63so3079712ioe.6
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:51 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 06/18] arm64: kvm: use -fno-jump-tables with clang
Date: Wed, 15 Nov 2017 13:34:16 -0800
Message-Id: <20171115213428.22559-7-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

Use -fno-jump-tables to make sure clang doesn't generate branches
to EL1 virtual addresses.

Suggested-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/kvm/hyp/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index f04400d494b7..19fa1c6b6b69 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -5,6 +5,10 @@
 
 ccflags-y += -fno-stack-protector -DDISABLE_BRANCH_PROFILING
 
+ifeq ($(cc-name),clang)
+ccflags-y += -fno-jump-tables
+endif
+
 KVM=../../../../virt/kvm
 
 obj-$(CONFIG_KVM_ARM_HOST) += $(KVM)/arm/hyp/vgic-v2-sr.o
-- 
2.15.0.448.gf294e3d99a-goog

