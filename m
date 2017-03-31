Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:32899 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933431AbdCaNJq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 09:09:46 -0400
Received: by mail-lf0-f45.google.com with SMTP id h125so43509825lfe.0
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2017 06:09:44 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v2 0/3] builddeb updates for v4.12
Date: Fri, 31 Mar 2017 16:09:38 +0300
Message-Id: <20170331130941.5250-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Resend of the builddeb script updates that missed v4.11
round.

Changes from v1 series: 

Standards-Version: line is removed instead of updating

Andrew Donnellan (1):
  builddeb: fix typo

Riku Voipio (2):
  builddeb: Update a few outdated and hardcoded strings
  builddeb: add make fastdeb-pkg target

 scripts/package/Makefile |  7 +++++-
 scripts/package/builddeb | 58 +++++++++++++++++++++++-------------------------
 2 files changed, 34 insertions(+), 31 deletions(-)

-- 
2.11.0

