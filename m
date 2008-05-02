Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36050 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934183AbYEBUq4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 16:46:56 -0400
Date: Fri, 2 May 2008 22:47:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: kconfig frontend updates
Message-ID: <20080502204729.GA6534@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>

The following patchset implments the following:

o Inputfiles to all*config can be specified with K=
o less chatty oldconfig mode
o Drop useless warnings

This is work-in-progress aimed for next mergewindow.
Posted here mainly to get some feedback and a
bit of review.

Patches follows to lkml + kbuild lists

	Sam
