Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.189]:12452 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761898AbYGOWba (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jul 2008 18:31:30 -0400
Received: by fk-out-0910.google.com with SMTP id 18so3313908fkq.5
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jul 2008 15:31:28 -0700 (PDT)
From: jkacur <jkacur@gmail.com>
Reply-To: jkacur@gmail.com
Subject: [PATCH] Change Kbuild message to match default
Date: Wed, 16 Jul 2008 00:31:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807160031.16323.jkacur@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

Change the Kbuild "If unsure" message to match the default.

Signed-off-by: John Kacur <jkacur at gmail dot com>

Index: linux-2.6.26/init/Kconfig
===================================================================
--- linux-2.6.26.orig/init/Kconfig
+++ linux-2.6.26/init/Kconfig
@@ -522,7 +522,7 @@ config CC_OPTIMIZE_FOR_SIZE
          Enabling this option will pass "-Os" instead of "-O2" to gcc
          resulting in a smaller kernel.

-         If unsure, say N.
+         If unsure, say Y.

 config SYSCTL
        bool
