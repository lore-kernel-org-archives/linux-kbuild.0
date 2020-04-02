Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:51054 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388677AbgDBRit (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:38:49 -0400
Received: by mail-pg1-f201.google.com with SMTP id d69so3586115pga.17
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 10:38:47 -0700 (PDT)
Date: Thu,  2 Apr 2020 10:38:42 -0700
Message-Id: <20200402173842.96013-1-maskray@google.com>
Mime-Version: 1.0
Subject: [PATCH] Documentation/llvm: fix the name of llvm-size
From: Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: corbet@lwn.net, masahiroy@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Fangrui Song <maskray@google.com>

The tool is called llvm-size, not llvm-objsize.

Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
Signed-off-by: Fangrui Song <maskray@google.com>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index d6c79eb4e23e..eefbdfa3e4d9 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
 additional parameters to `make`.
 
 	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
-	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
-- 
2.26.0.rc2.310.g2932bb562d-goog
