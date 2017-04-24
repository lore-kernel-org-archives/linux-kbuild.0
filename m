Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34302 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1169021AbdDXLHp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 07:07:45 -0400
Received: by mail-lf0-f47.google.com with SMTP id t144so71766785lff.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2017 04:07:45 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v3 0/2] builddeb updates
Date: Mon, 24 Apr 2017 14:07:39 +0300
Message-Id: <20170424110741.4524-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Trivial builddeb updates, the fastdeb change to be refactored later.

Andrew Donnellan (1):
  builddeb: fix typo

Riku Voipio (1):
  builddeb: Update a few outdated and hardcoded strings

 scripts/package/builddeb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.11.0

