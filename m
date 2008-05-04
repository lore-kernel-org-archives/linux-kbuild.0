Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpq2.groni1.gr.home.nl ([213.51.130.201]:47070 "EHLO
	smtpq2.groni1.gr.home.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755307AbYEDT2I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 15:28:08 -0400
Message-ID: <481E0E76.3060900@gmail.com>
Date: Sun, 04 May 2008 21:28:54 +0200
From: Rene Herman <rene.herman@gmail.com>
MIME-Version: 1.0
Subject: Re: kconfig - a suggestion how to fix the select issue
References: <20080504071041.GA15315@uranus.ravnborg.org>
In-Reply-To: <20080504071041.GA15315@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On 04-05-08 09:10, Sam Ravnborg wrote:

> Today we have two ways to express/solve dependencies.
> 
> Top-down we have "depends on"
> and bottom up we have "select".
> 
> The "depends on" dependencies at the same
> time impact the visibility of a symbol.
> A symbol with "depends on" not satisfied are not
> visible and thus not shown in menuconfig.

I've always really disliked the visibility thing. I believe it's not really 
the core issue here but regardless of anything else, could we not "grey out" 
non-selectable options with its helpt text still available? That's much more 
the standard UI paradigm.

Rene.
