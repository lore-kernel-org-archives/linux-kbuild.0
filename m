Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:38042 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456Ab0KELGT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Nov 2010 07:06:19 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Kconfig: fix single letter command in scripts/config
Date: Fri,  5 Nov 2010 12:06:05 +0100
Message-Id: <1288955165-10562-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, erick@openchill.org

From: Andi Kleen <ak@linux.intel.com>

The one letter commands in scripts/config didn't work and always
printed usage. Fix this here.

Cc: erick@openchill.org
Reported-by: erick@openchill.org
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/config b/scripts/config
index 608d7fd..dfd4732 100755
--- a/scripts/config
+++ b/scripts/config
@@ -86,7 +86,7 @@ while [ "$1" != "" ] ; do
 		B=$ARG
 		shift 2
 		;;
-	--*)
+	-*)
 		checkarg "$1"
 		shift
 		;;
-- 
1.7.1

