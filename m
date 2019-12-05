Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42553 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfLEFQL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 00:16:11 -0500
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] :scripts:kernel_modules_info.sh Removed unnecessary headers information 
Date: Thu,  5 Dec 2019 10:45:50 +0530
Message-Id: <20191205051550.22927-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, rdunlap@infradead.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

Strips off the unnecessary details from the header information as Randy
pointed out.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kernel_modules_info.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
index b74203322157..c1fe7fae9228 100755
--- a/scripts/kernel_modules_info.sh
+++ b/scripts/kernel_modules_info.sh
@@ -2,8 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #===============================================================================
 #
-#          FILE: kernel_modules_info.sh
-# 
 #         USAGE: ./kernel_modules_info.sh 
 # 
 #   DESCRIPTION:  Running kernel modules information.
-- 
2.24.0
