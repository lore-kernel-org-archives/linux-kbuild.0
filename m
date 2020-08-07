Return-Path: <SRS0=rBkX=BR=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03757C433E0
	for <linux-kbuild@archiver.kernel.org>; Fri,  7 Aug 2020 09:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D474C2177B
	for <linux-kbuild@archiver.kernel.org>; Fri,  7 Aug 2020 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596791998;
	bh=Ro9R/gp3AVVCyODr7xn3Gvxc4f3BVHLLzxo2gr9JwoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=URH9UJqPYnbwL3jkl35GzrAi+HaEzsvhcfIxvC5xdwfwSfi0SV01IEOU6jj/81uK9
	 xR2kN9dCoW9xxwbaNOMdQN0nxRHLE///Hji4BYatIz6lyA8BQMuHTmru+ev73VZznq
	 l6Fvwi1ZyeOQlnyK3XaPZyiQ6YsXyQd7gXk2YqYk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgHGJT6 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 7 Aug 2020 05:19:58 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41592 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgHGJTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:40 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQB032147;
        Fri, 7 Aug 2020 18:19:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQB032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791963;
        bh=m09tCtobZs6F9i2lClFwAMkbk3NBVdznuOEPMyEcKcI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KRl03qCgJ7HnTqgXJycxhlM8D8UFwFjLFN1INtql72UfWEF7ffrOOku5fWSo2alGh
         V146t8by7eJzrS/nH25DPEL1HS+r6MMD6FnFRfq92L0vfV0qsFF1U/E1eOSLpK9uL2
         j42N9s1YhEXLWm8ioy8owZLCwdh+gYHtKWN6aAt3mIKyEWHyguD0fN/Ssq0fB2nOE0
         cyURGrbj78Sz501sV/+obs5O0yDB3kO2VRCLNAwyhtDyDD+NcTKCMWKt4vYm4m3ebH
         mbbG6K0Zggo4+KmeUZg4pcSRt8tWsgZPsz8Dz3wkjGD6eD+r+6n5BsH6Aa97edlVhC
         /zVonC+au1gDg==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/19] kconfig: qconf: remove ConfigItem::text/setText
Date:   Fri,  7 Aug 2020 18:19:05 +0900
Message-Id: <20200807091909.2985787-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeWidgetItem::text/setText directly

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index daa180bdb9b4..012414dcdee5 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -156,14 +156,6 @@ class ConfigItem : public QTreeWidgetItem {
 
 		return ret;
 	}
-	void setText(colIdx idx, const QString& text)
-	{
-		Parent::setText(idx, text);
-	}
-	QString text(colIdx idx) const
-	{
-		return Parent::text(idx);
-	}
 	// TODO: Implement paintCell
 
 	ConfigItem* nextItem;
-- 
2.25.1

