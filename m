Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:55379 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753948Ab2ATUbs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Jan 2012 15:31:48 -0500
Received: by werb13 with SMTP id b13so755235wer.19
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jan 2012 12:31:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120120164036.GO4066@pengutronix.de>
References: <20120120164036.GO4066@pengutronix.de>
Date: Fri, 20 Jan 2012 15:31:47 -0500
Message-ID: <CACqU3MXOXtfmcvk6qmLL3hKfki=n1E70dy6PmamzhC-68gsBww@mail.gmail.com>
Subject: Re: inconvenience when hand editing DEBUG_LL in .config
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

Hi,

2012/1/20 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>:
> Hello,
>
> usually when I want to change a single kernel option I just open .config
> in my editor, remove the line for the config item I want to change and
> run oldconfig. For DEBUG_LL (defined in arch/arm/Kconfig.debug) this
> doesn't work as usual though.
>
> On 3.3-rc1 the following happens:
>
>        make ARCH=arm at91rm9200_defconfig
>        sed -i /CONFIG_DEBUG_LL/d .config
>        make ARCH=arm oldconfig
>
> The last command then asks me for DEBUG_LL, after specifying 'y', the
> output looks as follows:
>
>        Verbose user fault messages (DEBUG_USER) [N/y/?] n
>        Kernel low-level debugging functions (read help!) (DEBUG_LL) [N/y/?] (NEW) y
>          Kernel low-level debugging port
>          > 1. No low-level debugging UART (DEBUG_LL_UART_NONE) (NEW)
>            2. Kernel low-level debugging via EmbeddedICE DCC channel (DEBUG_ICEDCC) (NEW)
>            3. Kernel low-level debugging on rm9200, 9260/9g20, 9261/9g10 and 9rl (AT91_DEBUG_LL_DBGU0) (NEW)
>          choice[1-3]: 1
>          Early printk (EARLY_PRINTK) [N/y/?] (NEW)
>
> Note that I didn't specify the '1' for the choice even though all items
> are marked as new and oldconfig only starts at EARLY_PRINTK to ask
> again.
>
> I would have expected to be able to select AT91_DEBUG_LL_DBGU0.
>
> This is not intended, is it?
>
definitively not.

Here is a reduced testcase showing the issue:

config A
        bool "A"
        default y
choice
        prompt "Choice ?"
        depends on A

        config CHOICE_A
                bool "Choice A"

        config CHOICE_B
                bool "Choice B"
endchoice

To trigger the issue, you need a two-step process, as you did:

 1) create a base configuration, lets assume the default one:

% make alldefconfig && cat .config
#
# Automatically generated file; DO NOT EDIT.
# Linux Kernel Configuration
#
CONFIG_A=y
CONFIG_CHOICE_A=y
# CONFIG_CHOICE_B is not set

 2) amend the config:

% sed -i /CONFIG_A/d .config && cat .config

Then, when you run `oldconfig', you will get:

% make ARCH=arm oldconfig
scripts/kconfig/conf --oldconfig Kconfig
*
* Restart config...
*
*
* Linux Kernel Configuration
*
A (A) [Y/n] (NEW) y
  Choice ?
  > 1. Choice A (CHOICE_A)
    2. Choice B (CHOICE_B)
  choice[1-2]: 1
#
# configuration written to .config
#

without being asked for the choice.

This will also happen when a choice's dependency appears between two version.

I would assume that the choice value is known, ie. not marked as 'NEW'
and thus not re-asked. What I think should be done is to reset known
choice value, if the choice dependency is marked as 'NEW'.

 - Arnaud

> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
