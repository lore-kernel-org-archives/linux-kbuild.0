Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:50930 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932925AbcDYQD3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:03:29 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 0/2] moves samples out of Documentation directory
Date: Mon, 25 Apr 2016 18:03:07 +0200
Message-Id: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

As suggested by Nicolas Pitre, here is a resend of two patches to
move the kernel modules from Documentation/*/ to samples/*/.

With Nico's changes in place, it's no longer necessary to do this,
but it seems like a good idea anyway for consistency.
Not sure who would be the best person to pick up the patches, I'd
probably either the Documentation or the kbuild maintainers.

	Arnd

[PATCH v2 1/2] samples: connector: from Documentation to samples
[PATCH v2 2/2] samples: v4l: from Documentation to samples directory
