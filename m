Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35800 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286AbbGEImJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jul 2015 04:42:09 -0400
MIME-Version: 1.0
In-Reply-To: <1436002433.20057.49.camel@tiscali.nl>
References: <cover.1435927467.git.andreas.ruprecht@fau.de>
	<a2424e6c57a4d6c38369c393ba58e0d050b7c130.1435927467.git.andreas.ruprecht@fau.de>
	<1436002433.20057.49.camel@tiscali.nl>
Date: Sun, 5 Jul 2015 08:44:41 +0200
Message-ID: <CAEMqcmpnL58MpscBgs6YmrhTeVUKeHDhox2hWJ6wyX9ks=PHYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: also warn of unhandled characters in statements
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Andreas Ruprecht <andreas.ruprecht@fau.de>, Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net, Michal Marek <mmarek@suse.cz>

On Sat, Jul 4, 2015 at 11:33 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> On vr, 2015-07-03 at 14:46 +0200, Andreas Ruprecht wrote:
>> While commit 2e0d737fc76f ("kconfig: don't silently ignore unhandled
>> characters") introduced a warning for unsupported characters inside
>> parameters,
>
> What are "parameters"? The term doesn't show up in Documentation/kbuild.
>

zconf.l parses each line like "<COMMAND> <PARAM> <PARAM> ...", with a slightly
different set of characters allowed for <COMMAND> and <PARAM> (for whatever
reason). I agree that that's not clear from the commit message alone though.

(As a side note, that Flex/gperf split seems kinda odd to me. Does anyone know
of a good reason why more lexing wasn't done in zconf.l? Is it an optimization
attempt?)

Cheers,
Ulf
