Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:37971 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757142Ab2DIOEF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 10:04:05 -0400
Date: Mon, 9 Apr 2012 16:04:00 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] scripts/config: properly report and set string options
Message-ID: <20120409140400.GG17822@one.firstfloor.org>
References: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

On Mon, Apr 09, 2012 at 02:49:10PM +0200, Yann E. MORIN wrote:
> Currently, scripts/config removes the leading double-quote from
> string options, but leaves the trailing double-quote.
> 
> Also, double-quotes in a string are escaped, but scripts/config
> does not unescape those when printing
> 
> Finally, scripts/config does not escape double-quotes when setting
> string options.
> Cc: stable@vger.kernel.org

Looks good. 

Acked-by: Andi Kleen <andi@firstfloor.org>

-Andi
