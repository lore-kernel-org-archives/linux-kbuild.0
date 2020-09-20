Return-Path: <SRS0=pYaD=C5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1C8C43465
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 22:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0283520C09
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 22:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hadrons.org header.i=@hadrons.org header.b="ZtFzju/y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgITWsJ (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 20 Sep 2020 18:48:09 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36134 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITWsJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=YMzDYsec9FZJJ7mOtoB7NnFuz2k8Ixac2X0Jk19iqDI=; b=ZtFzju/yFbLU/vrl5V3ZabzEjN
        cY6WeENXq8YikkieI8x+HwoqOKBUBhfOB3xWY0t77x/qyCbt6zBHl403QXcJ93P0fhBLqtzzTyPJF
        RUom1OGwIYfxWSFDe6gyeFMvameMRi/QH5kydBTYJq7WsHhKePKYPNhPQVAnTqDOt5u8uhdqop5iu
        5rtIFdyp6+MIH3T3FVbn40OHlYPe4FHu7pbwjoP1ncMqy61pXg/45CMSRpMQqNBtTzwr2PMv4/GBu
        i6IzZFguDOMTU57+VxoKhrzdSKVVvABPtW3MiBhNeZXEaQ/gIQiA7dY9+twBkVbyF9kIiAndDAKLG
        MVe2FBYA==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7nF-0002cq-68; Mon, 21 Sep 2020 00:26:49 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] builddeb: Map rc versions to use an earlier than version scheme
Date:   Mon, 21 Sep 2020 00:25:55 +0200
Message-Id: <20200920222556.10002-7-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This makes it possible to build release candidates that will have a
version earlier than the final release.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/mkdebian | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b98c382f967a..ed77d0948fa3 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -93,6 +93,7 @@ else
 	revision=$(cat .version 2>/dev/null||echo 1)
 	packageversion=$version-$revision
 fi
+packageversion=$(echo $packageversion | sed -e 's/-rc/~rc/')
 sourcename=$KDEB_SOURCENAME
 packagename=linux-image-$version
 kernel_headers_packagename=linux-headers-$version
-- 
2.28.0.297.g1956fa8f8d

