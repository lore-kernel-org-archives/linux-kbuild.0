Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([54.37.238.230]:40564 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSBUS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 21:20:18 -0400
From: Adam Borowski <kilobyte@angband.pl>
Date: Thu, 19 Mar 2020 02:00:15 +0100
Message-Id: <20200319010015.26880-1-kilobyte@angband.pl>
In-Reply-To: <20200318002303.977158-1-terrelln@fb.com>
References: <20200318002303.977158-1-terrelln@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH v2 8/7] .gitignore: add ZSTD-compressed files
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
Otherwise, "git status" will complain.


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
2.26.0.rc2
