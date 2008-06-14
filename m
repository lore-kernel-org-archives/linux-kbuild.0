Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:33525 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbYFNHn1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jun 2008 03:43:27 -0400
Subject: Re: about size optimizations (Re: Not as much ccache win as I
	expected)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 14 Jun 2008 08:43:23 +0100
Message-Id: <1213429403.26255.298.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

On Fri, 2008-06-13 at 22:52 +0100, Oleg Verych wrote:
> Using same `gcc -E` principle, I once had a dream to create
> build with something like "whole-kernel-at-time" optimising
> compiler option:

Doing it for the whole kernel probably doesn't buy you a whole lot more
than doing it a bit more selectively, which is what I was doing in
http://lkml.org/lkml/2006/8/24/212

I think Segher has been playing with it a bit recently, and confirms my
suspicion that combining kernel/ with arch/$ARCH/kernel, and mm/ with
arch/$ARCH/mm, is also a big win.

The GCC problems should mostly be fixed now, I think -- we just need to
have another go at doing the Kbuild side of it properly.

-- 
dwmw2

