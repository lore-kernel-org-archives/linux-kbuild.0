Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ezexch.ezchip.com ([212.179.42.101]:34902 "EHLO
	ezexch.ezchip.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176Ab2LJKGb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Dec 2012 05:06:31 -0500
From: Noam Camus <noamc@ezchip.com>
Date: Mon, 10 Dec 2012 12:06:02 +0200
Subject: RE: Makefile race between jobs
Message-ID: <264C179F799EF24AB26D5319053335E80CC31B9D5B@ezexch.ezchip.com>
References: <264C179F799EF24AB26D5319053335E80CC3049A10@ezexch.ezchip.com>
	<50C4B8F3.6030704@suse.cz>
	<264C179F799EF24AB26D5319053335E80CC31B9D41@ezexch.ezchip.com>
 <20121210094515.GA31121@sepie.suse.cz>
In-Reply-To: <20121210094515.GA31121@sepie.suse.cz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

-----Original Message-----
> From: Michal Marek [mailto:mmarek@suse.cz] 
> Sent: Monday, December 10, 2012 11:45 AM
> To: Noam Camus
> Cc: linux-kbuild@vger.kernel.org; linux-kernel@vger.kernel.org; Arnd Bergmann
> Subject: Re: Makefile race between jobs

> I see the problem now. However, so far, no other architecture has been doing this. 'grep -e -include arch/*/Makefile' shows only one instance in arch/arm, but that include is a static file with no dependencies. Is it really necessary to include asm/current.h when compiling _every_ file? Sure, you get it via many common headers, but then you don't need to add it explicitly :). But if Arnd thinks this is OK, I will merge a patch that serializes scripts/mod/empty.o and asm-generic.

> Michal


According to my architecture maintainer it is mandatory.



