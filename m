Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:57481 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751945AbYBRMHX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 07:07:23 -0500
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JR4mI-0001hy-2z
	for linux-kbuild@vger.kernel.org; Mon, 18 Feb 2008 07:07:22 -0500
Date: Mon, 18 Feb 2008 07:07:17 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: add "lost+found" to list of (RCS_FIND_IGNORE?) search dirs?
Message-ID: <alpine.LFD.1.00.0802180702440.14259@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  as an experiment, i created a small logical volume just for my
kernel git checkout and mounted it read-only to verify that any
"make"s that incorporate "O=" didn't try to modify anything within the
tree.

  a side effect was to notice that doing any kind of cleaning failed
to enter the non-enterable "lost+found" directory found at the top of
any filesystem.

  not fatal, of course, but perhaps lost+found can be added to the
list of directories to avoid during any search.

rday

p.s.  perhaps a cleaner solution would be to use, as the argument to
find, not ".", but an explicit list of directories for which it makes
sense to search.

  if that were the case, you could avoid doing any processing on any
top-level directories that couldn't possibly need any cleaning, such
as include/.  personally, i think that's a better solution, but that's
just me.

--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
