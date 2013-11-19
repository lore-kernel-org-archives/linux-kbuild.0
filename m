Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:41373 "EHLO
	e28smtp01.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652Ab3KSH1O (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 02:27:14 -0500
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <maddy@linux.vnet.ibm.com>;
	Tue, 19 Nov 2013 12:57:12 +0530
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
	by d28dlp02.in.ibm.com (Postfix) with ESMTP id CA7AF394005B
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2013 12:57:09 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
	by d28relay01.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id rAJ7R5q149021108
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2013 12:57:05 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
	by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id rAJ7R8Gc032459
	for <linux-kbuild@vger.kernel.org>; Tue, 19 Nov 2013 12:57:08 +0530
Message-ID: <528B12CB.60407@linux.vnet.ibm.com>
Date: Tue, 19 Nov 2013 12:57:07 +0530
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: add comment about 'jump maybe used unitialized'
References: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1384808595-26028-1-git-send-email-yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org
Cc: Christian Kujau <lists@nerdbynature.de>, Benjamin Poirier <bpoirier@suse.de>

On Tuesday 19 November 2013 02:33 AM, Yann E. MORIN wrote:
> 
> Madhavan, Christian, if you could give a bit ;ore details on the distro
> you're using, that be nice so we can have a more descriptive commit log.

When I initially reported this issue, it was in gcc version 4.8.0
20130526. And I am trying this now in a beta release of RHEL7 with gcc
version 4.8.1 20131002 (Red Hat 4.8.1-11) (GCC) and I still see the
reported issue.

--Maddy


