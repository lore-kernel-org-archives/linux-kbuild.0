Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6163AC433FE
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 May 2022 16:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239159AbiEWQsg (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 23 May 2022 12:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbiEWQsf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 12:48:35 -0400
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC70D63BCE;
        Mon, 23 May 2022 09:48:28 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 24NGlJD4027017;
        Tue, 24 May 2022 01:47:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 24NGlJD4027017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1653324442;
        bh=rQdfqreay7lgMbfLRTWkn5/8R74gXvo8Abky+SCmAsU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UL9GGHk5wvmGQsDaOymGQdu/M7wo/ocj2FRT8cWte8EzckRHK/E4v5r+7tIGMmXNW
         Q5lDu7trmRlsLjX1DHBQH1CGw84wRdX7m/8mhGHXhDGfOinZ7uoBq7QJ+GAjKDnJWa
         cexgiGKRX9Q824jMoGVgNMBjPn6iuhNWyQzVOvThFwGurC+Sf37+754inPnp/7SD9q
         VJK3AzzBNAbUav8Yd8uPykNt1DPAsXWl1uLPkjAQEKSlgFZmyKMUBDGWF/0TpmNHOz
         aQSrbx7nUqvPO0oKQwzxcjA/DaHH78X2k5Z6UXutSJq2O1ml6UYVCAl+ESMd6RdFOP
         rPUyM2EcBR2vg==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 5/5] modpost: squash if...else if in find_elf_symbol2()
Date:   Tue, 24 May 2022 01:46:26 +0900
Message-Id: <20220523164626.858340-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523164626.858340-1-masahiroy@kernel.org>
References: <20220523164626.858340-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

    if ((addr - sym->st_value) < distance) {
            distance = addr - sym->st_value;
            near = sym;
    } else if ((addr - sym->st_value) == distance) {
            near = sym;
    }

is equivalent to:

    if ((addr - sym->st_value) <= distance) {
            distance = addr - sym->st_value;
            near = sym;
    }

(The else-if part can overwrite 'distance' with the same value).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 48a18b59f908..8c8d2a4bc0b0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1270,13 +1270,9 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
 			continue;
 		if (!is_valid_name(elf, sym))
 			continue;
-		if (sym->st_value <= addr) {
-			if ((addr - sym->st_value) < distance) {
-				distance = addr - sym->st_value;
-				near = sym;
-			} else if ((addr - sym->st_value) == distance) {
-				near = sym;
-			}
+		if (sym->st_value <= addr && addr - sym->st_value <= distance) {
+			distance = addr - sym->st_value;
+			near = sym;
 		}
 	}
 	return near;
-- 
2.32.0

