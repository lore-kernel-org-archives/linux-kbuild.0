Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:63447 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbZLNFe6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 00:34:58 -0500
MIME-Version: 1.0
In-Reply-To: <20091213172855.GA11741@merkur.ravnborg.org>
References: <alpine.LSU.2.01.0912112023170.32039@obet.zrqbmnf.qr>
	 <9b2db90b0912122323w25d2d815o70d0bd2f1e19a228@mail.gmail.com>
	 <alpine.LSU.2.01.0912131118280.28039@obet.zrqbmnf.qr>
	 <20091213115546.GA10592@merkur.ravnborg.org>
	 <alpine.LSU.2.01.0912131524250.6621@obet.zrqbmnf.qr>
	 <20091213172855.GA11741@merkur.ravnborg.org>
Date: Mon, 14 Dec 2009 07:34:57 +0200
Message-ID: <9b2db90b0912132134x48985df9o1ba6c864f649dc1f@mail.gmail.com>
Subject: Re: nconfig v7
From: Nir Tzachar <nir.tzachar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

>> I think the discussion went about "show hidden symbols" rather than
>> "show everything in a single menu". Or at least that was my intention -
>> sorry for any confusion.
>
> I did not check what nconfig does exactly - I just assumed it was
> the single_menu mode.
> I know several people has requested the possibility to see all
> ie. also hidden) symbols before.
>
>        Sam
>

nconfig derives the single menu mode from menuconfig. However, it
makes the code rather hard to maintain/understand, and if there is no
use for this feature, I would like to remove it.

Nir.
