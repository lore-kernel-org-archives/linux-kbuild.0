Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:34101 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753626AbbE1JLU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:11:20 -0400
Received: by lbcmx3 with SMTP id mx3so23950213lbc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2015 02:11:18 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 0/2] deb-pkg: add source package
Date: Thu, 28 May 2015 12:11:13 +0300
Message-Id: <1432804275-13187-1-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

A bit delayed v2 of debian source package addition. This is against
linux-next which already has needed set_debarch function. Resubmitting
the slipped directory simplification patch.

Riku Voipio (2):
  deb-pkg: simplify directory creation
  deb-pkg: add source package

 scripts/package/Makefile | 11 +++++++---
 scripts/package/builddeb | 52 +++++++++++++++++++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 17 deletions(-)

-- 
2.1.4

