Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out3.tiscali.nl ([195.241.79.178]:38296 "EHLO
	smtp-out3.tiscali.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752343Ab1JJUTt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Oct 2011 16:19:49 -0400
Received: from [212.123.169.34] (helo=[192.168.1.101])
	by smtp-out3.tiscali.nl with esmtp (Exim)
	(envelope-from <pebolle@tiscali.nl>)
	id 1RDM3e-0006gp-7Q
	for linux-kbuild@vger.kernel.org; Mon, 10 Oct 2011 22:02:42 +0200
Subject: Kconfig: single-config-entry choice groups
From: Paul Bolle <pebolle@tiscali.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Oct 2011 22:02:41 +0200
Message-ID: <1318276961.18122.30.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

0) There seem to be about two dozen single-config-entry choice groups in
Kconfig files across the tree: choice groups that let one set exactly
one CONFIG option. (Most of the time hat CONFIG option is also the
choice group's default. That doesn't seem to matter, though. The default
could as well be some bogus symbol.)

1) These choice groups are not optional, so there's nothing to actually
choose. As far as I can see that single CONFIG option will always be
set.

2) Are single-config-entry choice groups some special, but undocumented,
idiom? Or are they perhaps the result of editing (ie, some of their
config entries where removed until there was just one left)? Or
something else?


Paul Bolle

