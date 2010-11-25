Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41381 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753377Ab0KYOyE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 25 Nov 2010 09:54:04 -0500
Date: Thu, 25 Nov 2010 15:54:01 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Kconfig: fix single letter command in scripts/config
Message-ID: <20101125145401.GB9418@sepie.suse.cz>
References: <1288955165-10562-1-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288955165-10562-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, erick@openchill.org

On Fri, Nov 05, 2010 at 12:06:05PM +0100, Andi Kleen wrote:
> From: Andi Kleen <ak@linux.intel.com>
> 
> The one letter commands in scripts/config didn't work and always
> printed usage. Fix this here.
> 
> Cc: erick@openchill.org
> Reported-by: erick@openchill.org
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  scripts/config |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied to kbuild-2.6.git#misc, thanks.

Michal
