Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53345 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755840AbcFTPym (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jun 2016 11:54:42 -0400
Date: Mon, 20 Jun 2016 17:38:45 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: setlocalversion: print error to STDERR
Message-ID: <20160620153845.GA11949@sepie.suse.cz>
References: <1465239638-20314-1-git-send-email-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465239638-20314-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 06, 2016 at 09:00:38PM +0200, Wolfram Sang wrote:
> I tried to use 'make O=...' from an unclean source tree. This triggered
> the error path of setlocalversion. But by printing to STDOUT, it created
> a broken localversion which then caused another (unrelated) error:
> 
> "4.7.0-rc2Error: kernelrelease not valid - run make prepare to update it" exceeds 64 characters
> 
> After printing to STDERR, the true build error gets displayed later:
> 
>   /home/wsa/Kernel/linux is not clean, please run 'make mrproper'
>   in the '/home/wsa/Kernel/linux' directory.
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
> ---
>  scripts/setlocalversion | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to kbuild.git#kbuild. But this points at another
problem, namely that filechk is ignoring the exit status of the command.

Michal
