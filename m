Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35988 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750703AbdAWLkU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Jan 2017 06:40:20 -0500
Received: by mail-lf0-f51.google.com with SMTP id z134so91849437lff.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Jan 2017 03:40:19 -0800 (PST)
From: riku.voipio@linaro.org
Subject: [PATCH 0/3] builddeb updates for 4.11
Date: Mon, 23 Jan 2017 13:40:08 +0200
Message-Id: <20170123114011.4189-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

The listed patches already missed one merge window, so it would
be nice if they can be considered for 4.11

Andrew Donnellan (1):
  builddeb: fix typo

Riku Voipio (2):
  builddeb: Update a few outdated and hardcoded strings
  builddeb: add make fastdeb-pkg target

 scripts/package/Makefile |  7 +++++-
 scripts/package/builddeb | 59 ++++++++++++++++++++++++------------------------
 2 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.11.0

