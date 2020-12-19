Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA748C3526D
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Dec 2020 17:09:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D21C23C19
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Dec 2020 17:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbgLSRI4 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Dec 2020 12:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgLSRI4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 12:08:56 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18309C0613CF;
        Sat, 19 Dec 2020 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=qv/T8Toe5nTIZxsEH1wMT7B0R1sHjwEhpjO/fE+3g+w=; b=X7hKRXle7Nny7BVmrZS28oYThK
        a5vWZBz0FBFZV+2FATlBmYnSZOiTI20+tbQE/PKQ15KmgA8EZ7CDPQYmnRDS4MOvxUPsiL5BlL9EY
        SA7XQ7B1CLIzji9TcP2AwXnQq8NlXuZJ7TKth6hzwskg/mWP3stsIlyykyM5JAypS6U6E43DhxqwQ
        lc8PV3V6W9Qy1fnxxnHVapcHFtfvrAil7D0aEv9JcDrMVA5fLWsraeZ/8sJWiP3YVMC2Fby8RPYWh
        Kbtdc5cw917HqfQjxfJtS9SAirDbi0N5uyKbrUtsTLQ8+3z8p2Iw+nmOThv5tECcDoy6hxfn83Ed+
        SuXiApYg==;
Received: from [2601:1c0:6280:3f0::64ea] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kqfiF-0005OP-FY; Sat, 19 Dec 2020 17:08:12 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andi Kleen <ak@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kconfig: config script: add a little user help
Date:   Sat, 19 Dec 2020 09:08:05 -0800
Message-Id: <20201219170805.7151-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Give the user a clue about the problem along with the 35 lines of
usage/help text.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andi Kleen <ak@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
---
v2: spell out "command" & send to STDERR; (Yamada-san)

 scripts/config |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20201218.orig/scripts/config
+++ linux-next-20201218/scripts/config
@@ -223,6 +223,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	*)
+		echo "bad command: $CMD" >&2
 		usage
 		;;
 	esac
