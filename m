Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:37420 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051Ab3JXQTj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Oct 2013 12:19:39 -0400
Message-ID: <52694894.8090201@linutronix.de>
Date: Thu, 24 Oct 2013 18:19:32 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: Re: choice =y selection becomes lost after having multiple entries
 =m with depends on
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr> <5267B2D3.3000109@linutronix.de> <givc0mbs9b.fsf@karga.hank.lab>
In-Reply-To: <givc0mbs9b.fsf@karga.hank.lab>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

On 10/24/2013 05:30 PM, Dirk Gouders wrote:
> Hi Sebastian,

Hi Dirk,

> I was looking at what you described and initially had a hard time to
> reproduce the problem, probably because I tried it after `make
> mrproper'.  I am only able to reproduce the problem with an existing
> .config of my running kernel, for example.
> 
> Just to make sure that I am correctly trying to reproduce the problem:
> did you already try to do what you described after a `make mrproper' and
> do you then also notice the described problems?  If not, could you
> please try that?

What is the purpose behind mrproper?
The key to reproduce it is to have a .config with atleast two items
within a choice statement which also have a "depends on" statement and
those set to =m. If you don't have this after mrproper (with your fresh
.config) then you don't see it.

> 
> Thanks,
> 
> Dirk

Sebastian
