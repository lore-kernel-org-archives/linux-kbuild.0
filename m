Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A40C11F64
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Jul 2021 09:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC5756148E
	for <linux-kbuild@archiver.kernel.org>; Thu,  1 Jul 2021 09:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbhGAJW3 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 1 Jul 2021 05:22:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59353 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235608AbhGAJW3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 05:22:29 -0400
X-UUID: 9147900c3edf4b3187cd0b6294cd4d85-20210701
X-UUID: 9147900c3edf4b3187cd0b6294cd4d85-20210701
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1776049091; Thu, 01 Jul 2021 17:19:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 17:19:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 17:19:25 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>, <samitolvanen@google.com>,
        <linux-kbuild@vger.kernel.org>, <nathan@kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH v2 0/2] Kbuild: lto: add make version checking for MODVERSIONS
Date:   Thu, 1 Jul 2021 17:19:20 +0800
Message-ID: <20210701091922.572-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LTO with MODVERSIONS will fail in generating correct CRC because
the makefile rule doesn't work for make with version 3.8X.

Refer to [1]:
> When building modules(CONFIG_...=m), I found some of module versions
> are incorrect and set to 0.
> This can be found in build log for first clean build which shows

> WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed,
> symbol will not be versioned.

> But in second build(incremental build), the WARNING disappeared and the
> module version becomes valid CRC and make someone who want to change
> modules without updating kernel image can't insert their modules.

> The problematic code is
> + $(foreach n, $(filter-out FORCE,$^),        \
> +   $(if $(wildcard $(n).symversions),      \
> +     ; cat $(n).symversions >> $@.symversions))

The issue is fixed when make version upgrading to 4.2.

Thus we need to check make version during selecting on LTO Kconfig.
Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
for arithmetic comparisons.

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>


----
v2:
- change MAKE_VERSION_INT to MAKE_VERSION
- remove $(make-version)
- tweak commit message

v1:
https://lore.kernel.org/lkml/20210630121436.19581-1-lecopzer.chen@mediatek.com/
----

Lecopzer Chen (2):
  Kbuild: lto: add CONFIG_MAKE_VERSION
  Kbuild: lto: add make version checking

 Makefile                |  2 +-
 arch/Kconfig            |  1 +
 init/Kconfig            |  4 ++++
 scripts/make-version.sh | 13 +++++++++++++
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100755 scripts/make-version.sh

-- 
2.18.0

