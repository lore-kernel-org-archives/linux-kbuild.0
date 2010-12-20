Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58851 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753843Ab0LTOcQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 09:32:16 -0500
Message-ID: <4D0F68EF.8080801@suse.cz>
Date: Mon, 20 Dec 2010 15:32:15 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCHv3] Kbuild: kconfig: Verbose version of --listnewconfig
References: <1291596649.8025.104.camel@localhost>
In-Reply-To: <1291596649.8025.104.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Roman Zippel <zippel@linux-m68k.org>, Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

On 6.12.2010 01:50, Ben Hutchings wrote:
> If the KCONFIG_VERBOSE environment variable is set, show the default
> values of new symbols and not just their names.
> 
> Based on work by Bastian Blank <waldi@debian.org> and
> maximilian attems <max@stro.at>.  Simplified by Michal Marek
> <mmarek@suse.cz>.
> 
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> I believe this incorporates all the comments made on v2.

Thanks, applied to kbuild-2.6.git#kconfig.

Michal
