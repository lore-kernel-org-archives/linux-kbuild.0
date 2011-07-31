Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:32847 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752015Ab1GaB2u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 Jul 2011 21:28:50 -0400
Message-ID: <4E34AFAD.90008@zytor.com>
Date: Sat, 30 Jul 2011 18:28:13 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Enable 'make CONFIG_FOO=y oldconfig'
References: <1312067499.22074.59.camel@i7.infradead.org> <1312067670.22074.61.camel@i7.infradead.org> <CACqU3MV460WGjmQdOOmhk3ZJT1FNjEjfuHqx8mYcgun9+7SfjA@mail.gmail.com> <4E34998D.8060806@zytor.com> <CACqU3MWn-OQVfLH96E+AeTCEjUw5+girXbuNgmUvXrEQuBe4vg@mail.gmail.com> <4E34A1E4.8040103@zytor.com> <CACqU3MVkLXoBq7KP2Jff=p7EiKR7DkPa4z7y0Rdah-dGzRvj4g@mail.gmail.com>
In-Reply-To: <CACqU3MVkLXoBq7KP2Jff=p7EiKR7DkPa4z7y0Rdah-dGzRvj4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On 07/30/2011 06:06 PM, Arnaud Lacombe wrote:
>>
> The principle of least surprise is broken anyway as the proposed patch
> has absolutely no dependency checking and verification. You can `make
> CONFIG_SATA_MV=y allnoconfig', you will _not_ get it set.
> 
This gives you exactly the same way as a .config file or a ALLCONFIG
file with the same options, which is what one realistically should expect.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

