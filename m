Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54306 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751014Ab0LNOL3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Dec 2010 09:11:29 -0500
Message-ID: <4D077B0C.2000503@suse.cz>
Date: Tue, 14 Dec 2010 15:11:24 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3] headers_install: check exit status of unifdef
References: <1290552096-28568-1-git-send-email-vapier@gentoo.org> <1290560042-30381-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1290560042-30381-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On 24.11.2010 01:54, Mike Frysinger wrote:
> If unifdef fails for any reason (like segfaulting), we should be aborting
> the install steps.  So check its exit status in this unlikely scenario.
>
> Reported-by: Diego Elio Pettenò<flameeyes@gentoo.org>
> Signed-off-by: Mike Frysinger<vapier@gentoo.org>
> ---
> v3
> 	- fix thinko pointed out by Randy
>
>   scripts/headers_install.pl |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)

Applied to kbuild-2.6#kbuild, thanks.

Michal
