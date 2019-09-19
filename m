Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f182.google.com ([209.85.160.182]:44069 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732213AbfISNGU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Sep 2019 09:06:20 -0400
Received: by mail-qt1-f182.google.com with SMTP id u40so4042872qth.11
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Sep 2019 06:06:19 -0700 (PDT)
Message-ID: <1568898377.5576.186.camel@lca.pw>
Subject: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild warning
From: Qian Cai <cai@lca.pw>
Date: Thu, 19 Sep 2019 09:06:17 -0400
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Will Deacon <will@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
kbuild warning,

scripts/Makefile.asm-generic:25: redundant generic-y found in
arch/arm64/include/asm/Kbuild: dma-mapping.h
