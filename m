Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:56116 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752367AbYCNSVR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2008 14:21:17 -0400
Received: from midway.site ([71.117.215.127]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 14 Mar 2008 11:21:13 -0700
Date: Fri, 14 Mar 2008 11:21:12 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: kconfig bug - select vs. depends
Message-Id: <20080314112112.c00cbcdd.rdunlap@xenotime.net>
In-Reply-To: <20080314175501.GA11107@wavehammer.waldi.eu.org>
References: <20080314175501.GA11107@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bastian Blank <bastian@waldi.eu.org>
Cc: linux-kbuild@vger.kernel.org

On Fri, 14 Mar 2008 18:55:01 +0100 Bastian Blank wrote:

> Hi folks
> 
> I work on the s390 kernel, linus/linux2.6.git, and found something which
> looks buggy. The kernel have HWMON enabled even if the dependencies does
> not allow it.
> 
> Dependency structure:
> | menuconfig THERMAL
> |         bool "Generic Thermal sysfs driver"
> |         select HWMON
> |         default y
> | 
> | menuconfig HWMON
> |         tristate "Hardware Monitoring support"
> |         depends on HAS_IOMEM
> |         default y
> | 
> | config HAS_IOMEM
> |         boolean
> |         depends on !NO_IOMEM
> |         default y
> | 
> | config NO_IOMEM
> |         def_bool y
> 
> HWMON should never be selectable in this case, but the select forces it
> to yes:
> | Hardware Monitoring support (HWMON) [Y/?] (NEW) y

Yes, that's a known & longstanding problem (that select does not
follow/honor dependencies).

BTW, why does THERMAL default to y?


---
~Randy
