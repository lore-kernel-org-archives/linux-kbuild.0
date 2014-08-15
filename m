Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:55240 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771AbaHOHn1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Aug 2014 03:43:27 -0400
Message-ID: <53EDBA1C.2020005@linutronix.de>
Date: Fri, 15 Aug 2014 09:43:24 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: Re: [PATCH v4] kconfig/symbol.c: handle choice_values that depend
 on 'm' symbols
References: <ghr4asl38m.fsf@lena.gouders.net>	<ghk3gkl32u.fsf@lena.gouders.net> <20131118180813.GB3458@free.fr>	<CADYTM3YPscaS18KqAOkymRqWKGp4vQFsrefZNtuZddpkDoBWkg@mail.gmail.com>	<ghd2c3h8bc.fsf@quad.gouders.net>	<CADYTM3b6iL3xqoZTkHxbS3aUfZMywDkYekZVmGQy2TQt-4SnTA@mail.gmail.com> <ghwqaayzj6.fsf@quad.gouders.net>
In-Reply-To: <ghwqaayzj6.fsf@quad.gouders.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Bin Liu <binmlist@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

On 08/15/2014 09:37 AM, Dirk Gouders wrote:
> Here, I still see the problem (I was wondering if the issue has been
> solved/gone by a kconfig-file modification).
> 
> Perhaps, Sebastian could check if the problem, he reported still exists...

I will re-test tonight and report. I don't see the patch in this thread
(and I remeber that it fixed the issue) so I doubt that anything will
change but lets see.

> 
> Dirk

Sebastian
