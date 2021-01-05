Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4532FC433DB
	for <linux-kbuild@archiver.kernel.org>; Tue,  5 Jan 2021 11:25:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00F31229C7
	for <linux-kbuild@archiver.kernel.org>; Tue,  5 Jan 2021 11:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbhAELZN (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 5 Jan 2021 06:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbhAELZK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jan 2021 06:25:10 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23DEC061574
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Jan 2021 03:24:30 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y8so16190529plp.8
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Jan 2021 03:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iojE0FbfksPxGDHaoi7nGrdC6/TZhC32X4xFEfuq34=;
        b=sNDlCvXHU9mLxar1M2e31cqruXME5LN6Jy9m4aJa+LZqduw2ZZJhttZy1wsk5HnFNY
         BsMZQz/Gc7kJDGvxkMNuV7koBFW+CsLmmomfJBuFE1x+awiQFt2rLV+rdDDWWH2cS2+3
         7jwg7++0ZQLrwLOiCxfg+uiBg9RYAaDDIm2X96sU5o28cBbRiWkDBVrazPLHLGPefiQx
         Hbh/hBSI0U97n0l0lzKxJiT4xtabaMeYDIxYz47b7WKTsWyziykZklTrenfhvtR5vsvi
         7z8LLzsAjwxYQdM/bP+8U+QLCYtcFSYAp+BkkcInf5lkPKfJVIcDqKjppqYaTUVb7l1d
         RElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iojE0FbfksPxGDHaoi7nGrdC6/TZhC32X4xFEfuq34=;
        b=tETCbq3u3x8Q157HstLpgCOmizDbak2vICpvsJD86EAPcu74uQ3w7oRPzNuMax2PxR
         1kTBKC+S5sh0vCWDiL9NUDwMWjvjK7uxZHAsBYYruKv3AIdi1skNlogy1h2QtjkTHYpk
         OdUDAfoD7LwWpteehafITieTXIEtFI+Pk0ybm6qqgcaga/m1UM/rGmqbTf6TtEL954Y+
         +ZKmt8k5MNP+bRF1V4IXl8qQsfojR+xe9y47hOOXymoY2hOMKTmTua1LjMXXG1axJ+b/
         f8pCh+t6ZKt2NX34V1Kw0uHFMQVMBryJFxcx4HeI2UmwwIz6wZgnaBShHo0WolxAHFqZ
         UQ+Q==
X-Gm-Message-State: AOAM533uscWU2f6Nt2W4NebqFVEbVzNaEtW3NrnQwkQ1/+BZAmK3vMQr
        Y353ZwVuhkR3aHTi6ZCy14W1Og==
X-Google-Smtp-Source: ABdhPJwzVyGl0/EingPinXtXC3JWREuAJMsR+Ve0tkMJ6goYPApiB5S/0FlD1EUbTmkYQxJgdKCCbg==
X-Received: by 2002:a17:90a:c82:: with SMTP id v2mr3574430pja.171.1609845870173;
        Tue, 05 Jan 2021 03:24:30 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id k3sm39035119pgm.94.2021.01.05.03.24.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 03:24:29 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Subject: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
Date:   Tue,  5 Jan 2021 16:54:15 +0530
Message-Id: <cover.1609844956.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

Here is an attempt to make some changes in the kernel to allow building
of device tree overlays.

While at it, I would also like to discuss about how we should mention
the base DT blobs in the Makefiles for the overlays, so they can be
build tested to make sure the overlays apply properly.

A simple way is to mention that with -base extension, like this:

$(overlay-file)-base := platform-base.dtb

Any other preference ?

Also fdtoverlay is an external entity right now, and is not part of the
kernel. Do we need to make it part of the kernel ? Or keep using the
external entity ?

Thanks.

--
Viresh

Viresh Kumar (2):
  kbuild: Add support to build overlays (%.dtbo)
  scripts: dtc: Handle outform dtbo

 Makefile             |  4 ++--
 scripts/Makefile.lib | 12 ++++++++++++
 scripts/dtc/dtc.c    |  2 ++
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

