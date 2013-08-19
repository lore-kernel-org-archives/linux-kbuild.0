Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50089 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750827Ab3HSUkQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Aug 2013 16:40:16 -0400
Message-ID: <521282AC.90003@suse.cz>
Date: Mon, 19 Aug 2013 22:40:12 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] diffconfig: Gracefully exit if the default config
 files are not present
References: <20130816184056.GA30565@woodpecker.gentoo.org>
In-Reply-To: <20130816184056.GA30565@woodpecker.gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Dne 16.8.2013 20:40, Mike Pagano napsal(a):
> Handle gracefully the instance where config files are not present.
> Compatible with python versions 2.5, 2.6 and 2.7.
> The try/except is forward compatible with python version 3 once the entire script is ported.
> 
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  scripts/diffconfig | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied to kbuild.git#kconfig, thanks.

Michal
