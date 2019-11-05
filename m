Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39518 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbfKELbw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 06:31:52 -0500
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: ver_linux:add flex, bison and yacc to the checklist
Date: Tue,  5 Nov 2019 17:01:00 +0530
Message-Id: <20191105113100.521-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: alexander.kapshuk@gmail.com
Cc: rdunlap@infradead.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch add three ulities explicitly to the checklist,namely
flex,bison and yacc.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/ver_linux | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/ver_linux b/scripts/ver_linux
index 810e608baa24..397497cf9430 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -32,6 +32,9 @@ BEGIN {
 	printversion("PPP", version("pppd --version"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
 	printversion("Nfs-utils", version("showmount --version"))
+	printversion("Bison", version("bison --version"))
+	printversion("Flex", version("flex --version"))
+	printversion("Yacc", version("yacc --version"))

 	while (getline <"/proc/self/maps" > 0) {
 		if (/libc.*\.so$/) {
--
2.23.0
