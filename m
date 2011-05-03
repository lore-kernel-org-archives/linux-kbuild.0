Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail011.snc4.facebook.com ([66.220.144.143]:60945 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755403Ab1ECVqN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 May 2011 17:46:13 -0400
Date: Tue, 3 May 2011 14:46:12 -0700
From: Arun Sharma <asharma@fb.com>
Subject: [PATCH] Make it possible to override INSTALL_HDR_PATH
Message-ID: <20110503214612.GA26479@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

diff --git a/Makefile b/Makefile
index cb715df..ec68886 100644
--- a/Makefile
+++ b/Makefile
@@ -1009,7 +1009,7 @@ firmware_install: FORCE
 # Kernel headers
 
 #Default location for installed headers
-export INSTALL_HDR_PATH = $(objtree)/usr
+export INSTALL_HDR_PATH ?= $(objtree)/usr
 
 hdr-inst := -rR -f $(srctree)/scripts/Makefile.headersinst obj
 
-- 
1.7.4
