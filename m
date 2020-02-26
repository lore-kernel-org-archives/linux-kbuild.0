Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:24983 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgBZRyD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:54:03 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove trailing slash from devicetree/binding/ for descending
Date: Thu, 27 Feb 2020 02:53:25 +0900
Message-Id: <20200226175325.8787-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

obj-* needs a trailing slash for a directory, but subdir-* does not
because it already implies a directory.

Also, change subdir-y to subdir- to ensure this is effective only
for cleaning targets.

This makes the cleaning log consistent. (no trailing slash)

Before:

  $ make clean
  CLEAN   Documentation/devicetree/bindings/

After:

  $ make clean
  CLEAN   Documentation/devicetree/bindings

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d77bb607aea4..39569a2e1953 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Sphinx documentation
 #
 
-subdir-y := devicetree/bindings/
+# for cleaning
+subdir- := devicetree/bindings
 
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
-- 
2.17.1
