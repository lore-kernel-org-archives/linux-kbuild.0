Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:52450 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbaHSULf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 16:11:35 -0400
Date: Tue, 19 Aug 2014 22:11:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Overriding -Werror
Message-ID: <20140819201129.GA24217@ravnborg.org>
References: <20140814222119.GD18411@ld-irv-0074>
 <87ppfwmxic.fsf@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ppfwmxic.fsf@tassilo.jf.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Linux Kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Artem Bityutskiy <dedekind1@gmail.com>

On Tue, Aug 19, 2014 at 06:15:07AM -0700, Andi Kleen wrote:
> Brian Norris <computersforpeace@gmail.com> writes:
> >
> > 4. better ideas?
> 
> Just send patches to remove -Werror in all architectures
> as a tree sweep (and anywhere else where someone misguided add it)
In arch/sparc/ we have -Werror and this has never troubled us.
In fact more than once people had tried to provide sloppy code that
failed due to -Werror so it got fixed up front.

	Sam
