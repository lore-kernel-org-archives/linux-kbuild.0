Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54877 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751377Ab3FWVbl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 23 Jun 2013 17:31:41 -0400
Message-ID: <51C7693B.2050504@suse.cz>
Date: Sun, 23 Jun 2013 23:31:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: Don't run find across mountpoints
References: <51B5F083.1050203@gmail.com>
In-Reply-To: <51B5F083.1050203@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

Hi Gabriel,

sorry for the late feedback.

Dne 10.6.2013 17:28, Gabriel de Perthuis napsal(a):
> Use RCS_FIND_IGNORE in more places.

Can you split it into two parts - one adding the missing RCS_FIND_IGNORE
to some find invocations, and other adding the -xdev option? While the
first change is obvious, I am in two minds abount the -xdev change. Your
original problem was .git in a separate filesystem, which is dealt with
by RCS_FIND_IGNORE. The actual source tree should  reside in a single
filesystem in any sane setup. OTOH, if somebody really wishes to have
part of the source tree under a separate mountpoint, he probably has a
good reason for this.

Thanks,
Michal
