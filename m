Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43953 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752810AbaHSHAw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 03:00:52 -0400
Message-ID: <53F2F622.2020908@suse.cz>
Date: Tue, 19 Aug 2014 09:00:50 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: fix bug with modpost Makefile warn flag inclusion
References: <CA+1_+FO=65Hbd1bcTgb6WS4OwdF6W38fyiE1C2rWiU+=s_CHQQ@mail.gmail.com>
In-Reply-To: <CA+1_+FO=65Hbd1bcTgb6WS4OwdF6W38fyiE1C2rWiU+=s_CHQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Ton <linuxham@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 2014-08-18 21:52, Mike Ton wrote:
> From: Michael Ton <linuxham@gmail.com <mailto:linuxham@gmail.com>>
> 
> The current Makefile.modpost file includes a warn (-w) flag to modpost
> if KBUILD_EXTMOD or KBUILD_MODPOST_WARN.  This flag should only be added
> if both flags are true.

Why?


> Whenever KBUILD_MODPOST is true, modpost
> currently only prints warnings and does not exit on error (such as on an
> undefined symbol).

Yes, that's what Documentation/kbuild/kbuild.txt and the comment at the
beginning of the Makefile say.

Michal
