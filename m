Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35832 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753442AbdEFWjq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 May 2017 18:39:46 -0400
From: Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] docs: complete bumping minimal GNU Make version to 3.81
Date: Sat,  6 May 2017 15:39:25 -0700
Message-Id: <1494110365-1772-1-git-send-email-jcmvbkbc@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>

Commit 37d69ee3080811 ("docs: bump minimal GNU Make version to 3.81")
changes one entry of GNU make version in the changes.rst, there's still
one more entry saying that one need version 3.80. Fix that.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 Documentation/process/changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index cef7bc4..e25d63f 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -70,7 +70,7 @@ computer.
 Make
 ----
 
-You will need GNU make 3.80 or later to build the kernel.
+You will need GNU make 3.81 or later to build the kernel.
 
 Binutils
 --------
-- 
2.1.4

