Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:50209 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754599Ab0F2Nn1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jun 2010 09:43:27 -0400
Message-ID: <4C29F87E.3090308@suse.cz>
Date: Tue, 29 Jun 2010 15:43:26 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: "make gconfig" fails to compile
References: <4C29F6B1.3060205@fastmail.com.au>
In-Reply-To: <4C29F6B1.3060205@fastmail.com.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Allan Duncan <amd2345@fastmail.com.au>
Cc: linux-kbuild@vger.kernel.org

On 29.6.2010 15:35, Allan Duncan wrote:
> The last couple of kernels I've built (2.6.33.5 and 2.6.34) barfed on 
> gconfig.
> I think it is due to an update of fedora's libraries, anyway the file
> scripts/kconfig/Makefile line 201:
> HOSTLOADLIBES_gconf     = `pkg-config --libs gtk+-2.0 gmodule-2.0 
> libglade-2.0`
> needs " -ldl" added to the end, like qconf a few lines above has.

See http://git.kernel.org/linus/cbab05f, it should automatically appear
in the next stable releases.

Michal
