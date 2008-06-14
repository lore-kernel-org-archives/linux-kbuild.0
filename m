Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53419 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbYFNKFX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jun 2008 06:05:23 -0400
Subject: Re: about size optimizations (Re: Not as much ccache win as I
	expected)
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com>
	 <1213429403.26255.298.camel@pmac.infradead.org>
	 <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2008 11:05:17 +0100
Message-Id: <1213437917.26255.335.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@gmail.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

On Sat, 2008-06-14 at 10:56 +0100, Oleg Verych wrote:
> I saw that. My point is pure text processing. But as it seems doing
> `make` is a lot more fun than to do `sh` && `sed`.

The problem is that it _isn't_ pure text processing. There's more to
building with --combine than that, and we really do want the compiler to
do it.

_Sometimes_ you can just append C files together and they happen to
work. But not always. A simple case where it fails would be when you
have a static variable with the same name in two different files.

The compiler will do the right thing there., while naïve concatenation
of C files will not.

Of course, it's _possible_ to have external text processing cope with
this case somehow -- you'd probably feed it through the preprocessor,
then look at the output of the preprocessor and make the variable names
unique, perhaps? And then move on to the next case which is already
handled in gcc...

But really, I'd rather just leave it to the compiler. And it's not
because I have some masochistic fascination with makefiles :)

-- 
dwmw2

