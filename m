Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:6596 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753226AbaBNVWc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:22:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: Updated Link-Time-Optimization patchkit
Date: Fri, 14 Feb 2014 22:21:24 +0100
Message-Id: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

This is the updated LTO patchkit for 3.14-rc2.  LTO allows
the compiler to do global optimization over the whole kernel.

All problems/comments reported last week have been addressed, plus
a lot of improvements to the documentation and the Kconfig description.
Plus some random improvements.

See the individual patches for a detailed description

Dependencies: asmlinkage patchkit (posted last week), kallsyms patchkit

Full git tree is in
git://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc lto-3.14

-Andi

