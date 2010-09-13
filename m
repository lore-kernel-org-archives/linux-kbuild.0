Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:60882 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750871Ab0IMKn7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 06:43:59 -0400
Message-ID: <4C8E006D.6020706@suse.cz>
Date: Mon, 13 Sep 2010 12:43:57 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] nconfig: Fix help for choice menus
References: <1284107570-17124-1-git-send-email-bebarino@gmail.com> <AANLkTimy0Ygv6rtL7MA+Lf5_AX5F-VFiDeJZ7GMLbLia@mail.gmail.com>
In-Reply-To: <AANLkTimy0Ygv6rtL7MA+Lf5_AX5F-VFiDeJZ7GMLbLia@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <nir.tzachar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bebarino@gmail.com

On 12.9.2010 10:06, Nir Tzachar wrote:
> On Fri, Sep 10, 2010 at 11:32 AM, Stephen Boyd <bebarino@gmail.com> wrote:
>> When getting the help for a choice menu with a help section (for example
>> the "Choose SLAB allocator" menu) nconfig pops up a window with nothing
>> inside it. This is due to show_help() passing an empty string to
>> show_scroll_win()'s 3rd argument. The option really does have help
>> though, but it isn't a config symbol, so just add the help text for
>> the option, and don't try to add anything else like the config option
>> name.
> 
> 
> Acked-by: Nir Tzachar <nir.tzachar@gmail.com>


Thanks, applied.

Michal
