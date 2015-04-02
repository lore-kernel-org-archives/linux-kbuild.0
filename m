Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:34049 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbDBL1t (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 07:27:49 -0400
Received: by lagg8 with SMTP id g8so57828715lag.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 04:27:47 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 0/4] builddeb improvements
Date: Thu,  2 Apr 2015 14:27:26 +0300
Message-Id: <cover.1427968988.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

A collection of patches to improve the make deb-pkg target
first three patches should be quite straight-forward changes,
but the last one is more complicated. 

Ben Hutchings (1):
  deb-pkg: Add automatic support for armhf architecture

Riku Voipio (3):
  builddeb: install dtbs
  builddeb: simplify directory creation
  RFC: builddeb: add linux-tools package with perf

 scripts/package/builddeb | 67 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 17 deletions(-)

-- 
2.1.4

