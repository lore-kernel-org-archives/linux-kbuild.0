Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64632C19F2B
	for <linux-kbuild@archiver.kernel.org>; Sat, 30 Jul 2022 17:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235197AbiG3Rhs (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 30 Jul 2022 13:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbiG3Rhr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Jul 2022 13:37:47 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E8A15A00;
        Sat, 30 Jul 2022 10:37:45 -0700 (PDT)
Received: from localhost.localdomain (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 26UHad9Z015991;
        Sun, 31 Jul 2022 02:36:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 26UHad9Z015991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1659202599;
        bh=s5i4NN8QoFKQRwc5evurXo6JXtv34LY9d/GuIT5gPKU=;
        h=From:To:Cc:Subject:Date:From;
        b=NnfzF9/LtuTDbNwcvojr/Ivo4XVgeFXRmupqWWDmfNGaZqhuUcvrVKIN5yy2giVrr
         Bvecxcxl4nd+RO904sAA28IDUyAwH08XaZxchPorsqiiiL04kx21ocKMIVlkTJNewR
         3DAYgPDZM/QdnlkV/M/YslS9SYr4u0H/6BSKGGmK6QVJLYhslFNvw82fuXBEvazR2m
         eg5Ow2UYc9y1I3m/vvGNeM59Mm1Y22/5Nb4BRY++3f4Tb9IkYGGDe27Vj/vlF23CP0
         QA0KR8QGypvLJzqSXVnK8/rRyz3w/GqhIn0mN5/+ce7BqCT9ailLvMOllthtDpeLAn
         1uELQNo35+y8A==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] modpost: add array range check to sec_name()
Date:   Sun, 31 Jul 2022 02:36:34 +0900
Message-Id: <20220730173636.1303357-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The section index is always positive, so the argunent, secindex, should
be unsigned.

Also, inserted the array range check.

If sym->st_shndx is a special section index (between SHN_LORESERVE and
SHN_HIRESERVE), there is no corresponding section header.

For example, if a symbol specifies an absolute value, sym->st_shndx is
SHN_ABS (=0xfff1).

The current users do not cause the out-of-range access of
info->sechddrs[], but it is better to avoid such a pitfall.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 08411fff3e17..148b38699889 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -336,8 +336,16 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
 				      sechdr->sh_name);
 }
 
-static const char *sec_name(const struct elf_info *info, int secindex)
+static const char *sec_name(const struct elf_info *info, unsigned int secindex)
 {
+	/*
+	 * If sym->st_shndx is a special section index, there is no
+	 * corresponding section header.
+	 * Return "" if the index is out of range of info->sechdrs[] array.
+	 */
+	if (secindex >= info->num_sections)
+		return "";
+
 	return sech_name(info, &info->sechdrs[secindex]);
 }
 
-- 
2.34.1

