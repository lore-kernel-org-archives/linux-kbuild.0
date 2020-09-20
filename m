Return-Path: <SRS0=pYaD=C5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E76C43466
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 22:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6069F221EC
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 22:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=hadrons.org header.i=@hadrons.org header.b="UV7CLBqN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgITWsW (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 20 Sep 2020 18:48:22 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36158 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgITWsW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=nQ/+3EXMGCfv5w3c8BcAsHfQAJ33f3bo1YRa2gxUlcU=; b=UV7CLBqN85y5W79KMd4P8uOhht
        Oqnmx6NHYevJIZcR6ywWgoFSbBD3dkbC7JQfnxsIVnXwGUGfWBzwfRhRCAAN27rqe+7ZxFc0WsmMK
        hLH+p5jPHeDxff5BwsUJZ/K41iAdwaD/v7LfxKxX9Fwrle1zcBmfidzF7Wb1u0JBlE7vnJnyWWIuG
        VB4ZTSQXNxdXWc+ERknc+lTAg6PgTnq+sLf5HCwLkVJeOREEfv0q63G8rvm6wQfZS4ftjhinU6cVe
        3X6kLkv9tO5+zTldeE2PQL+jxdjIhoQNn7msoGYDbUrKcrtrcCOm1RNL0xV3628dScaGhQSEopEI5
        43yMviwg==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7nG-0002cx-Al; Mon, 21 Sep 2020 00:26:50 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] builddeb: Try to get the user full name from the GECOS field
Date:   Mon, 21 Sep 2020 00:25:56 +0200
Message-Id: <20200920222556.10002-8-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The GECOS field might contain the full name for the username, try to
use that and fallback to using the username if that is empty.

Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/mkdebian | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index ed77d0948fa3..e3d0b7ac9057 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -113,7 +113,8 @@ if echo $email | grep -q '<.*>'; then
 else
 	# or construct the maintainer string
 	user=${KBUILD_BUILD_USER-$(id -nu)}
-	name=${DEBFULLNAME-$user}
+	name=${DEBFULLNAME-$(getent passwd $user | cut -d: -f5 | cut -d, -f1)}
+	: "${name:=$user}"
 	if [ -z "$email" ]; then
 		buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
 		email="$user@$buildhost"
-- 
2.28.0.297.g1956fa8f8d

