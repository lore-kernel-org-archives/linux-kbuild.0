Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:47303 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755908Ab0LDVKB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 4 Dec 2010 16:10:01 -0500
Received: by iwn6 with SMTP id 6so1485166iwn.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 13:10:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1291482609.8025.57.camel@localhost>
References: <1290488397.6770.1404.camel@localhost>
	<20101203122347.GA12395@sepie.suse.cz>
	<1291482609.8025.57.camel@localhost>
Date: Sat, 4 Dec 2010 16:09:59 -0500
Message-ID: <AANLkTin_kUU=3G6MBZWC_B=413iU5tZJQgY__exXMiJm@mail.gmail.com>
Subject: Re: [PATCHv2] Kbuild: kconfig: Verbose version of --listnewconfig
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

Hi,

On Sat, Dec 4, 2010 at 12:10 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> If the KBUILD_VERBOSE environment variable is set to non-zero, show
> the default values of new symbols and not just their names.
>
One more thing. This patch would be the first to introduce a KBUILD_
environment variable into kconfig. All the other environment variable
used are prefixed with KCONFIG_. Maybe would it be better to introduce
a KCONFIG_VERBOSE variable and link it to KBUILD_VERBOSE in kconfig's
Makefile. That would also remove the need to atoi() its value.

 - Arnaud
