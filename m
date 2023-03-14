Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F3FC6FD19
	for <linux-kbuild@archiver.kernel.org>; Tue, 14 Mar 2023 00:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjCNAn6 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 13 Mar 2023 20:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjCNAno (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2023 20:43:44 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C847F9224D;
        Mon, 13 Mar 2023 17:43:20 -0700 (PDT)
From:   Bastian Germann <bage@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1678754582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AvoUlui3Lli1dNY50lZfhcWoWPB+F1Ho3ol5gFyweZ4=;
        b=jYlE1HKM866OsokR0VKzQha/o8Rb1l7OZifDQ7IlGQr7/1SN1+LWn0xzmMYxfExls1W1dC
        QNY4YAvLzyvXY9SDYuQqIaFVLGJUYNp+AzUhGq+4WoP2h2uEVE5vR5X8/BThTHMZ31F+MY
        r7zIV4446qxT2vElv6Y2Rd6dH5vfDesFTEJ7D9iu1KyDCBLKvUo/Of/0EKOcGfAmkDip86
        k57xMPLKPr64hKLl/K5rDSVQf/PCyhYOAeY0TsF+QsRyYT1JrPjKBKlLkosSQOurNAZm6H
        QS2aj5vfTNGnzv82Aexl0aMBOz3pYHoIpWv5pB62NlTkmNDv6vg7KjSQBnJERg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1678754582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AvoUlui3Lli1dNY50lZfhcWoWPB+F1Ho3ol5gFyweZ4=;
        b=7ret0gOMzckO1p0qRAIgTpemdK/d5EpWslRZjhYJDahlBTNN6Wr+a55GvsZBwzX23ZllpE
        rFEEoXiKnRyX9eAQ==
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bastian Germann <bage@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] builddeb: Eliminate debian/arch use
Date:   Tue, 14 Mar 2023 01:40:21 +0100
Message-Id: <20230314004022.403937-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The debian/arch is almost unused.
Eliminate the last use during dpkg-buildpackage time.

Bastian Germann (1):
  builddeb: Eliminate debian/arch use

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.39.2

