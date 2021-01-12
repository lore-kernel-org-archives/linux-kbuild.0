Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB458C433E9
	for <linux-kbuild@archiver.kernel.org>; Tue, 12 Jan 2021 08:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6276922D58
	for <linux-kbuild@archiver.kernel.org>; Tue, 12 Jan 2021 08:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbhALI3u (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 12 Jan 2021 03:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405404AbhALI3u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 03:29:50 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06FEC061795
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 00:29:09 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c79so967578pfc.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 00:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrBTMwuCocMXNaZlBloj14p7TaV3dUqyAg3ZjdKSdtQ=;
        b=SheSm7pPzbdgKTGIS5Wbrtm+EyLFpf3IdIFMHUhJjjd5RQsq61KHB9elZRuoTCC2Eu
         LhpDn7kN9a6R63hOsxSvvK9hDTeYJ7SEtf4ru2381HGPyfNGlGMggNq+C+T5igUUdWu4
         3AR0la2JlukQLl4bU9bpUeZiz/TW1WQ8YQ6KDxI2/405yKKJT4JB+qRx+zwCY+FDMvKM
         8LQe6n459ZQlGeYxWMcdJBvgCrPcDPRqS0Uzgeh8X/lACZyHl2RjwmWzCdtqDCelh1qM
         pidA75ympxCe2WCGm3+XyvVw2REGMrrOcPYYuF70ZbeLxzJGg3UX7qhSjISoshlYIikH
         eNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CrBTMwuCocMXNaZlBloj14p7TaV3dUqyAg3ZjdKSdtQ=;
        b=VmHsQqeKf9OJ4qJDtqu5CL8tysXqf2JKd3AKwQ/wzRYPJYWPSj+KeA85JAC4J1+j3E
         JzVIvw3bxliiATw0lrIivagnckR5CsbpdrHNkpebr5Adjak85nw82J82BtiedM+Bw3HX
         v3QdevedwSx0ZTaLUet7LCMBRhcwCruJYZrM/PUgyuI2yWk8aS5ZYyXE4wy7oIuAKAvB
         h8Vgv/wM0H1PXoLmnfKwKkB9ZIMmYmkNzBj4wZu55QB74RrK+sh2SBLnZZvfxMGnSv1t
         8XYcIS6jZxSUgpQSVbisSaUFSeDz45T8BysdrwZtdhuS6R5mr4T9/jn9CmYu2CZ0mHQs
         LGig==
X-Gm-Message-State: AOAM531FdiZeFNH2PdwTH+fFHxBrC1JSQC5z0a+jhJgvA7xgAGXXgRmh
        BGOYEevg1SgEZsIvAmgAd4IuNg==
X-Google-Smtp-Source: ABdhPJweEioWpVtvQX71VyotDntXRJ0bZz1J7VJsaDO6OCrG4WuPO1/Yj0aac3RBFhQPfdcf3jYj+g==
X-Received: by 2002:a63:d601:: with SMTP id q1mr3608947pgg.417.1610440149194;
        Tue, 12 Jan 2021 00:29:09 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id r79sm2187433pfc.166.2021.01.12.00.29.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 00:29:08 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Date:   Tue, 12 Jan 2021 13:58:59 +0530
Message-Id: <cover.1610431620.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We will start building overlays for platforms soon in the kernel and
would need fdtoverlay tool going forward. Lets start fetching and
building it.

While at it, also remove fdtdump.c file, which isn't used by the kernel.

V4:
- Don't fetch and build fdtdump.c
- Remove fdtdump.c

Viresh Kumar (3):
  scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
  scripts: dtc: Build fdtoverlay tool
  scripts: dtc: Remove the unused fdtdump.c file

 scripts/dtc/Makefile             |   6 +-
 scripts/dtc/fdtdump.c            | 163 -------------------------------
 scripts/dtc/update-dtc-source.sh |   6 +-
 3 files changed, 8 insertions(+), 167 deletions(-)
 delete mode 100644 scripts/dtc/fdtdump.c

-- 
2.25.0.rc1.19.g042ed3e048af

