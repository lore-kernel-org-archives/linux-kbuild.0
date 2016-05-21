Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33372 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941AbcEULlf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 May 2016 07:41:35 -0400
From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0044/1529] Fix typo
Date: Sat, 21 May 2016 13:41:28 +0200
Message-Id: <20160521114128.1197-1-andrea.gelmini@gelma.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, yann.morin.1998@free.fr, mmarek@suse.com, corbet@lwn.net, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 Documentation/kbuild/kconfig-language.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index c52856d..14783c7 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -511,7 +511,7 @@ the use of the xconfig configurator [1]. Work should be done to confirm if
 the deduced semantics matches our intended Kconfig design goals.
 
 Having well defined semantics can be useful for tools for practical
-evaluation of depenencies, for instance one such use known case was work to
+evaluation of dependencies, for instance one such use known case was work to
 express in boolean abstraction of the inferred semantics of Kconfig to
 translate Kconfig logic into boolean formulas and run a SAT solver on this to
 find dead code / features (always inactive), 114 dead features were found in
-- 
2.8.2.534.g1f66975

