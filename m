Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:45508 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754540Ab2KMN5Y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Nov 2012 08:57:24 -0500
From: hc0606@gmail.com
Subject: [PATCH 1/1] Documentation: Fix example directories arch problem
Date: Tue, 13 Nov 2012 21:56:05 +0800
Message-Id: <1352814965-28502-1-git-send-email-hc0606@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, rob@landley.net
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, hanc.fnst@cn.fujitsu.com, Han Cheng <hc0606@gmail.com>

From: Han Cheng <hc0606@gmail.com>

The example directories arch is not consistent with the kbuild, fix it.

Signed-off-by: Han Cheng <hc0606@gmail.com>
---
 Documentation/kbuild/modules.txt |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.txt b/Documentation/kbuild/modules.txt
index 3fb39e0..8312f07 100644
--- a/Documentation/kbuild/modules.txt
+++ b/Documentation/kbuild/modules.txt
@@ -355,9 +355,9 @@ according to the following rule:
 	|__ src
 	|   |__ complex_main.c
 	|   |__ hal
-	|	|__ hardwareif.c
-	|	|__ include
-	|	    |__ hardwareif.h
+	|		|__ hardwareif.c
+	|		|__ include
+	|			|__ hardwareif.h
 	|__ include
 	    |__ complex.h
 
-- 
1.7.1

