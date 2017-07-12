Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:53863 "EHLO
        sasl.smtp.pobox.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750869AbdGLRk7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2017 13:40:59 -0400
Date: Wed, 12 Jul 2017 13:34:46 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [RFC PATCH] x86: enable dead code and data elimination (LTO)
In-Reply-To: <87a849aaa3.fsf@firstfloor.org>
Message-ID: <alpine.LFD.2.20.1707121331060.1959@knanqh.ubzr>
References: <20170709031333.29443-1-npiggin@gmail.com> <20170709090551.bm2c55ctt3togim7@gmail.com> <CAK7LNAR-VF2o3-qcCXnkath_B74KQodh_vezPRErGPhZSao2VA@mail.gmail.com> <alpine.LFD.2.20.1707090946090.1959@knanqh.ubzr> <20170710121329.77dd3364@roar.ozlabs.ibm.com>
 <87a849aaa3.fsf@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, 12 Jul 2017, Andi Kleen wrote:

> Nicholas Piggin <npiggin@gmail.com> writes:
> >> 
> >> I think we should aim for gc-sections to be used by default and have LTO 
> >> as a possible option only.
> >
> > I agree after it starts getting implemented and debugged by small
> > system users, we could make it default in the interest of sharing
> > testing and reducing combinations.
> 
> From what i understand the main drawback in the past was
> is that various linker versions become very slow with thousands of
> sections.
> 
> So it may cost you built time. For a special small build it's probably
> ok, but you wouldn't want to make it default.
> 
> Also usually it's only useful without modules because if you
> use modules EXPORT_SYMBOL pulls in a lot of unused functions.

I created CONFIG_TRIM_UNUSED_KSYMS mainly to avoid that issue. It is 
highly effective with either gc-sections and LTO.


Nicolas
