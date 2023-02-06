Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D487BC636CC
	for <linux-kbuild@archiver.kernel.org>; Mon,  6 Feb 2023 01:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBFB2D (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 5 Feb 2023 20:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjBFB2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Feb 2023 20:28:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B053612F0F;
        Sun,  5 Feb 2023 17:28:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4980660BAD;
        Mon,  6 Feb 2023 01:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42610C433D2;
        Mon,  6 Feb 2023 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675646880;
        bh=t9G8OoFLpiW3MTHtj2kJ4MrcZSlxmCfX1CehvS4POC8=;
        h=From:To:Cc:Subject:Date:From;
        b=H4z+BB38w50oBUjOo94JnKmg0bADEyBr2xlmWL89xxdd+xKX77WA8YcKCX4CGf/3t
         j8CwnAT0XgMuYMzxsmtjOvQGRZnupXtQ9S3F/67TAzD4hbtgusyCBiO61agv87eRlu
         GyBBo5KwZo18xiQY++xlhiumHPcR1YRnYQTjvmorMW31VPvMq3+fslOmo8WMhtb+Be
         R0xI8bMH4hFCb5sgrMDZm/PnhHmIbDbo/yqY+kAOUia1DZnYmq71gxEcpW0YZi7Vby
         DdB0Hfy0i12Wv6FssrNVERVMjpycq2+Bq2VySk83TMyKtOxMqIXSaN2+QUUTZcHmly
         p8Uq/FU6fQ3yw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] .gitattributes: use 'dts' diff driver for *.dtso
Date:   Mon,  6 Feb 2023 10:27:54 +0900
Message-Id: <20230206012754.2771051-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now we have the third extension for DT source files (overlay).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitattributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitattributes b/.gitattributes
index 4b32eaa9571e..a49e9ee50e9f 100644
--- a/.gitattributes
+++ b/.gitattributes
@@ -2,3 +2,4 @@
 *.h   diff=cpp
 *.dtsi diff=dts
 *.dts  diff=dts
+*.dtso diff=dts
-- 
2.34.1

