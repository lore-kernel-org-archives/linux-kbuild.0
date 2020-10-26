Return-Path: <SRS0=c+w1=EB=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A73EC2D0A3
	for <linux-kbuild@archiver.kernel.org>; Mon, 26 Oct 2020 17:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBF592231B
	for <linux-kbuild@archiver.kernel.org>; Mon, 26 Oct 2020 17:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="CaGYb9fw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788921AbgJZR6S (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 26 Oct 2020 13:58:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44947 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1788917AbgJZR6Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 13:58:16 -0400
Received: by mail-pg1-f193.google.com with SMTP id o3so6474149pgr.11
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2020 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yo0mnlsSy3YgKGeUG02IRLcGcjRgZwwdFoj2NxiD5lI=;
        b=CaGYb9fwKX1t4/s7hL5McQiJsJosjdSgPtgRrXcOVEv9geNhsgv06QlYZxq9MmypsM
         8h2YGCwMDt5AFwQAVzFT9qgQDYt93HasEwsXY9F8AWf+nt41cl4k+rKcfknOH1hgOUks
         iNyNuzmEHIavPzF4GUjUo8btX9rmkJo7bx1Jo0qClUL2fxlqB+etlyZ4ygfoXJfgOFf9
         y30GRFWWH1aR0AL5e2Pe/R/+yhSkRAj3Lbcg95C8vcfqdWrthKHcBeF1axLUW5Gif+CD
         hUtko2x5J+g2cgiNr/cDNfys9Pg7rqVVOYO4UtgMHH7GZZmOPI9vgSEoW/ddjc6QnUcs
         PgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yo0mnlsSy3YgKGeUG02IRLcGcjRgZwwdFoj2NxiD5lI=;
        b=lreC/Y0fVaDaH74HHlYjT1aMlxwn3H9ZV8aIbbE07iEDVz+4tSasYmMhIT7ebP/saX
         TcPS5WHp6VT3kL1SE3F61QuEKDlvdp/pD28C7We0Kq6pEASQnBsyBtXY+jY9nRzB01Kp
         ntVSkYSAnD0S0G2ayuGiJQLbBc9RzUlgMdMrHKyCKwuG7UJY/9Nkv57UmvcaTWPhERdh
         zwo/sCeFPxwhmVDeRQIHq/yfkCFNmbh6+45HsmFDSdt3+piHeFWr7NEb8DFRXxW9oVIf
         n4WWpNL2pW16O1+zDHKOZXqFNHiS5DcrOvvR3atTMlDebWz/igONG5ypvVnCpmj8aGiU
         X3NA==
X-Gm-Message-State: AOAM530CFTGvj780k8vO/Z00NphhQ32aOn9gMK4rga9LpQdjoQGZsrEr
        1q1RO4tZrpbIkkhCmBrfpyfa
X-Google-Smtp-Source: ABdhPJyKADO7GsN5K7F28og4HF+KdQfGGrByPskuE8rwr33F4aFXWfsWuMVwDc84lw/9USAHHy9q7A==
X-Received: by 2002:a63:3e0a:: with SMTP id l10mr12627239pga.420.1603735094882;
        Mon, 26 Oct 2020 10:58:14 -0700 (PDT)
Received: from localhost.localdomain ([116.68.74.56])
        by smtp.gmail.com with ESMTPSA id o65sm11583088pga.42.2020.10.26.10.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:58:14 -0700 (PDT)
From:   Vaishnav M A <vaishnav@beagleboard.org>
To:     johan@kernel.org
Cc:     ribalda@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, masahiroy@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kbuild@vger.kernel.org,
        jkridner@beagleboard.org, drew@beagleboard.org,
        robertcnelson@beagleboard.org, vaishnav@beagleboard.org
Subject: [RFC PATCH 4/5] gnss: ubx add MODULE_DEVICE_TABLE(serdev)
Date:   Mon, 26 Oct 2020 23:27:17 +0530
Message-Id: <20201026175718.965773-5-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026175718.965773-1-vaishnav@beagleboard.org>
References: <20201026175718.965773-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

export serdev id table to the module header.

Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
---
 drivers/gnss/ubx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
index 7b05bc40532e..e50056cc4223 100644
--- a/drivers/gnss/ubx.c
+++ b/drivers/gnss/ubx.c
@@ -138,6 +138,14 @@ static const struct of_device_id ubx_of_match[] = {
 MODULE_DEVICE_TABLE(of, ubx_of_match);
 #endif
 
+static const struct serdev_device_id ubx_serdev_id[] = {
+	{ "neo-6m", },
+	{ "neo-8", },
+	{ "neo-m8", },
+	{}
+};
+MODULE_DEVICE_TABLE(serdev, ubx_serdev_id);
+
 static struct serdev_device_driver ubx_driver = {
 	.driver	= {
 		.name		= "gnss-ubx",
@@ -146,6 +154,7 @@ static struct serdev_device_driver ubx_driver = {
 	},
 	.probe	= ubx_probe,
 	.remove	= ubx_remove,
+	.id_table = ubx_serdev_id,
 };
 module_serdev_device_driver(ubx_driver);
 
-- 
2.25.1

