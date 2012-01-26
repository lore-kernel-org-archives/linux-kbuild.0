Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:56410 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab2AZJ0F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Jan 2012 04:26:05 -0500
Date: Thu, 26 Jan 2012 10:26:03 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] kconfig: fix new choices being skipped upon config update
Message-ID: <20120126092603.GQ6305@pengutronix.de>
References: <20120120164036.GO4066@pengutronix.de>
 <1327357745-9095-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1327357745-9095-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Mon, Jan 23, 2012 at 05:29:05PM -0500, Arnaud Lacombe wrote:
> Running `oldconfig' after any of the following configuration change:
> 
> either trivial addition, such as:
> 
> config A
> 	bool "A"
> 
> choice
> 	prompt "Choice ?"
> 	depends on A
> 
> 	config CHOICE_B
> 		bool "Choice B"
> 
> 	config CHOICE_C
> 		bool "Choice C"
> endchoice
> 
> or more tricky change:
> 
> OLD KCONFIG                      |  NEW KCONFIG
>                                  |
>                                  |  config A
>                                  |          bool "A"
>                                  |
> choice                           |  choice
>         prompt "Choice ?"        |          prompt "Choice ?"
>                                  |
>         config CHOICE_C          |          config CHOICE_C
>                 bool "Choice C"  |                  bool "Choice C"
>                                  |
>         config CHOICE_D          |          config CHOICE_D
>                 bool "Choice D"  |                  bool "Choice D"
> endchoice                        |
>                                  |          config CHOICE_E
>                                  |                  bool "Choice E"
>                                  |                  depends on A
>                                  |  endchoice
> 
> will not cause the choice to be considered as NEW, and thus not be asked. The
> cause of this behavior is that choice's novelty are computed statically right
> after the saved configuration has been read. At this point, the new dependency's
> value is still unknown and asserted to be `no'. Moreover, no update to this
> decision is made afterward.
> 
> Correct this by dynamically evaluating a choice's novelty, and removing the
> static evaluation.
> 
> Cc: linux-kbuild@vger.kernel.org
> Cc: LKML <linux-kernel@vger.kernel.org>,
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
> Reported-by: Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Tested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

(Please note the umlaut o in my name. If you have problems with that,
please at least write Kleine-Koenig.)

> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

Best regards and thanks
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
