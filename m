Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42382 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753075AbaJGI45 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Oct 2014 04:56:57 -0400
Message-ID: <5433AAD5.8080108@suse.cz>
Date: Tue, 07 Oct 2014 10:56:53 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: remove obsolete -isp option to dpkg-gencontrol
References: <1412530998-31193-1-git-send-email-asbjorn@asbjorn.biz>
In-Reply-To: <1412530998-31193-1-git-send-email-asbjorn@asbjorn.biz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014-10-05 19:43, Asbjoern Sloth Toennesen wrote:
> The -isp option has been deprecated, after it became the default
> behaviour back in 2006.
> 
> Since dpkg 1.17.11, dpkg-gencontrol emits a warning on -isp usage.
> 
> References: https://bugs.debian.org/215233
> Signed-off-by: Asbjoern Sloth Toennesen <asbjorn@asbjorn.biz>

Applied to kbuild.git#misc, thanks.

Michal

