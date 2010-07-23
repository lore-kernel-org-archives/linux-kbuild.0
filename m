Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueueb.post.tele.dk ([193.162.153.10]:60454 "EHLO
	pqueueb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751383Ab0GWVMA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Jul 2010 17:12:00 -0400
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueueb.post.tele.dk (Postfix) with ESMTP id 510D283E9
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jul 2010 23:11:59 +0200 (CEST)
Date: Fri, 23 Jul 2010 23:11:38 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: make randconfig fair for booleans
Message-ID: <20100723211138.GA27379@merkur.ravnborg.org>
References: <1279801497-810-1-git-send-email-jacmet@sunsite.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1279801497-810-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Korsgaard <jacmet@sunsite.dk>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, zippel@linux-m68k.org

On Thu, Jul 22, 2010 at 02:24:57PM +0200, Peter Korsgaard wrote:
> Give boolean symbols a 50% chance of getting enabled, rather than 67%.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Good catch!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

Michal - I assume you apply this for next merge window.

	Sam
