Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:55631 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755651AbYBRKfR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 05:35:17 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JR3L9-0007Ms-Lb
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 05:35:15 -0500
Date: Mon, 18 Feb 2008 05:35:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: "make distclean" tries to clean the source tree, not the output
 tree
Message-ID: <alpine.LFD.1.00.0802180534001.31257@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  this doesn't seem right:

distclean: mrproper
        @find $(srctree) $(RCS_FIND_IGNORE) \
                \( -name '*.orig' -o -name '*.rej' -o -name '*~' \
                ...

doesn't that mean that "make distclean" will invariably try to clean
the source tree, even if you've specified "O="?  it certainly seems
that way.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
