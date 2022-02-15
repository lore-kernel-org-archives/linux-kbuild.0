Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA94DC433EF
	for <linux-kbuild@archiver.kernel.org>; Tue, 15 Feb 2022 15:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240462AbiBOPd5 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 15 Feb 2022 10:33:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240547AbiBOPdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Feb 2022 10:33:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCA0B0C79;
        Tue, 15 Feb 2022 07:30:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 953EFB81AF5;
        Tue, 15 Feb 2022 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1B6C340F3;
        Tue, 15 Feb 2022 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644939017;
        bh=mlCVfXCI/MPFLPPvRfg1e5hONyIiSJQMvH37hKzLE5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RdaY07F/K1+Cn8HjRF7YNkhcRwm8JKSNkJkumk+AFbRAWnKkvYnBkHIdI+sWyj8dE
         l/UgKjwxykJe8txJE35DdqMeny0unqZ8+16wXcETwUV5EkFD8DlNAUO3r6riTNbill
         6wD1jny+pjGTs3UX1Xcwbh9mZXL9/VyuoRSqUks5LZ9IpAH8ron8G998JKOBkktAk0
         3/Q9LjbtoKY19Ko7FvMOnAvzgnlQ7iaAhbdZVfowSXwLlNnAkaO4foGvu5ex+sPYF4
         8yPhnJlvPRbGW4SuJA3zQ0Oue8YyfE2B/9fMggy455PYLNsL3lzoqwv7Khv6ZSHgYg
         b3DmnkxObMBlg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Brenda Streiff <brenda.streiff@ni.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/23] kconfig: let 'shell' return enough output for deep path names
Date:   Tue, 15 Feb 2022 10:29:46 -0500
Message-Id: <20220215152957.581303-12-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152957.581303-1-sashal@kernel.org>
References: <20220215152957.581303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Brenda Streiff <brenda.streiff@ni.com>

[ Upstream commit 8a4c5b2a6d8ea079fa36034e8167de87ab6f8880 ]

The 'shell' built-in only returns the first 256 bytes of the command's
output. In some cases, 'shell' is used to return a path; by bumping up
the buffer size to 4096 this lets us capture up to PATH_MAX.

The specific case where I ran into this was due to commit 1e860048c53e
("gcc-plugins: simplify GCC plugin-dev capability test"). After this
change, we now use `$(shell,$(CC) -print-file-name=plugin)` to return
a path; if the gcc path is particularly long, then the path ends up
truncated at the 256 byte mark, which makes the HAVE_GCC_PLUGINS
depends test always fail.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/preprocess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 0590f86df6e40..748da578b418c 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -141,7 +141,7 @@ static char *do_lineno(int argc, char *argv[])
 static char *do_shell(int argc, char *argv[])
 {
 	FILE *p;
-	char buf[256];
+	char buf[4096];
 	char *cmd;
 	size_t nread;
 	int i;
-- 
2.34.1

