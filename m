Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308C9ECAAD3
	for <linux-kbuild@archiver.kernel.org>; Wed, 14 Sep 2022 12:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiINMCN (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 14 Sep 2022 08:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiINMCM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Sep 2022 08:02:12 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134FF1CFEA
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Sep 2022 05:02:11 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MSJkW3Bb3zlVrg;
        Wed, 14 Sep 2022 19:58:11 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 14 Sep
 2022 20:02:09 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <dhowells@redhat.com>
CC:     <linux-kbuild@vger.kernel.org>, <liwei391@huawei.com>
Subject: [PATCH] scripts: remove unused argument 'type'
Date:   Wed, 14 Sep 2022 20:09:21 +0800
Message-ID: <20220914120921.3739309-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove unused function argument, and there is
no logic changes.

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 scripts/asn1_compiler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/asn1_compiler.c b/scripts/asn1_compiler.c
index adabd4145264..71d4a7c87900 100644
--- a/scripts/asn1_compiler.c
+++ b/scripts/asn1_compiler.c
@@ -832,7 +832,7 @@ static void parse(void)
 
 static struct element *element_list;
 
-static struct element *alloc_elem(struct token *type)
+static struct element *alloc_elem(void)
 {
 	struct element *e = calloc(1, sizeof(*e));
 	if (!e) {
@@ -860,7 +860,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 	char *p;
 	int labelled = 0, implicit = 0;
 
-	top = element = alloc_elem(cursor);
+	top = element = alloc_elem();
 	element->class = ASN1_UNIV;
 	element->method = ASN1_PRIM;
 	element->tag = token_to_tag[cursor->token_type];
@@ -939,7 +939,7 @@ static struct element *parse_type(struct token **_cursor, struct token *end,
 		if (!implicit)
 			element->method |= ASN1_CONS;
 		element->compound = implicit ? TAG_OVERRIDE : SEQUENCE;
-		element->children = alloc_elem(cursor);
+		element->children = alloc_elem();
 		element = element->children;
 		element->class = ASN1_UNIV;
 		element->method = ASN1_PRIM;
-- 
2.25.1

