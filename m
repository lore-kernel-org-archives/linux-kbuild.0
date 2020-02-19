Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49770 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbgBSBPy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 20:15:54 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: remove wrong documentation about mandatory-y
Date: Wed, 19 Feb 2020 10:15:19 +0900
Message-Id: <20200219011519.22148-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

This sentence does not make sense in the section about mandatory-y.

This seems to be a copy-paste mistake of commit fcc8487d477a ("uapi:
export all headers under uapi directories").

The correct description would be "The convention is to list one
mandatory-y per line ...".

I just removed it instead of fixing it. If such information is needed,
it could be commented in include/asm-generic/Kbuild and
include/uapi/asm-generic/Kbuild.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 0e0eb2c8da7d..4018ad7c7a11 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1379,9 +1379,6 @@ See subsequent chapter for the syntax of the Kbuild file.
 	in arch/$(ARCH)/include/(uapi/)/asm, Kbuild will automatically generate
 	a wrapper of the asm-generic one.
 
-	The convention is to list one subdir per line and
-	preferably in alphabetic order.
-
 8 Kbuild Variables
 ==================
 
-- 
2.17.1
