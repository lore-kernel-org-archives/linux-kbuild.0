Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:49126 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751608AbYJOJBI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Oct 2008 05:01:08 -0400
Date: Wed, 15 Oct 2008 12:01:05 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] kconfig-language.txt: update the information on select
Message-ID: <20081015090105.GF20183@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org
Cc: linux-kbuild@vger.kernel.org

- select'ing visible symbols alone does not cause illegal configurations
- whether select should be used can best be judged on a case-by-case
  basis, the warning about the general problem of breaking dependencies 
  is enough
- recommend to ask on linux-kbuild@vger.kernel.org for advice
  when in doubt

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index c412c24..d1c5bb2 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -108,11 +108,10 @@ applicable everywhere (see syntax).
 	a symbol to a value without visiting the dependencies.
 	By abusing select you are able to select a symbol FOO even
 	if FOO depends on BAR that is not set.
-	In general use select only for non-visible symbols
-	(no prompts anywhere) and for symbols with no dependencies.
-	That will limit the usefulness but on the other hand avoid
-	the illegal configurations all over.
-	kconfig should one day warn about such things.
+	usages of select are only safe for symbols with no
+	dependencies, otherwise special care is required.
+
+	if in doubt, ask on linux-kbuild@vger.kernel.org for advice
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
   This allows to limit the range of possible input values for int


