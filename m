Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55C3CDB474
	for <linux-kbuild@archiver.kernel.org>; Sun, 22 Oct 2023 17:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjJVRGU (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 22 Oct 2023 13:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjJVRGT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Oct 2023 13:06:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49C1FB;
        Sun, 22 Oct 2023 10:06:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743BDC433C7;
        Sun, 22 Oct 2023 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697994377;
        bh=aafAL1hrhWdQi1r3hDDC/LTfTORpY13U/ijFZlOIkXo=;
        h=From:To:Cc:Subject:Date:From;
        b=GGsSETCiO1sWlJyEge9UTMZajZsjLRU7NUc/l1QFzTfJ0jg/mS+fPr39UsZ7bTQ2B
         9cCxIY38FI/JruLFAx/wKsGVOh10xsjjZ6jEH0p3rd06B/cHCJSfNJ1mD0klFYcXYn
         hsT5ascr+XOHofPof3/7XC7tNPfjlrBKx833mnD40YRCfgmC9XgR7/dGo8nSKe2wZL
         arKNosxPadGHPAXWkdq8VlZ0LfxjybPyBBZUo1IHl9GjzS0vqxTQIoCIpIVJfr0ObU
         g0oPJpgDN0vd+LksDTLyZmC4Cv4YvPlEUJ+JO0ZDQcKFTKLYFc7L7V/h/QjJk27YKI
         J3eYnwmKMG83Q==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 01/10] modpost: remove ALL_EXIT_DATA_SECTIONS macro
Date:   Mon, 23 Oct 2023 02:06:04 +0900
Message-Id: <20231022170613.2072838-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is unused.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f1f658122ad8..d936fa5fbbb1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -794,8 +794,6 @@ static void check_section(const char *modname, struct elf_info *elf,
 #define ALL_INIT_DATA_SECTIONS \
 	".init.setup", ".init.rodata", ".meminit.rodata", \
 	".init.data", ".meminit.data"
-#define ALL_EXIT_DATA_SECTIONS \
-	".exit.data", ".memexit.data"
 
 #define ALL_INIT_TEXT_SECTIONS \
 	".init.text", ".meminit.text"
-- 
2.40.1

