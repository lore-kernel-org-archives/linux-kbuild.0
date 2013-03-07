Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49007 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754202Ab3CGI0M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Mar 2013 03:26:12 -0500
Message-ID: <51384F21.9070800@suse.cz>
Date: Thu, 07 Mar 2013 09:26:09 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: make headers_install fail when path is too long
References: <51372591.1090606@6wind.com> <20130306161026.GA13449@merkur.ravnborg.org> <51376E6C.4040903@6wind.com>
In-Reply-To: <51376E6C.4040903@6wind.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: nicolas.dichtel@6wind.com, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

Dne 6.3.2013 17:27, Nicolas Dichtel napsal(a):
> -        $(PERL) $< $(installdir) $(SRCARCH) $(input-files); \
[...]
> +    @echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files

Are you sure this is a reliable fix? What make does is to spawn

/bin/sh -c 'echo <long list of files> > usr/include/.input-files'

here. So I guess that it works for you just because "sh -c" is shorter
than "sh -c 'perl scripts/headers_install.pl...'".

Michal
