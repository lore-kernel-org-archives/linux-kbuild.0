Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:56852 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755147Ab3JXQuV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Oct 2013 12:50:21 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: choice =y selection becomes lost after having multiple entries =m with depends on
In-Reply-To: <52694894.8090201@linutronix.de> (Sebastian Andrzej Siewior's
	message of "Thu, 24 Oct 2013 18:19:32 +0200")
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de> <givc0mbs9b.fsf@karga.hank.lab>
	<52694894.8090201@linutronix.de>
Date: Thu, 24 Oct 2013 18:50:28 +0200
Message-ID: <ghob6ebokr.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:

> On 10/24/2013 05:30 PM, Dirk Gouders wrote:
>> Hi Sebastian,
>
> Hi Dirk,
>
>> I was looking at what you described and initially had a hard time to
>> reproduce the problem, probably because I tried it after `make
>> mrproper'.  I am only able to reproduce the problem with an existing
>> .config of my running kernel, for example.
>> 
>> Just to make sure that I am correctly trying to reproduce the problem:
>> did you already try to do what you described after a `make mrproper' and
>> do you then also notice the described problems?  If not, could you
>> please try that?
>
> What is the purpose behind mrproper?
> The key to reproduce it is to have a .config with atleast two items
> within a choice statement which also have a "depends on" statement and
> those set to =m. If you don't have this after mrproper (with your fresh
> .config) then you don't see it.

Hi Sebastian,

what I meant was that you start all steps that you previously described
with one initial mrproper, i.e.:

1) make mrproper
2) make menuconfig and select the gadgets with 'm', then save and exit
3) make menuconfig and select 'y' for "USB Gadget Drivers", then save
   and exit.
4) Check for problems either with menuconfig or directly in .config

With that initial mrproper I was not able to reproduce the problem
and therefore I suspect some content of an existing .config causing
the problems.

Dirk

PS: Probably `make mrproper' can be replaced by `rm .config' but I tested
    it only once and cannot say for sure.)

>> 
>> Thanks,
>> 
>> Dirk
>
> Sebastian
