Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:52090 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751092AbZK0SRq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Nov 2009 13:17:46 -0500
Date: Fri, 27 Nov 2009 19:17:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] unifdef: update to upstream revision 1.189
Message-ID: <20091127181749.GA16177@merkur.ravnborg.org>
References: <E1NE3M6-0003Za-OJ@hermes-1.csi.cam.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1NE3M6-0003Za-OJ@hermes-1.csi.cam.ac.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tony Finch <dot@dotat.at>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Joe Perches <joe@perches.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "Justin P. Mattock" <justinmattock@gmail.com>

Hi Tony.

On Fri, Nov 27, 2009 at 03:50:30PM +0000, Tony Finch wrote:
> Fix handling of input files (e.g. with no newline at EOF) that could
> make unifdef get into an unexpected state and call abort().
> 
> The new -B option compresses blank lines around a deleted section
> so that blank lines around "paragraphs" of code don't get doubled.
> 
> The evaluator can now handle macros with arguments, and unbracketed
> arguments to the "defined" operator.

Can you confirm that this does not regress with respect to the changes
that Russell King implemented in the commit:
eedc9d83eaab2d35fb9dd1ec25b765dec964e26c
("kbuild: fix headers_exports with boolean expression")


I long time ago started a small project to do a dedicated
implementation of unifdef solely for use by the kernel.
Today we do some preprocessing in perl - and then
we pass the result to unifdef file by file.
A dedicated program could do this much faster -
and this would be a bigger incentive for the kernel supplied
tools to actually use the exported headers.

But I never got far with it and I think the code was
lost when I changed computer some time ago.

	Sam
