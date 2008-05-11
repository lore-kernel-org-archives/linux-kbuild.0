Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:47283 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751611AbYEKILV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 May 2008 04:11:21 -0400
Date: Sun, 11 May 2008 10:11:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Disable modpost warnings for linkonce sections
Message-ID: <20080511081156.GA25696@uranus.ravnborg.org>
References: <20080508114111.GA20671@basil.nowhere.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080508114111.GA20671@basil.nowhere.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, May 08, 2008 at 01:41:11PM +0200, Andi Kleen wrote:
> Disable modpost warnings for linkonce sections
> 
> My build gives lots of warnings like
> 
> WARNING: sound/core/snd.o (.gnu.linkonce.wi.mpspec_def.h.30779716): unexpected section name.
> The (.[number]+) following section name are ld generated and not expected.
> Did you forget to use "ax"/"aw" in a .S file?
> Note that for example <linux/init.h> contains
> section definitions for use in .S files.
> 
> But for .linkonce. duplicated sections are actually ok and expected.
> So just disable the warning for this case.

Agreed.
Applied and pushed out.

	Sam
