Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:40678 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751355AbaLSQbL convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Fri, 19 Dec 2014 11:31:11 -0500
Message-Id: <549460DD0200007800051182@mail.emea.novell.com>
Date: Fri, 19 Dec 2014 16:31:09 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] kconfig: don't silently ignore unhandled
 characters
References: <5458A4FC0200007800044AC1@mail.emea.novell.com>
 <1415110006.20372.165.camel@x220>
 <5458ED470200007800044DA7@mail.emea.novell.com>
 <1418120161.2058.97.camel@x220>
In-Reply-To: <1418120161.2058.97.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

Hi Paul,

>>> On 09.12.14 at 11:16, <pebolle@tiscali.nl> wrote:
> It's been five weeks since you've sent this. I'm not aware of any other
> comments beside mine. Here's what I'd suggest to get things moving:
> 
> Resend these patches.

I guess I'll do this as soon as I got to merge my patch queue onto
3.19-rc, i.e. hopefully early next year.

> Don't bother sending to Yann, that's pointless. Do
> include lkml. Perhaps also include Michal Marek and/or Andrew Morton:
> one of them might handle these patches. Who knows...
> 
> For 1/2 feel free to add
>     Acked-by: Paul Bolle <pebolle@tiscali.nl>
> 
> _provided_ you change the printf([...]) to a fprintf(stderr, [...]).

While I can do that, this will end up being inconsistent with all other
code in zconf.l - it's all using printf(). I therefore think this would
better be another patch changing all of them info fprintf(stderr, ).

Jan

