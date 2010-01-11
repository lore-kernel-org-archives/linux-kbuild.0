Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:58672 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750712Ab0AKKtQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jan 2010 05:49:16 -0500
Date: Mon, 11 Jan 2010 10:52:01 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] Makefile: do not override LC_CTYPE
Message-ID: <20100111105201.2d86135b@lxorguk.ukuu.org.uk>
In-Reply-To: <4B47CACA.7080103@zytor.com>
References: <20100108115745.GA14758@sepie.suse.cz>
	<1262952988-16563-1-git-send-email-mmarek@suse.cz>
	<4B47C94E.8070302@redhat.com>
	<4B47CACA.7080103@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Masami Hiramatsu <mhiramat@redhat.com>, Michal Marek <mmarek@suse.cz>, Simon Horman <horms@verge.net.au>, Roland Dreier <rdreier@cisco.com>, Sam Ravnborg <sam@ravnborg.org>, Sergei Trofimovich <slyfox@inbox.ru>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org

> This is tolower/toupper()?  Do there exist locales where tolower/toupper
> on ASCII input do weird things, or are we merely hypothesizing?

Turkish is the famous one for this and usually causes
internationalisation chaos. So yes they exist, and there are worse more
esoteric cases. There are good reasons sed and friends support classes as
well as old C locale style ranges.

Alan
