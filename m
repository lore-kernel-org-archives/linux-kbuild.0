Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:60550 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752839Ab1BFP5m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Feb 2011 10:57:42 -0500
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Sun, 6 Feb 2011 07:57:35 -0800
Date: Sun, 6 Feb 2011 07:57:34 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Why is linux-kbuild/doc dropping some of my mails?
Message-Id: <20110206075734.e912fe70.rdunlap@xenotime.net>
In-Reply-To: <20110206154831.GA12296@ulf>
References: <20110206154831.GA12296@ulf>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org

On Sun, 6 Feb 2011 16:48:32 +0100 Ulf Magnusson wrote:

> linux-kbuild and linux-doc dropped both of my Kconfiglib patches, while
> linux-kernel accepted them:
> https://lkml.org/lkml/2011/2/1/439 (initial)
> https://lkml.org/lkml/2011/2/5/174 (version 2)
> 
> Any idea why? Looked over SubmittingPatches but couldn't find anything
> obvious.

AFAIK, lkml has a message size limit of 300 KB or 400 KB, while
kbuild and doc have a limit of (probably) 100 KB.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
