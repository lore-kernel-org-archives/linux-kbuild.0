Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81D2C433F5
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Apr 2022 19:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbiDXTOO (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Apr 2022 15:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238494AbiDXTOE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Apr 2022 15:14:04 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DC5DC5;
        Sun, 24 Apr 2022 12:10:13 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 23OJ8o6G019069;
        Mon, 25 Apr 2022 04:09:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o6G019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1650827345;
        bh=Y1ONdD5VpzKWMM9ZNX9NpprmxKAoQ4tQsiKhE1fqqbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LFUN6paxpLKhvEjDw2gR4N5qgoyo6LZ38I5glSpf4PM6iC+BOUGJ4dzmc7B7Gy7u1
         HTIczB3oPSEfK99Lm2+RLDAXYmPJT/YKGeoCtT9kTyEIEpGn7ScyYj9y5XqKd2ZiM/
         JoIc0YSlZENZiXtWf+IG7/6bMqdiW09SFPQqowZkYupfJRej5v7xjtIqTsLiICdmHn
         LKSHWeQIZi7GlPmLK0BWd+PUf1omPKC/gGw71Yj41nWhvoO+YXbtNUGvEnMaod+GZC
         pKWdA2O4MPkdh5UrKq5tLM3k6ZVkfdw1xVh0VGBQvE4sRJRksvoSJF5kXv4j4o7z0K
         AKGJOZE4PmO7g==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 22/27] kbuild: generate a list of objects in vmlinux
Date:   Mon, 25 Apr 2022 04:08:06 +0900
Message-Id: <20220424190811.1678416-23-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424190811.1678416-1-masahiroy@kernel.org>
References: <20220424190811.1678416-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A *.mod file lists the member objects of a module, but vmlinux does
not have such a file to list out all the member objects.

Generate this list to allow modpost to know all the member objects.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 20f44504a644..d2c193f82004 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -310,7 +310,7 @@ cleanup()
 	rm -f vmlinux
 	rm -f vmlinux.map
 	rm -f vmlinux.o
-	rm -f .vmlinux.d
+	rm -f .vmlinux*
 }
 
 # Use "make V=1" to debug this script
@@ -342,6 +342,19 @@ ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
 modpost_link vmlinux.o
 objtool_link vmlinux.o
 
+# Generate the list of objects in vmlinux
+rm -f .vmlinux.objs
+for f in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
+	case ${f} in
+	*.a)
+		${AR} t ${f} >> .vmlinux.objs
+		;;
+	*)
+		echo ${f} >> .vmlinux.objs
+		;;
+	esac
+done
+
 # modpost vmlinux.o to check for section mismatches
 ${MAKE} -f "${srctree}/scripts/Makefile.modpost" MODPOST_VMLINUX=1
 
-- 
2.32.0

