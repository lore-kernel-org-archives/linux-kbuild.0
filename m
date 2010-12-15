Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57248 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750935Ab0LOBq0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Dec 2010 20:46:26 -0500
Received: by iyi12 with SMTP id 12so610235iyi.19
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Dec 2010 17:46:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201012150034.01356.yann.morin.1998@anciens.enib.fr>
References: <201012150034.01356.yann.morin.1998@anciens.enib.fr>
Date: Tue, 14 Dec 2010 20:46:25 -0500
Message-ID: <AANLkTinac7i0ZtrpzP3pTj=iFawReoTT0H-1JG=TH7K_@mail.gmail.com>
Subject: Re: RFC: multi-sourced file, multiple choice 'instanciations'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

[Not sure if you will ever read this mail as you seem to block my traffic.]

On Tue, Dec 14, 2010 at 6:34 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Hello All!
>
> For a project I'm maintaining, crosstool-NG [0], I'm using Kconfig to setup
> the configuration.
>
> In this context, I have the need for options that are common to multiple,
> exclusive components (each a boolean in a choice). Each component also
> has its own set of options. What makes it complex is that, given three
> components, only two have the common options, while the third will not.
> See [1] for an example of such a (limited, yet representative) setup.
>
> But currently, mconf refuses to include the same files more than once:
>  component-2.in:12: file 'common.in' is already sourced from 'component-1.in'
>
> This is trivial to 'fix', when the multi-sourced file does not have choices
> in it, that is only bools, strings, ints... Just yank the 6-or-so lines that
> are responsible for the check.
>
this open the way to infinite inclusion loop.

I need to check the code for the rest.

 - Arnaud
