Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:34311 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757805Ab1DXXPm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 24 Apr 2011 19:15:42 -0400
Message-ID: <4DB4AEF7.3090607@verizon.net>
Date: Sun, 24 Apr 2011 19:15:03 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH] kbuild: mark unicore32 header export as broken
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz

This patch marks userspace header export for unicore32 as broken so that
it is skipped when running make headers_install_all.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/headers.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/headers.sh b/scripts/headers.sh
index 978b42b..3ae218e 100755
--- a/scripts/headers.sh
+++ b/scripts/headers.sh
@@ -21,6 +21,8 @@ for arch in ${archs}; do
 		;;
 	cris)      # headers export are known broken
 		;;
+	unicore32) # broken
+		;;
 	*)
 		if [ -d ${srctree}/arch/${arch} ]; then
 			do_command $1 ${arch}
-- 
1.7.5.rc1

