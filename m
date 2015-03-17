Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:51769 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932265AbbCQW6m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 18:58:42 -0400
Message-ID: <1426633120.15575.17.camel@x220>
Subject: Re: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to
 force all cc warnings to errors
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 17 Mar 2015 23:58:40 +0100
In-Reply-To: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com>
References: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Tue, 2015-03-17 at 15:37 -0700, Jonathan Toppins wrote:
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> +config DEBUG_FORCE_CC_WARNINGS_TO_ERRORS
> +	bool "Force cc warnings to errors"
> +	default y

No way.

> +	help
> +	  Simply enables the gcc compiler option -Werror for the entire
> +	  build. If a compilation unit cannot handle -Werror by fixing the
> +	  warning then that unit must suppress the cc warning using
> +	  cc-disable-warning for that compilation unit in the unit's makefile.
> +	  .

(Why the dot?)

> +	  This option is intended to be more in the developer's face and
> +	  encourage effort of some kind to remove the compilation warning.
> +	  .

(Dot?)

> +	  If unsure say y.

Again, no way.

> +
>  endmenu # "Compiler options"
>  
>  config MAGIC_SYSRQ

Feel free to fix as many build warning as you can. I'd really appreciate
that. But my x86_64 build of v4.0-rc4 is _almost_ warning free. And
that's nice. And I find -Werror (and littering Makefiles with
cc-disable-warning) just to remove the few warnings I still see plain
silly. I'm sure the same holds for other people and their builds too. 

(This can be summarized as: NAK.)


Paul Bolle

