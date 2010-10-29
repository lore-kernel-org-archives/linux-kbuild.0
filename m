Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:41891 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932458Ab0J2RIo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Oct 2010 13:08:44 -0400
Date: Fri, 29 Oct 2010 10:07:07 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: config help
Message-Id: <20101029100707.2a9afc5c.randy.dunlap@oracle.com>
In-Reply-To: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817>
References: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yihe Chen <yihect@juliantec.info>
Cc: linux kbuild list <linux-kbuild@vger.kernel.org>

On Fri, 29 Oct 2010 20:01:55 +0800 Yihe Chen wrote:

> Where to find information or helping stuff or usage info on those config 
> tools, like conf/gconf etc. 


Begin with the README file in the top-level directory of the linux source tree.

For menuconfig:  use ?

For nconfig (in recent kernels):  use 1 or <F1>

For gconfig:  click on Help

For xconfig:  click on Help

There is also some help info in Documentation/kbuild/kconfig.txt .

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
