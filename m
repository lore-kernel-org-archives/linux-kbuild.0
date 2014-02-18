Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:38331 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755711AbaBROZL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:25:11 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: Single pass kallsyms v3
Date: Tue, 18 Feb 2014 15:24:24 +0100
Message-Id: <1392733470-8228-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org

Updated patchkit to enable single-pass kallsyms. This avoids
linking multiple times. Needed for the link time optimization
patchkit, but also useful on its own to get faster builds.

This version addresses Sam's review comments.

-Andi

