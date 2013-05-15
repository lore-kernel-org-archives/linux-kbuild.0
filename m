Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:50962 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759010Ab3EOOGE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 May 2013 10:06:04 -0400
Received: from mx10.gouders.net (localhost [127.0.0.1])
	by mx10.gouders.net (8.14.6/8.14.5) with ESMTP id r4FE62hu031998
	for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2013 16:06:02 +0200
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC] mconf: suppress empty submenus
Date: Wed, 15 May 2013 16:05:37 +0200
Message-Id: <1368626738-31911-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


Hello,

I noticed that sometimes it happens that there are empty
submenus, and I tried to see if they can't be suppressed
by mconf (if not explicitely done by the kbuild-language).

Well, I am not sure if someone wants this change and also
if I realized all possible situations and therefore the
patch is not meant to be accepted as is but as a proof-of-concept.

Because of that I implemented the changes as a new function
menu_is_visible_new() and a helper function that walks the whole menu
structure and compares the results of the old and the new function.

I also tried to add coments to the new function which reflect
my understanding but of course might be incomplete or even wrong.

I'd be glad if someone takes the time to test and/or review
the code or comment on the sanity of such a change.

Attached is an example output of the helper function (i.e.
empty dialogs that would be suppressed by the menu_is_visible_new()).

Dirk

------------------------------------------------------------------------
IRQ subsystem is now invisible
Bus devices is now invisible
Texas Instruments shared transport line discipline is now invisible
Microsoft Hyper-V guest support is now invisible
Hardware Spinlock drivers is now invisible
Rpmsg drivers is now invisible
