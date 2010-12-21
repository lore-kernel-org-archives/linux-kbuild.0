Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43105 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874Ab0LURTN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Dec 2010 12:19:13 -0500
Date: Tue, 21 Dec 2010 18:19:11 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] Documentation/kbuild: add info that 'choice' can have a
 symbol name
Message-ID: <20101221171902.GA15604@sepie.suse.cz>
References: <1292455140-5869-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <201012190000.14206.yann.morin.1998@anciens.enib.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201012190000.14206.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Arnaud Lacombe <lacombar@gmail.com>

On Sun, Dec 19, 2010 at 12:00:14AM +0100, Yann E. MORIN wrote:
> On Thursday 16 December 2010 00:19:00 Yann E. MORIN wrote:
> > Changeset 5a1aa8a1 added the possibility to name a choice,
> > and to have the same choice be defined multiple times.
> > But the documentation was forgotten, so this updates it accordingly.
> 
> Ping? Any comment?

Applied to kbuild-2.6.git#misc, thanks for your patience.

Michal
