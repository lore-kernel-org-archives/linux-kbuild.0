Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:44688 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755113AbbGCLAw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 07:00:52 -0400
Message-ID: <1435921249.2423.70.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 03 Jul 2015 13:00:49 +0200
In-Reply-To: <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
	 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>
	 <1435839005.2423.28.camel@tiscali.nl> <55963AD7.3040905@fau.de>
	 <1435913987.2423.38.camel@tiscali.nl> <559655E3.6010400@fau.de>
	 <CAEMqcmoTHxOGRdRFMrY=kkG4HzD7vNUHVwZCsGDabGUOxhsvOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Andreas Ruprecht <andreas.ruprecht@fau.de>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On vr, 2015-07-03 at 12:46 +0200, Ulf Magnusson wrote:
> Except for scattered accidents like in the original message, which are
> hopefully pretty rare and easy to fix,

Correct.

>  the only documented thing that depends
> on that lexer sloppiness is the ---help--- "token".
> 
> I'd just add "---help---" as another T_HELP alias

Which implies dropping the empty rule for "---", right?

>  (or get rid of it altogether,
> but that's probably more work than it's worth).

    $git grep -e "---help---" -- "*Kconfig*" | wc -l
    2590

Doable. Might not make you friends.

>  Tightening things up should be safe after that.

Did you already try adding ---help--- (and something similar to Andreas'
check for the mistake we're discussing here)?


Paul Bolle
