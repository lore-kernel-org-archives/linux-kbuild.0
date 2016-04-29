Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:35629 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbcD2KmB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Apr 2016 06:42:01 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 1/2] kconfig-language: fix comment on dependency-generated menu structures.
In-Reply-To: <gh60v04s4s.fsf@lena.gouders.net> (Dirk Gouders's message of
	"Fri, 29 Apr 2016 12:25:34 +0200")
Date: Fri, 29 Apr 2016 11:02:08 +0200
References: <gh60v04s4s.fsf@lena.gouders.net>
Message-ID: <gh1t5o4ryz.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org


In the given example, the comment becomes visible when it's dependency
is set to 'n', but the text asserts the opposite.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 Documentation/kbuild/kconfig-language.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index c52856d..14dd131 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -241,9 +241,8 @@ comment "module support disabled"
 	depends on !MODULES
 
 MODVERSIONS directly depends on MODULES, this means it's only visible if
-MODULES is different from 'n'. The comment on the other hand is always
-visible when MODULES is visible (the (empty) dependency of MODULES is
-also part of the comment dependencies).
+MODULES is different from 'n'. The comment on the other hand is only
+visible when MODULES is set to 'n'.
 
 
 Kconfig syntax
-- 
2.8.1
