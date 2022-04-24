Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A22CC4332F
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Apr 2022 19:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbiDXTNv (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Apr 2022 15:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238049AbiDXTNr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Apr 2022 15:13:47 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDC0273E;
        Sun, 24 Apr 2022 12:10:12 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 23OJ8o5u019069;
        Mon, 25 Apr 2022 04:08:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o5u019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1650827332;
        bh=QjMPBrb5wf6oir+mjHPJkOaYov2v5r+YKqZc3MADo38=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VLz/irpeYp6S0/j252teXydLQ/fcZXUohfQGpmOg9d3BHQDeIVqsVnsg8nOkW3yta
         tsfQ3zaLw+QdnKJTfti724/lzYP6MeefnFwR+rqA/rBSFY4/59f8Tn4w0wRdO7c9r0
         Hn0sV0QvYsm5dkAv5HU6Rvh/egWGwYc61d5JNzryeOkZ84SazkMy98WbnnUm70fEp1
         dpTFHutO+BsEgdoR2b2Onz0JwNcunJDRiF2SvoY1nb427mZ3tPoGkl2r/UG8bf9dja
         3LDTStaE+fL68Uu3a4Wm7CJsiSXbAe2AeW16SXJ0o+y1EbJt89Y9LAAZjV9Za3jrad
         +dDJY02tlHAPQ==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 02/27] modpost: do not write out any file when error occurred
Date:   Mon, 25 Apr 2022 04:07:46 +0900
Message-Id: <20220424190811.1678416-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424190811.1678416-1-masahiroy@kernel.org>
References: <20220424190811.1678416-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If an error occurs, modpost will fail anyway. Do not write out
any content (, which might be invalid).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 141370ebbfd3..f0d48f65fb33 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2333,6 +2333,9 @@ static void write_buf(struct buffer *b, const char *fname)
 {
 	FILE *file;
 
+	if (error_occurred)
+		return;
+
 	file = fopen(fname, "w");
 	if (!file) {
 		perror(fname);
-- 
2.32.0

