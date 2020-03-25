Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38976 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:59:19 -0400
From: Nick Terrell <nickrterrell@gmail.com>
Subject: [PATCH v3 8/8] .gitignore: add ZSTD-compressed files
Date: Wed, 25 Mar 2020 12:58:49 -0700
Message-Id: <20200325195849.407900-9-nickrterrell@gmail.com>
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>

From: Adam Borowski <kilobyte@angband.pl>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 72ef86a5570d..edb0191c294f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -43,6 +43,7 @@
 *.tab.[ch]
 *.tar
 *.xz
+*.zst
 Module.symvers
 modules.builtin
 modules.order
-- 
2.25.1
