Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34379 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756748AbbJHMVy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Oct 2015 08:21:54 -0400
Date: Thu, 8 Oct 2015 14:21:51 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2] kselftest: add kselftest-clean rule
Message-ID: <20151008122150.GA12217@sepie.suse.cz>
References: <560E9242.9000402@osg.samsung.com>
 <1444272078-7087-1-git-send-email-long.wanglong@huawei.com>
 <1444276324.9940.6.camel@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444276324.9940.6.camel@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Wang Long <long.wanglong@huawei.com>, shuahkh@osg.samsung.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com

On Thu, Oct 08, 2015 at 02:52:04PM +1100, Michael Ellerman wrote:
> On Thu, 2015-10-08 at 02:41 +0000, Wang Long wrote:
> > We use
> > 
> >     $make TARGETS="size timers" kselftest
> > 
> > to build and run selftests. but there is no rule
> > for us to clean the kselftest generated files.
> > 
> > This patch add the rules, for example:
> > 
> > 	$ make TARGETS="size timers" kselftest-clean
> > 
> > can clean all kselftest generated files.
> > 
> > Signed-off-by: Wang Long <long.wanglong@huawei.com>
> > ---
> >  Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Thanks that's much neater.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to kbuild.git#kbuild.

Michal
