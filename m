Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:60460 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755158AbbGCL64 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:58:56 -0400
Message-ID: <1435924733.17390.9.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 03 Jul 2015 13:58:53 +0200
In-Reply-To: <5596731F.20309@fau.de>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
		<1435827662.2423.4.camel@tiscali.nl>	<55952723.80801@fau.de>
		<1435839005.2423.28.camel@tiscali.nl>	<55963AD7.3040905@fau.de>
		<1435913987.2423.38.camel@tiscali.nl>	<559655E3.6010400@fau.de>
	 <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
	 <5596731F.20309@fau.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>, Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On vr, 2015-07-03 at 13:33 +0200, Andreas Ruprecht wrote:
> Unfortunately, when I generate the zconf.{hash,lex,tab}.c files on my
> machine, they have some notable differences to the _shipped versions:
> 
> ruprecht@box:linux-next$ diff -u zconf.tab.c zconf.tab.c_shipped
> -  return yyresult;
> +  /* Make sure YYID is used.  */
> +  return YYID (yyresult);

Different version of bison?

> and I can't find any Documentation on how to properly rebuild the
> _shipped files... Does anybody have a hint on that?

One of my many, many pet peeves: patches touching _shipped files like
these should mention the command line that was used. Because now
everyone is expected to figure that out themselves. Bonus points for
mentioning the version of the tool that was used.
 

Paul Bolle
