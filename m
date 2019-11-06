Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37855 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfKFDgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:36:47 -0500
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
Date: Wed,  6 Nov 2019 09:06:10 +0530
Message-Id: <20191106033610.29841-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: alexander.kapshuk@gmail.com
Cc: rdunlap@infradead.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

As Masahiro pointed out ,only add Bison and Flex to the checklist.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/ver_linux | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 810e608baa24..85005d6b7f10 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -32,6 +32,8 @@ BEGIN {
 	printversion("PPP", version("pppd --version"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
 	printversion("Nfs-utils", version("showmount --version"))
+	printversion("Bison", version("bison --version"))
+	printversion("Flex", version("flex --version"))
 
 	while (getline <"/proc/self/maps" > 0) {
 		if (/libc.*\.so$/) {
-- 
2.23.0
