Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:57019 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752023Ab2GRHrw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jul 2012 03:47:52 -0400
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] scripts/package/builddeb: upgrade to current practices
References: <1342547874.5129.2.camel@henna.lan>
	<20120717193951.GA15208@burratino>
	<CAPZXPQc02=6FnTb_RmgfpW+A4=N_huZW1FUYdjJ=Nt0Y3pqZ+A@mail.gmail.com>
	<20120717212305.GV28778@vostochny.stro.at>
	<CAPZXPQfBPXaRtK3QdY_PA=3GRrUz9+y3aU-2AvedvTwn8tOnqg@mail.gmail.com>
	<20120718065615.GW28778@vostochny.stro.at>
Date: Wed, 18 Jul 2012 09:47:37 +0200
In-Reply-To: <20120718065615.GW28778@vostochny.stro.at> (maximilian attems's
	message of "Wed, 18 Jul 2012 06:56:15 +0000")
Message-ID: <87629lbjdy.fsf@nemi.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: =?utf-8?Q?Martin-=C3=89ric?= Racine <martin-eric.racine@iki.fi>, Jonathan Nieder <jrnieder@gmail.com>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

maximilian attems <max@stro.at> writes:

> Jonathan already answered it, saying that firmwares are put
> in versioned dir.
>
> Just use git to look it up, easy:
> ~/src/linux-next (master %=)$ git log scripts/package/builddeb
>
> 6607ddadf93d19c7f64139f1475c342152f39fe5

But..but.. won't that prevent installing firmware for more than one
builddeb kernel?  I.e., shouldn't the fw package name also be versioned
if you are going to do this (which it seems you are)?

But then again, I thought versioned firmware was dropped from the
official packages for good reasons.  Any reason why you couldn't add
/lib/firmware/something (where "something" is fixed and independent of
version) to the firmware.agent search path, and use that for unofficial
linux-firmware packages?

That would allow unofficial firmware packages from different kernel
versions to continue sharing their package name without conflicting with
the official packages in any way.


Bjørn
