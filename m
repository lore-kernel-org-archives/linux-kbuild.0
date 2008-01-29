Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:53917 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751642AbYA2L7S (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2008 06:59:18 -0500
Received: from [99.236.100.208] (helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JJp5s-0000xg-RD
	for linux-kbuild@vger.kernel.org; Tue, 29 Jan 2008 06:57:54 -0500
Date: Tue, 29 Jan 2008 06:58:42 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: support for just "depends" is now gone?
Message-ID: <alpine.LFD.1.00.0801290656450.28120@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  i'm just verifying that the current Kconfig parser no longer has
support for simple "depends" directives, but only "depends on", right?
and the alternative of "requires" is long since gone.

  as long as this is true, i can remove the search for "depends"
directives from my cleanup script.  thanks.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

Home page:                                         http://crashcourse.ca
Fedora Cookbook:    http://crashcourse.ca/wiki/index.php/Fedora_Cookbook
========================================================================
