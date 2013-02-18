Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:64319 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754047Ab3BRDIi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Feb 2013 22:08:38 -0500
Received: by mail-pa0-f42.google.com with SMTP id kq12so2609839pab.15
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Feb 2013 19:08:38 -0800 (PST)
Date: Mon, 18 Feb 2013 11:08:29 +0800
From: Adam Lee <adam8157@gmail.com>
Subject: Re: [PATCH] kconfig: fix the failure of `make rpm-pkg` after
 localversion file changed
Message-ID: <20130218030829.GA6690@adam-laptop>
References: <1352014361-21159-1-git-send-email-adam8157@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1352014361-21159-1-git-send-email-adam8157@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Sun, Nov 04, 2012 at 03:32:41PM +0800, Adam Lee wrote:
> `make rpm-pkg` and `make binrpm-pkg` will write $KERNELRELEASE into rpm
> spec files which don't depend on localversion file now. So, the
> unchanged spec files will cause failure after localversion file changed.
> 
> I added the localversion file into the dependencies of spec files.
> Because that file is not necessary, I made it a empty target, so its
> last-modification time will be checked by Make only when it exists.
> 
> Signed-off-by: Adam Lee <adam8157@gmail.com>
> ---
>  scripts/package/Makefile |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Hi, Michal

Any comment about my fix?

reproduce steps:
1, make rpm-pkg
2, change localversion
3, make rpm-pkg

-- 
Regards,
Adam Lee
http://adam8157.info
