Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:10900 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751838AbaBNVRy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:17:54 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: Updated single-pass kallsyms patchkit for LTO
Date: Fri, 14 Feb 2014 22:17:03 +0100
Message-Id: <1392412629-25666-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

Mostly fix the padding code build error Markus found.

The single pass code generally improves build performance,
even without LTO.

