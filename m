Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40537 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752362Ab2GMUkb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jul 2012 16:40:31 -0400
Message-ID: <50008765.30905@suse.cz>
Date: Fri, 13 Jul 2012 22:39:01 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: allow long lines in config file
References: <1341964078-22594-1-git-send-email-cody@linux.vnet.ibm.com> <50001D87.1020708@suse.cz> <50006933.4000004@linux.vnet.ibm.com>
In-Reply-To: <50006933.4000004@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cody <cody@linux.vnet.ibm.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 13.7.2012 20:30, cody napsal(a):
> Do we have any strict standards for what is and is not portable?

We don't. I only checked the existing userspace code and except for
perf, there is no other usage of getline().


> (I'm aware 'getline' was only added to posix ~4 years ago in 2008).

Ah, good to know. Nevetheless, let's stay conservative for some more
time. Thanks for sending the updated patch, btw.

Michal
