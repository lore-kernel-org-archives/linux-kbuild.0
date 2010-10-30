Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail403.opentransfer.com ([98.130.1.133]:46301 "HELO
	mail403.opentransfer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751785Ab0J3BYh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Oct 2010 21:24:37 -0400
Message-ID: <942B93F2162249F3B4CE745DAF6FD9E1@PC200810081817>
From: "Yihe Chen" <yihect@juliantec.info>
References: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817> <20101029100707.2a9afc5c.randy.dunlap@oracle.com>
In-Reply-To: <20101029100707.2a9afc5c.randy.dunlap@oracle.com>
Subject: Re: config help
Date: Sat, 30 Oct 2010 09:24:19 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux kbuild list <linux-kbuild@vger.kernel.org>

> On Fri, 29 Oct 2010 20:01:55 +0800 Yihe Chen wrote:
>
>> Where to find information or helping stuff or usage info on those config
>> tools, like conf/gconf etc.
>
>
> Begin with the README file in the top-level directory of the linux source 
> tree.
>
> For menuconfig:  use ?
>
> For nconfig (in recent kernels):  use 1 or <F1>
>
> For gconfig:  click on Help
>
> For xconfig:  click on Help
>
> There is also some help info in Documentation/kbuild/kconfig.txt .
>
/
First, thanks for your reply. I'm reanding scripts/kconfig/Makfile, and 
tacking
notice of some options used with conf tool, like -r -y -n -m -d and -D.

Now I havn't a clear understanding on those meaning. I want to look some 
text notice
about this. Though I could find info from scripts/kconfig/conf.c, I don't 
want to
befoul my fingers by the fucking code currently. 

