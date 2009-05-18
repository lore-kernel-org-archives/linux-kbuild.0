Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.wp.pl ([212.77.101.5]:10838 "EHLO mx1.wp.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750779AbZERInU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 May 2009 04:43:20 -0400
Date: Mon, 18 May 2009 10:49:30 +0200
From: Krzysztof Helt <krzysztof.h1@wp.pl>
Subject: Re: Kconfig: fix problem in HID menu
Message-Id: <20090518104930.b9eb9936.krzysztof.h1@wp.pl>
In-Reply-To: <4A111A85.6030508@gmail.com>
References: <20090517175617.81323cc1.krzysztof.h1@wp.pl>
	<4A111A85.6030508@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-kbuild@vger.kernel.org, LKLM <linux-kernel@vger.kernel.org>, Jiri Kosina <jkosina@suse.cz>

On Mon, 18 May 2009 10:21:25 +0200
Jiri Slaby <jirislaby@gmail.com> wrote:

> On 05/17/2009 05:56 PM, Krzysztof Helt wrote:
> > Following syntax does not work properly if there is an options FOO2 depending on the FOO:
> > 
> > config FOO
> > 	tristate "Foo" if EMBEDDED
> > 	depends on FUD
> > 	default !EMBEDDED
> > 
> > config FOO2
> > 	bool "Foo2"
> > 	depends on FOO
> > 
> > If the EMBEDDED is not selected the FOO option is selected
> > and it cannot be unselected.
> 
> Uhuh, but that's correct behaviour. We don't want to bother user with
> tons of drivers unless he is compiling for embedded. Or am I missing
> something?
> 

I see now. I was little surprised by this. Please ignore my patch.

Regards,
Krzysztof
