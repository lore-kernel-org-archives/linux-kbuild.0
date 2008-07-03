Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:45809 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072AbYGCXoP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jul 2008 19:44:15 -0400
Date: Thu, 3 Jul 2008 16:43:52 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: xconfig fonts
Message-Id: <20080703164352.1d796002.randy.dunlap@oracle.com>
In-Reply-To: <20080703160225.93f1979e.rdunlap@xenotime.net>
References: <20080703160225.93f1979e.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On Thu, 3 Jul 2008 16:02:25 -0700 Randy Dunlap wrote:

> The font size in xconfig is too small for my eyes.  :(
> 
> Can anyone tell me how I can change/increase the xconfig font size?

Edit ~/.qt/qtrc.  Change the
font=
line.  WorksForMe.


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
