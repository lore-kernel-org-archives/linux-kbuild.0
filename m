Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45658 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755587AbbJ1KHw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 06:07:52 -0400
Subject: Re: doesn't fix for paranoid umask while 'make deb-pkg'
References: <20151027165527.GO7844@onerussian.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56309E75.4070107@suse.cz>
Date: Wed, 28 Oct 2015 11:07:49 +0100
MIME-Version: 1.0
In-Reply-To: <20151027165527.GO7844@onerussian.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yaroslav Halchenko <yoh@onerussian.com>
Cc: linux-kbuild@vger.kernel.org

Dne 27.10.2015 v 17:55 Yaroslav Halchenko napsal(a):
> $> ls -l /usr/include/linux/ | head                          
> total 3424                         
> -rw------- 1 root root   7319 Oct 27 11:20 a.out.h
> -rw------- 1 root root   3670 Oct 27 11:20 acct.h
> -rw------- 1 root root   1077 Oct 27 11:20 adb.h
> -rw------- 1 root root    873 Oct 27 11:20 adfs_fs.h
> -rw------- 1 root root   1481 Oct 27 11:20 affs_hardblocks.h
> -rw------- 1 root root   3920 Oct 27 11:20 agpgart.h
> ...
> 
> So I guess there should be somewhere explicit chmod'ing.  My umask is
> 077.

Well, you set umask 077, so nobody will be able to steal your precious
headers...

Michal

