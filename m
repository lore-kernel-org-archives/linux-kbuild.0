Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB978C433FE
	for <linux-kbuild@archiver.kernel.org>; Sun,  2 Oct 2022 18:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiJBSMf (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 2 Oct 2022 14:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJBSM2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Oct 2022 14:12:28 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C594136840;
        Sun,  2 Oct 2022 11:12:26 -0700 (PDT)
Received: from zoe.. (133-32-182-133.west.xps.vectant.ne.jp [133.32.182.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 292IBAaB004037;
        Mon, 3 Oct 2022 03:11:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 292IBAaB004037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1664734271;
        bh=8r1VDKEz4entEnXoZ9S8yy0lKGUBqxseaSs8x2wwOJs=;
        h=From:To:Cc:Subject:Date:From;
        b=s0pAvhknTZAO9dxk+vPqHCnnsY7OP9JXExYFKBpR0cfjpgv1GPaP5J5cccgxQ+d61
         7FWItvriCK2dTAyyilEY40THt/qCO2JgAKEsakaSkv0uAUjWG9SFYjXK6O3kDzKv7R
         gEqJBzK4+W6f3M47lmsLMmcYpqy+/1rHTg3t2l5bUxmAWHc9IeYfA5E/kcbmL/Qn1R
         HV4YlM/HUszqAWxV7m2oPEfLyDAvR9n7V3wr2LW4a8SXg1q17V7YtdqyYgKboCF1Om
         XihdJbDySKgED/140xUEDAn+f5ItT0R2jsM2aobM+Hxg0ty6QHGR6UWvBaGQwAv+CS
         9BNnzYRFzu9Qg==
X-Nifty-SrcIP: [133.32.182.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: [PATCH 0/3] Kconfig.debug: make more efforts to fix CONFIG_DEBUG_INFO for Clang+GAS
Date:   Mon,  3 Oct 2022 03:11:04 +0900
Message-Id: <20221002181107.51286-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org




Masahiro Yamada (3):
  Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5
  Kconfig.debug: add toolchain checks for
    DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
  Kconfig.debug: split debug-level and DWARF-version into separate
    choices

 lib/Kconfig.debug | 62 +++++++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 24 deletions(-)

-- 
2.34.1

