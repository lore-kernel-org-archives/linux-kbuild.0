Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59181 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752239AbbBXALZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2015 19:11:25 -0500
Message-ID: <1424736683.2318.0.camel@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Update all configs using savedefconfig
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 24 Feb 2015 11:11:23 +1100
In-Reply-To: <CAMuHMdXXoqhwEf6P0pbJb_JkEKkK4bOGBVt8jG-gqKYBBDeHQA@mail.gmail.com>
References: <1421737558-14756-1-git-send-email-mpe@ellerman.id.au>
	 <CAMuHMdXXoqhwEf6P0pbJb_JkEKkK4bOGBVt8jG-gqKYBBDeHQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linuxppc-dev <linuxppc-dev@ozlabs.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 2015-02-23 at 10:59 +0100, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Tue, Jan 20, 2015 at 8:05 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > It looks like it's ~4 years since we updated some of these, so do a bulk
> > update.
> >
> > Verified that the before and after generated configs are exactly the
> > same.
> 
> Yep, that's guaranteed by the tool (modulo bugs).
> 
> > Which begs the question why update them? The answer is that it can be
> > confusing when the stored defconfig drifts too far from the generated
> > result.
> 
> And it becomes hard to update them, e.g. for enabling or disabling a single
> option.
> 
> Now the big question is: do they still work?
> Plainly ignoring any bugs introduced in the code, there are probably several
> "select" statements that have been removed. 4 years ago, they automatically
> selected some critical options, while now, they're no longer selected, causing
> breakage.

Yeah true. So far no one has yelled at me, so perhaps we got lucky :)

cheers


