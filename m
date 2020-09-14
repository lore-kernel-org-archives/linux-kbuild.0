Return-Path: <SRS0=rOOZ=CX=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9C1C433E2
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 15:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 333C520829
	for <linux-kbuild@archiver.kernel.org>; Mon, 14 Sep 2020 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600095837;
	bh=fPyobzS9HbyWZughCvPFCGQH0CTq+/rTIeLxTuinUNM=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=m//mJvavKvhxoWif2zEeWH/2u4sYSmp/y95EPgSEAUqpLXR4MU6yQvoP8MZRk6QWw
	 GyVcz2JqP2n2I0asog0ser46A8VzFVBiuTNpvOUhPqrUdNYtGyrvKY3amSahqnsyev
	 Svy6D9HW6q5r19dR00n1mK6BvjtUpYI4uDX/EwA8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgINPCC (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 14 Sep 2020 11:02:02 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:30477 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726367AbgINPAU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 11:00:20 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 08EExphA013557;
        Mon, 14 Sep 2020 23:59:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 08EExphA013557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600095592;
        bh=5lpLwEgtk3ygHU0abj0WysEGteTVMZkDJfsEz2/EVp0=;
        h=From:To:Cc:Subject:Date:From;
        b=LNY9ziEo70WUI/1P29g2DH3eu/2xNLBgAiUhs4Ff00hTLIMkltkk1pvkI5Htc3asH
         XgtiphyDY1ptIclSi76Fabo8My886qyO7PaI5TqFIbvguR1/l3BuR75hQM7MwiUEF7
         fW7vXT8uM2vKCfFNbbgro5DVNbmuxI2t2ygcUfV6Me+LOUEPwI1581hRGCGkIb004X
         pWxJhDWbJ1JtNV8x45LsA16KWeb47sIzgRAJA8h7WLWJZB52Yr4YQOBJrkYRM6ZVzY
         sSm8KQzFUcLR9mUcTBRQulGI0SKUcrJcQaVEEjFkzshptAegM01D00h1eIJuzg+pRD
         fXm6nwifw3JRA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: revive help message in the info view
Date:   Mon, 14 Sep 2020 23:59:48 +0900
Message-Id: <20200914145948.515677-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 68fd110b3e7e ("kconfig: qconf: remove redundant help in
the info view"), the help message is no longer displayed.

I intended to drop duplicated "Symbol:", "Type:", but precious info
about help and reverse dependencies was lost too.

Revive it now.

"defined at" is contained in menu_get_ext_help(), so I made sure
to not display it twice.

Fixes: 68fd110b3e7e ("kconfig: qconf: remove redundant help in the info view")
Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8638785328a7..9f306e780c2f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1108,6 +1108,11 @@ void ConfigInfoView::menuInfo(void)
 		if (showDebug())
 			stream << debug_info(sym);
 
+		struct gstr help_gstr = str_new();
+
+		menu_get_ext_help(_menu, &help_gstr);
+		stream << print_filter(str_get(&help_gstr));
+		str_free(&help_gstr);
 	} else if (_menu->prompt) {
 		stream << "<big><b>";
 		stream << print_filter(_menu->prompt->text);
@@ -1119,11 +1124,11 @@ void ConfigInfoView::menuInfo(void)
 					   expr_print_help, &stream, E_NONE);
 				stream << "<br><br>";
 			}
+
+			stream << "defined at " << _menu->file->name << ":"
+			       << _menu->lineno << "<br><br>";
 		}
 	}
-	if (showDebug())
-		stream << "defined at " << _menu->file->name << ":"
-		       << _menu->lineno << "<br><br>";
 
 	setText(info);
 }
-- 
2.25.1

