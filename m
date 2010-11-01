Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:32713 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751931Ab0KAR2M (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Nov 2010 13:28:12 -0400
Message-ID: <4CCEEB74.9010809@oracle.com>
Date: Mon, 01 Nov 2010 09:31:48 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: config help
References: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817> <20101029100707.2a9afc5c.randy.dunlap@oracle.com> <942B93F2162249F3B4CE745DAF6FD9E1@PC200810081817>
In-Reply-To: <942B93F2162249F3B4CE745DAF6FD9E1@PC200810081817>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yihe Chen <yihect@juliantec.info>
Cc: linux kbuild list <linux-kbuild@vger.kernel.org>

On 10/29/10 18:24, Yihe Chen wrote:
>> On Fri, 29 Oct 2010 20:01:55 +0800 Yihe Chen wrote:
>>
>>> Where to find information or helping stuff or usage info on those config
>>> tools, like conf/gconf etc.
>>
>>
>> Begin with the README file in the top-level directory of the linux
>> source tree.
>>
>> For menuconfig:  use ?
>>
>> For nconfig (in recent kernels):  use 1 or <F1>
>>
>> For gconfig:  click on Help
>>
>> For xconfig:  click on Help
>>
>> There is also some help info in Documentation/kbuild/kconfig.txt .
>>
> /
> First, thanks for your reply. I'm reanding scripts/kconfig/Makfile, and
> tacking
> notice of some options used with conf tool, like -r -y -n -m -d and -D.

What kernel version are you looking at?  Something before 2.6.36 ?
I ask that because in 2.6.36 and later, the config command line tool only
uses long option strings (like --oldconfig), not short option strings
(like -o).

Anyway, in 2.6.35, scripts/kconfig/Makefile is fairly clear on those
short option strings:

-o	oldconfig
-s	silentoldconfig
-r	randconfig
-y	allyesconfig
-n	allnoconfig
-m	allmodconfig
-d	defconfig
-D filename	use filename as default configuration

> Now I havn't a clear understanding on those meaning. I want to look some
> text notice
> about this. Though I could find info from scripts/kconfig/conf.c, I
> don't want to
> befoul my fingers by the fucking code currently.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
