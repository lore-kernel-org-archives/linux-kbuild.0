Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42081 "EHLO
        cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfIUWXQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 18:23:16 -0400
From: Matthew Garrett <mjg59@srcf.ucam.org>
Date: Sat, 21 Sep 2019 15:23:04 -0700
Message-Id: <20190921222304.23267-1-mjg59@srcf.ucam.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH] Corrected formatting of header in kbuild module docs
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, Alex Gaynor <alex.gaynor@gmail.com>, Matthew Garrett <mjg59@google.com>

From: Alex Gaynor <alex.gaynor@gmail.com>

Minor formatting fixup.

Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Matthew Garrett <mjg59@google.com>
---
 Documentation/kbuild/modules.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 24e763482650..6716508fb79c 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -495,7 +495,8 @@ build.
 	will be written containing all exported symbols that were not
 	defined in the kernel.
 
---- 6.3 Symbols From Another External Module
+6.3 Symbols From Another External Module
+----------------------------------------
 
 	Sometimes, an external module uses exported symbols from
 	another external module. kbuild needs to have full knowledge of
-- 
2.21.0
