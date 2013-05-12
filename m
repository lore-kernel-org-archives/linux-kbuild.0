Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:55226 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab3ELTI6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 15:08:58 -0400
Received: by mail-wg0-f49.google.com with SMTP id j13so5477872wgh.28
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 12:08:57 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH 0/2] scripts/config: bug fix and improvement
Date: Sun, 12 May 2013 21:08:50 +0200
Message-Id: <cover.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, andi@firstfloor.org, yann.morin.1998@free.fr

Hi all,

Here are two tiny patches which deal with scripts/config.

The first sets the reported name of the script to be what it was invoked
as - this is of importance for kconfig-frontends package, where the script
is renamed.

The second fixes a bug in the assignement of parameters required by options
-E/-D/-M; those are the options allowing to position a value below another
one.

Clement Chauplannaz (2):
  scripts/config: replace hard-coded script name by a dynamic value
  scripts/config: fix assignment of parameters for short version of
    --*-after options

 scripts/config | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
1.8.3.rc1.44.gb387c77.dirty

