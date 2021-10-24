Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3C0C4332F
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Oct 2021 14:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 940E360F12
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Oct 2021 14:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhJXOLL (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Oct 2021 10:11:11 -0400
Received: from bbox.sascha.silbe.org ([46.38.230.149]:60295 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhJXOLK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Oct 2021 10:11:10 -0400
Received: from brick.sascha.silbe.org (brick.sascha.silbe.org [192.168.1.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "brick.sascha.silbe.org", Issuer "stunnel Pseudo-CA" (verified OK))
        by bbox.sascha.silbe.org (Postfix) with ESMTPS id 0FE0160A0A;
        Sun, 24 Oct 2021 16:00:17 +0200 (CEST)
Received: (nullmailer pid 647838 invoked by uid 71000);
        Sun, 24 Oct 2021 14:00:16 -0000
From:   Sascha Silbe <x-linux@se-silbe.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] kbuild: deb-pkg: fixes for use on Debian systems
Date:   Sun, 24 Oct 2021 15:58:36 +0200
Message-Id: <20211024135838.647689-1-x-linux@se-silbe.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building binary .deb packages directly from a source tree using
"make deb-pkg" or "make bindeb-pkg", they don't work as well as the
vendor-provided (i.e. Debian) kernel packages because some
dependencies and integrations are missing. This series fixes some of
the shortcomings so the locally built packages can be used in place of
the vendor-provided ones.

Sascha Silbe (2):
  kbuild: deb-pkg: set dependencies for kernel image package
  kbuild: deb-pkg: invoke linux-base scripts if installed

 scripts/package/builddeb | 22 ++++++++++++++++++++++
 scripts/package/mkdebian |  9 +++++++++
 2 files changed, 31 insertions(+)


base-commit: 9c0c4d24ac000e52d55348961d3a3ba42065e0cf
prerequisite-patch-id: d2d09cbe2907cd6c1ece0fcc6b576faf1ef8dd37
-- 
2.30.2

