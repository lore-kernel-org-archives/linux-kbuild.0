Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:42363 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754040Ab0LPV0Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Dec 2010 16:26:16 -0500
Date: Thu, 16 Dec 2010 22:26:14 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] fix undesirable side effect of adding "visible" menu
	attribute
Message-ID: <20101216212614.GD21436@pobox.suse.cz>
References: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4D009D4A0200007800026DDB@vpn.id2.novell.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>, mchehab@redhat.com

On Thu, Dec 09, 2010 at 08:11:38AM +0000, Jan Beulich wrote:
> This lead to non-selected, non-user-selectable options to be written
> out to .config. This is not only pointless, but also preventing the
> user to be prompted should any of those options eventually become
> visible (e.g. by de-selecting the *_AUTO options the "visible"
> attribute was added for.
> 
> Furthermore it is quite logical for the "visible" attribute of a menu
> to control the visibility of all contained prompts, which is what the
> patch does.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>

It also fixes the issue that all{mod,yes}config set some options from
the invisible menus that cannot be selected interactively (e.g.
I2C_ALGOPCF, that is only selected by I2C_ELEKTOR on !SMP), so this
patch is

Acked-by: Michal Marek <mmarek@suse.cz>

unless Arnaud has a good reason not to take it.

Michal
