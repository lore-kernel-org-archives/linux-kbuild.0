Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from he.sipsolutions.net ([78.46.109.217]:56042 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752248Ab0DUHJV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 Apr 2010 03:09:21 -0400
Subject: subdir-ccflags problem
From: Johannes Berg <johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Apr 2010 09:09:18 +0200
Message-ID: <1271833758.3627.16.camel@jlt3.sipsolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

When I specify subdir-ccflags in a Makefile, e.g. net/Makefile, but then
build using M=net/wireless/, kbuild doesn't seem to pick it up.

To me, that seems like a bug, but to my untrained eye it would appear to
be quite hard to fix. Thoughts?

johannes

