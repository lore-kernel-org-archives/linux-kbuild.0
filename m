Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39240 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbfLCJyE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 04:54:04 -0500
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH 2/2] fix the SPDX syntax and bash interprester pointer
Date: Tue,  3 Dec 2019 15:23:39 +0530
Message-Id: <20191203095339.615774-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, rdunlap@infradead.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

SPDX syntax was complining by checkpatch fixed it,added space before it.
And add bash interpreter to find by the env .

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kernel_modules_info.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_info.sh
index f005c47a3aa6..3a9b00988ed3 100755
--- a/scripts/kernel_modules_info.sh
+++ b/scripts/kernel_modules_info.sh
@@ -1,5 +1,5 @@
-#!/bin/bash - 
-#SPDX-License-Identifier: GPL-2.0
+#!/usr/bin/env bash 
+# SPDX-License-Identifier: GPL-2.0
 #===============================================================================
 #
 #          FILE: kernel_modules_info.sh
-- 
2.24.0
