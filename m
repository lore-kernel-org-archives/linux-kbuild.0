Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:49365 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750740Ab0HPL5T (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 07:57:19 -0400
Message-ID: <4C692795.1020907@suse.cz>
Date: Mon, 16 Aug 2010 13:57:09 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC 1/2] kbuild: genericizes package name
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com> <1281934457-4225-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281934457-4225-2-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 16.8.2010 06:54, Arnaud Lacombe napsal(a):
> -	sym = sym_lookup("KERNELVERSION", 0);
> +	sym = sym_lookup("PROJECTVERSION", 0);

The required change to the top-level Makefile is missing. I suggest you
rather replace "KERNELVERSION" with a macro defaulting to
"KERNELVERSION", so that we don't have to change it in the Makefile and
other scripts.

Michal
