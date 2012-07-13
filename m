Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:59849 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755969Ab2GMSaW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jul 2012 14:30:22 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <cody@linux.vnet.ibm.com>;
	Fri, 13 Jul 2012 12:30:21 -0600
Message-ID: <50006933.4000004@linux.vnet.ibm.com>
Date: Fri, 13 Jul 2012 11:30:11 -0700
From: cody <cody@linux.vnet.ibm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: allow long lines in config file
References: <1341964078-22594-1-git-send-email-cody@linux.vnet.ibm.com> <50001D87.1020708@suse.cz>
In-Reply-To: <50001D87.1020708@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Do we have any strict standards for what is and is not portable?

(I'm aware 'getline' was only added to posix ~4 years ago in 2008).

--
Cody

