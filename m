Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud3.xs4all.net ([194.109.24.26]:58632 "EHLO
	lb2-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754761AbbGCKwH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 06:52:07 -0400
Message-ID: <1435920723.2423.63.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 03 Jul 2015 12:52:03 +0200
In-Reply-To: <559655E3.6010400@fau.de>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
			 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>
		 <1435839005.2423.28.camel@tiscali.nl> <55963AD7.3040905@fau.de>
	 <1435913987.2423.38.camel@tiscali.nl> <559655E3.6010400@fau.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On vr, 2015-07-03 at 11:29 +0200, Andreas Ruprecht wrote:
> Well, as I mentioned earlier, with a patch similar to the one below
> this
> warning is also generated three times for every '---' before 'help'.

You're right, that was in your first message. It already slipped my
mind.

> So we would need to add special treatment for '-' also in the command
> case, right? But that doesn't look appealing to me, more like a dirty,
> dirty hack around the actual problem...

It seems so.

Someone ambitious might want to jump in the lex rules and see what can
be done in a clean way. (Perhaps that will start with renaming COMMAND
and PARAM and/or documenting these states.) I think I already
demonstrated that I'm too unfamiliar with lex for it to make sense to
volunteer.

Thanks,


Paul Bolle
