Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outcampmail001.snc4.facebook.com ([66.220.144.159]:58741 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755665Ab1EQRhs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 13:37:48 -0400
From: Arun Sharma <asharma@fb.com>
Subject: [PATCH 2/6] kbuild: Add a kernel-devel package
Date: Tue, 17 May 2011 10:36:15 -0700
Message-Id: <1305653779-3445-2-git-send-email-asharma@fb.com>
In-Reply-To: <1305653779-3445-1-git-send-email-asharma@fb.com>
References: <1305653779-3445-1-git-send-email-asharma@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arun Sharma <asharma@fb.com>

Useful for building modules without having kernel sources

Signed-off-by: Arun Sharma <asharma@fb.com>
---
 scripts/package/mkspec |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index b820677..81b6057 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -47,6 +47,14 @@ echo ""
 echo "%description"
 echo "The Linux Kernel, the operating system core itself"
 echo ""
+echo "%package devel"
+echo "Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel"
+echo "Group: System Environment/Kernel"
+echo "AutoReqProv: no"
+echo "%description -n kernel-devel"
+echo "This package provides kernel headers and makefiles sufficient to build modules"
+echo "against the $__KERNELRELEASE kernel package."
+echo ""
 
 if ! $PREBUILT; then
 echo "%prep"
@@ -118,3 +126,7 @@ echo "/lib/modules/$KERNELRELEASE"
 echo "/lib/firmware"
 echo "/boot/*"
 echo ""
+echo "%files devel"
+echo '%defattr (-, root, root)'
+echo "/usr/src/kernels/$KERNELRELEASE"
+echo ""
-- 
1.7.4

