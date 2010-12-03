Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39808 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754475Ab0LCNcV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Dec 2010 08:32:21 -0500
Message-ID: <4CF8F169.7050008@suse.cz>
Date: Fri, 03 Dec 2010 14:32:25 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: scripted kconfig replies?
References: <20101121204600.83bfd043.rdunlap@xenotime.net>
In-Reply-To: <20101121204600.83bfd043.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On 22.11.2010 05:46, Randy Dunlap wrote:
> Hi,
> 
> I'd like to be able to write a script that handles 'make oldconfig'
> queries for unknown kconfig symbols.  The script would take options
> like:  set all tristate prompts to one of y/m/n, set all boolean prompts
> to one of y/n.  (and just use defaults for numeric or string symbols)
> 
> This would allow me to automate some kernel configs.  I don't think
> that kconfig itself is the right place for this feature.
> 
> Should this be doable?  Can anyone give me a pointer of what to use,
> where to begin?

You can utilize KCONFIG_ALLCONFIG for this:
$ mv .config config-old
$ KCONFIG_ALLCONFIG make all<yes|mod|no|rand>config

The file pointed to by KCONFIG_ALLCONFIG lists options that you wish to
be set to a given value, see Documentation/kbuild/kconfig.txt.

Michal
