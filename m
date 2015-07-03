Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:35663 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754877AbbGCI7u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jul 2015 04:59:50 -0400
Message-ID: <1435913987.2423.38.camel@tiscali.nl>
Subject: Re: Kconfig: '+config' valid syntax?
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 03 Jul 2015 10:59:47 +0200
In-Reply-To: <55963AD7.3040905@fau.de>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com>
		 <1435827662.2423.4.camel@tiscali.nl> <55952723.80801@fau.de>
	 <1435839005.2423.28.camel@tiscali.nl> <55963AD7.3040905@fau.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Ruprecht <andreas.ruprecht@fau.de>, Valentin Rothberg <valentinrothberg@gmail.com>
Cc: rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On vr, 2015-07-03 at 09:33 +0200, Andreas Ruprecht wrote:
> I tested the behaviour on yesterday's linux-next, but the commit
> mentioned above will only complain for invalid characters inside the
> PARAM case and not for COMMANDs. So, as an example, if you write
> something like
> 
> config ACPI_REV_OVERRIDE_POSSIBLE
> 	depends on X86 +
> [...]
> 
> Kconfig will complain about the '+'. This, however, does not apply for
> top-level statements like 'config', 'menuconfig', and so on.

Which might explain why this silly mistake went unnoticed. (And, as I
think you implied, it doesn't help that the empty rule we're hitting
here is not commented.)

So the naive solution seems to be to also add the warning to COMMAND's
rule for '.'. A quick test suggest that would work. Am I missing some
obvious downside with that solution?

Thanks,


Paul Bolle
