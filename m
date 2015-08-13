Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:19701 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740AbbHMVQU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Aug 2015 17:16:20 -0400
Subject: [PATCH] kbuild: avoid listing /lib/modules in kernel spec file
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Thu, 13 Aug 2015 17:16:10 -0400
Message-ID: <20150813211610.11760.6911.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: dledford@redhat.com, linux-kbuild@vger.kernel.org

This causes conflicts when using multiple kernels built
with this mechanism.

Reviewed-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |    1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 89f9669..71004da 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -140,7 +140,6 @@ echo "fi"
 echo ""
 echo "%files"
 echo '%defattr (-, root, root)'
-echo "%dir /lib/modules"
 echo "/lib/modules/$KERNELRELEASE"
 echo "%exclude /lib/modules/$KERNELRELEASE/build"
 echo "%exclude /lib/modules/$KERNELRELEASE/source"

