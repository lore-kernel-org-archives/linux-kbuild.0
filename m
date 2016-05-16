Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47645 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751550AbcEPMCb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2016 08:02:31 -0400
Date: Mon, 16 May 2016 14:02:28 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] scripts/package/Makefile: rpmbuild add support of RPMOPTS
Message-ID: <20160516120228.GC2660@sepie.suse.cz>
References: <1463281792-19129-1-git-send-email-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1463281792-19129-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: jim.epost@gmail.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Sat, May 14, 2016 at 08:09:52PM -0700, Srinivas Pandruvada wrote:
> After commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is needed
> for rpm targets"), it is no longer possible to specify RPMOPTS.
> For example, we can no longer able to control _topdir using the following
> make command.
> make RPMOPTS="--define '_topdir /home/xyz/workspace/'" binrpm-pkg
> 
> Fixes: 21a59991ce0c ("scripts/package/Makefile: rpmbuild is needed
> for rpm targets")
> Cc: <stable@vger.kernel.org> # 4.3+
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  scripts/package/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to kbuild.git#misc.

Michal
