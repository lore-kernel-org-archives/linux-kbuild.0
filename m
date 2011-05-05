Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail014.snc4.facebook.com ([66.220.144.146]:64920 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754435Ab1EERjn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 May 2011 13:39:43 -0400
Date: Thu, 5 May 2011 10:39:39 -0700
From: Arun Sharma <asharma@fb.com>
Subject: [PATCH] Add $KERNELRELEASE to firmware install path
Message-ID: <20110505173939.GA20575@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Useful in the presence of multiple kernels with different 
firmware versions.

Signed-off-by: Arun Sharma <asharma@fb.com>

diff --git a/Makefile b/Makefile
index e712243..cb715df 100644
--- a/Makefile
+++ b/Makefile
@@ -997,7 +997,7 @@ depend dep:
 
 # ---------------------------------------------------------------------------
 # Firmware install
-INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware
+INSTALL_FW_PATH=$(INSTALL_MOD_PATH)/lib/firmware/$(KERNELRELEASE)
 export INSTALL_FW_PATH
 
 PHONY += firmware_install
