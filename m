Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D239C77B73
	for <linux-kbuild@archiver.kernel.org>; Mon,  5 Jun 2023 12:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjFEMEM (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 5 Jun 2023 08:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjFEMEM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jun 2023 08:04:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4950092;
        Mon,  5 Jun 2023 05:04:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D94EF61055;
        Mon,  5 Jun 2023 12:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC6EC433D2;
        Mon,  5 Jun 2023 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685966650;
        bh=t39CyyE0D2EnrOjORk99IjUdoYtwCiKI3TASVRvTc7k=;
        h=From:To:Cc:Subject:Date:From;
        b=pUFyhTiGLGmoIe0Ge69XFzRwyz+cCXrIS73bq/rkn6j72RiNMK3Jp+ZATnhmBcMjX
         bL/tNP02gWtqzLfcpXkv0SBNXm1yiQMkHafrTeJOVj3MdCVphIal9fl8X2+AzfkZC0
         iGRZuw6jivSTzrrBCYTFKnvy2bigQnIPmAXFFuf2dDG/1nqUQ86Py7IGO38Lz5LmgQ
         KpySn/6iIxHNzuQzD6RFTmBr6CZqWr4Q4H39ooUah3jfmm9gKqIrjgGrXnnhdyXFmi
         tkH0608inGXHs5tnzw5ALCEIyhhyz2hiAGm+KF6WGchWeR1C3BoYzKRB55MwXCPOkO
         QCxlIsCRd5h/w==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] scripts/kallsyms: constify long_options
Date:   Mon,  5 Jun 2023 21:04:00 +0900
Message-Id: <20230605120400.1775196-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

getopt_long() does not modify this.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0d2db41177b2..8e97ac7b38a6 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -806,7 +806,7 @@ static void record_relative_base(void)
 int main(int argc, char **argv)
 {
 	while (1) {
-		static struct option long_options[] = {
+		static const struct option long_options[] = {
 			{"all-symbols",     no_argument, &all_symbols,     1},
 			{"absolute-percpu", no_argument, &absolute_percpu, 1},
 			{"base-relative",   no_argument, &base_relative,   1},
-- 
2.39.2

