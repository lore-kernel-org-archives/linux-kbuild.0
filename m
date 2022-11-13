Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B3BC4332F
	for <linux-kbuild@archiver.kernel.org>; Sun, 13 Nov 2022 10:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiKMK74 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 13 Nov 2022 05:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235243AbiKMK7z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Nov 2022 05:59:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8029EE05;
        Sun, 13 Nov 2022 02:59:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F2BA60B7E;
        Sun, 13 Nov 2022 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B27C433D7;
        Sun, 13 Nov 2022 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668337193;
        bh=A7FQti5m/wYHdPhKdMyiYjVn1oIvpGLNd4xV582l6p4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CUodnP3ESQ4gJfqqJtLjdowamhxWOjPQ4lW6AEbCVfnICp/2AW5Pqn7Yh2UjdmrNr
         uS8x1U/V2ZZ6yWFLqUOkGg/rp3wGy6TbOCk5LZLXixIzIZ4ipoSlhLikpzobMt/BA6
         vf6zJuD1zSuOWceDRRc+dR/HUYfmO3DRDoj3lxwcbaWhQwRXyp0bmczKqWoN62QylH
         ZYc/k6yV8GTueLW2Swre0IIAYLDhRQP7GvX1I0H8iRJJZ7RKuJvsD1ryGAsCWwFEvH
         LJGncv35xsPyevOXRfF/LBBzIc808Tn98X8khsZ6nXNiAZrD5NAZlm13EeY2qUrReO
         tfxFEbcLfY3hw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kconfig: remove redundant (void *) cast in search_conf()
Date:   Sun, 13 Nov 2022 19:59:43 +0900
Message-Id: <20221113105943.3753945-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221113105943.3753945-1-masahiroy@kernel.org>
References: <20221113105943.3753945-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The (void *) cast is redundant because the last argument of
show_textbox_ext() is an opaque pointer.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/mconf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index d7f7e1bf7dd4..9c549683c627 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -441,8 +441,7 @@ static void search_conf(void)
 		res = get_relations_str(sym_arr, &head);
 		set_subtitle();
 		dres = show_textbox_ext("Search Results", str_get(&res), 0, 0,
-					keys, &vscroll,
-					&hscroll, &update_text, (void *)
+					keys, &vscroll, &hscroll, &update_text,
 					&data);
 		again = false;
 		for (i = 0; i < JUMP_NB && keys[i]; i++)
-- 
2.34.1

