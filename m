Return-Path: <SRS0=ZCXy=B5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D09C433E1
	for <linux-kbuild@archiver.kernel.org>; Wed, 19 Aug 2020 22:00:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24380207FF
	for <linux-kbuild@archiver.kernel.org>; Wed, 19 Aug 2020 22:00:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOxFLwyr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHSWAw (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 19 Aug 2020 18:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHSWAv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 18:00:51 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546BCC061757
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 15:00:51 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r2so180178wrs.8
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Aug 2020 15:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=c3v23gLPRiu1mq+J6whazhNx2EnBh70zAJQ/hZhG6MU=;
        b=LOxFLwyrgrswDNpBjhabCnpbRHOzG0Y79Stzj+2IG8SAM/8cn1AVRGYAKNRN8BasBo
         83AUqwgbDM7TH2bMQFlnCjjR+RlzLS1pyGK0ejyBHKdJKJV9i0UKz8NOyCUa7Q/gIE7N
         Nnr7CXuwS9o4LcWVuZsHAoTYlV4R/F+dbbRdk8ZCYzeNI8O3XygTEnB6HR5NOsZh1+hA
         TDhr2aAQ9QG8+Jl7Db9AQDFRfH4e9LfaFYySvajR3pM5xiAnmaDBH0c9F5PHPg45cl3V
         N7Z6hY5OtKH1raAIeuNyHrapAbUuEBWxFku+1M1Obbn9CbnuQk6et6IDhP439/H2mReQ
         GgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=c3v23gLPRiu1mq+J6whazhNx2EnBh70zAJQ/hZhG6MU=;
        b=Z8VL1cWHV7721cGHx0vMFeknq/YvlQPJMlL71RXnOkdIm+iiwO9+CB1nnCRnDrW27S
         cBfYhTSarnYczFrfis0iy3xlpIfoI4BOd0CTSnXhJkGNDAVM9I0+zJUJGY5lI8GEzjKy
         5MaZ7JuY3nD88tRvWl0uFqLrIUeXL5rqLiRvC9bxnb+sBtLPpJYNpasfE71SzSccfxHg
         c2pRirqPt5ukzZdl2pMKNYkqYH4h4k2yuXVb+i13pFXSu+9jsHjvOWyTtzhQCl2qAejS
         C70iKldD3QLBzec83uhYvVup0g/lnT+9ORybP7cJ6RK8LMakk+vsuxy88AWAoD/Zmw0o
         0EFw==
X-Gm-Message-State: AOAM532bIEYZSr5Q1lmtD5KAhp9K+j5JIJ+KEo0nA50yMuvYOg5M+lQy
        ixhwmeI0O1KQBVDmvOZ2rxw=
X-Google-Smtp-Source: ABdhPJz9SrWW+l6i2zJoaeh2fEH5Lkxl4Gy2BCtt4i8Yj+ylG32MtuZcA/r+n0aqiDwj94NtQ52Ipw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr90261wrg.406.1597874450067;
        Wed, 19 Aug 2020 15:00:50 -0700 (PDT)
Received: from localhost (cpc122446-belf12-2-0-cust102.2-1.cable.virginm.net. [80.3.85.103])
        by smtp.gmail.com with ESMTPSA id c15sm416389wme.23.2020.08.19.15.00.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 15:00:49 -0700 (PDT)
From:   Graeme Hayes <hayes.graeme.p@gmail.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, trivial@kernel.org,
        Graeme Hayes <hayes.graeme.p@gmail.com>
Subject: [PATCH] Documentation: kbuild: modules.rst: Edit '$$' typo, avoid make error
Date:   Wed, 19 Aug 2020 22:55:54 +0100
Message-Id: <20200819215554.5742-1-hayes.graeme.p@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Typo '$$' generates make error when run, and was pasted twice more.

Signed-off-by: Graeme Hayes <hayes.graeme.p@gmail.com>

---
 linux-kbuild/Documentation/kbuild/modules.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-kbuild/Documentation/kbuild/modules.rst b/linux-kbuild/Documentation/kbuild/modules.rst
index 85ccc87..c7837a5 100644
--- a/linux-kbuild/Documentation/kbuild/modules.rst
+++ b/linux-kbuild/Documentation/kbuild/modules.rst
@@ -205,7 +205,7 @@ module 8123.ko, which is built from the following files::
		KDIR ?= /lib/modules/`uname -r`/build
 
		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
@@ -239,7 +239,7 @@ module 8123.ko, which is built from the following files::
 		KDIR ?= /lib/modules/`uname -r`/build
 
 		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
@@ -268,7 +268,7 @@ module 8123.ko, which is built from the following files::
 		KDIR ?= /lib/modules/`uname -r`/build
 
 		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
+			$(MAKE) -C $(KDIR) M=$PWD
 
 		# Module specific targets
 		genbin:
-- 
2.17.1

