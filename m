Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:38492 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423383AbdDUVkt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 17:40:49 -0400
Received: by mail-it0-f43.google.com with SMTP id e132so1324990ite.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 14:40:49 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 0/2] kbuild: clang: Disable spurious warnings
Date: Fri, 21 Apr 2017 14:39:29 -0700
Message-Id: <20170421213931.155210-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Matthias Kaehlcke <mka@chromium.org>

Disable two clang warnings that generate a lot of noise.

Matthias Kaehlcke (2):
  kbuild: clang: Disable 'address-of-packed-member' warning
  kbuild: clang: Disable the 'duplicate-decl-specifier' warning

 Makefile | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.12.2.816.g2cccc81164-goog

