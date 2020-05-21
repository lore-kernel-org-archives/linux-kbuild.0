Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50204 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgEUEcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 00:32:16 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: doc: remove documentation about copying Module.symvers around
Date: Thu, 21 May 2020 13:31:17 +0900
Message-Id: <20200521043117.242585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

This is a left-over of commit 39808e451fdf ("kbuild: do not read
$(KBUILD_EXTMOD)/Module.symvers").

Kbuild no longer supports this way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index e0b45a257f21..a45cccff467d 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -528,18 +528,6 @@ build.
 		will then do the expected and compile both modules with
 		full knowledge of symbols from either module.
 
-	Use an extra Module.symvers file
-		When an external module is built, a Module.symvers file
-		is generated containing all exported symbols which are
-		not defined in the kernel. To get access to symbols
-		from bar.ko, copy the Module.symvers file from the
-		compilation of bar.ko to the directory where foo.ko is
-		built. During the module build, kbuild will read the
-		Module.symvers file in the directory of the external
-		module, and when the build is finished, a new
-		Module.symvers file is created containing the sum of
-		all symbols defined and not part of the kernel.
-
 	Use "make" variable KBUILD_EXTRA_SYMBOLS
 		If it is impractical to add a top-level kbuild file,
 		you can assign a space separated list
-- 
2.25.1
