Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:39495 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934798AbeFLAcu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jun 2018 20:32:50 -0400
Received: by mail-pg0-f43.google.com with SMTP id w12-v6so10575055pgc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jun 2018 17:32:50 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv4 1/3] scripts: Preprocess module-common.lds
Date: Mon, 11 Jun 2018 17:32:22 -0700
Message-Id: <20180612003224.3658-2-labbott@redhat.com>
In-Reply-To: <20180612003224.3658-1-labbott@redhat.com>
References: <20180612003224.3658-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Abbott <labbott@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org


In preparation for some upcoming work, allow module-common.lds
to be run through the preprocessor.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
 scripts/.gitignore                                 | 1 +
 scripts/Makefile                                   | 2 +-
 scripts/{module-common.lds => module-common.lds.S} | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename scripts/{module-common.lds => module-common.lds.S} (100%)

diff --git a/scripts/.gitignore b/scripts/.gitignore
index 0442c06eefcb..afd1de57d9c6 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -13,3 +13,4 @@ asn1_compiler
 extract-cert
 sign-file
 insert-sys-cert
+module-common.lds
diff --git a/scripts/Makefile b/scripts/Makefile
index 25ab143cbe14..631d9d1a71e4 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -25,7 +25,7 @@ HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTLOADLIBES_sign-file = -lcrypto
 HOSTLOADLIBES_extract-cert = -lcrypto
 
-always		:= $(hostprogs-y) $(hostprogs-m)
+always		:= $(hostprogs-y) $(hostprogs-m) module-common.lds
 
 # The following hostprogs-y programs are only build on demand
 hostprogs-y += unifdef
diff --git a/scripts/module-common.lds b/scripts/module-common.lds.S
similarity index 100%
rename from scripts/module-common.lds
rename to scripts/module-common.lds.S
-- 
2.18.0.rc1

