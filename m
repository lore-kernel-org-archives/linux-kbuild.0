Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:52379 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750713AbZAGWFr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2009 17:05:47 -0500
Date: Wed, 7 Jan 2009 23:07:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] [1/3] KBUILD: Add script to manipulate .config files on the command line
Message-ID: <20090107220728.GA9707@uranus.ravnborg.org>
References: <20090103321.351399938@firstfloor.org> <20090107201849.GH4647@uranus.ravnborg.org> <20090107213315.GN496@one.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090107213315.GN496@one.firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 07, 2009 at 10:33:15PM +0100, Andi Kleen wrote:
> > When I try to run the script with no arguments nothing happens!?!
> > 
> > I will merge as is but please followup with a patch so it prints out usage
> > in this situation.
> 
> Here's a patch 
> 
> -Andi
> 
> ---
> 
> Kbuild: print usage with no arguments in scripts/config
> 
> Requested by Sam.
> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>

Thanks,
added and pushes out to kbuild-fixes.git

	Sam
