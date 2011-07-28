Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:63427 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620Ab1G1Myi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 08:54:38 -0400
From: David Howells <dhowells@redhat.com>
Subject: 'make distclean' silently removes empty files
Date: Thu, 28 Jul 2011 13:54:23 +0100
Message-ID: <25697.1311857663@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: dhowells@redhat.com, arnd@arndb.de, linux-kbuild@vger.kernel.org


Hi,

Can 'make distclean' please be altered to _not_ silently remove empty files,
especially ones that are checked into GIT and/or are mentioned in Makefiles as
being compilable.  By all means flag them as requiring removal, remove them
noisily or give an error.

A case in point is:

	arch/arm/mach-zynq/board_dt.c

which is an empty file checked into GIT.

Thanks,
David
