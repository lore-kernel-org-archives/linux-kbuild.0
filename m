Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:57252 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752230Ab2GRIFz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jul 2012 04:05:55 -0400
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH] scripts/package/builddeb: upgrade to current practices
References: <1342547874.5129.2.camel@henna.lan>
	<20120717193951.GA15208@burratino>
	<CAPZXPQc02=6FnTb_RmgfpW+A4=N_huZW1FUYdjJ=Nt0Y3pqZ+A@mail.gmail.com>
	<20120717212305.GV28778@vostochny.stro.at>
	<CAPZXPQfBPXaRtK3QdY_PA=3GRrUz9+y3aU-2AvedvTwn8tOnqg@mail.gmail.com>
	<20120718065615.GW28778@vostochny.stro.at>
	<CAPZXPQdKFW5uDaJ-ufqLXKqtrq+jvoFfoDU9CQ4WLyQ0ZHaVew@mail.gmail.com>
Date: Wed, 18 Jul 2012 10:05:14 +0200
In-Reply-To: <CAPZXPQdKFW5uDaJ-ufqLXKqtrq+jvoFfoDU9CQ4WLyQ0ZHaVew@mail.gmail.com>
	(=?utf-8?Q?=22Martin-=C3=89ric?= Racine"'s message of "Wed, 18 Jul 2012
 10:21:58 +0300")
Message-ID: <871uk9bikl.fsf@nemi.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: martin-eric.racine@iki.fi
Cc: maximilian attems <max@stro.at>, Jonathan Nieder <jrnieder@gmail.com>, linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

Martin-Éric Racine <martin-eric.racine@iki.fi> writes:

> Does the kernel look for modules in versioned, then non-versioned
> directories, in that order? More importantly, does it even attempt
> looking in the versioned directory at all?

/lib/udev/firmware.agent does this:

FIRMWARE_DIRS="/lib/firmware/$(uname -r) /lib/firmware /usr/local/lib/firmware /usr/lib/hotplug/firmware"

for DIR in $FIRMWARE_DIRS; do
    [ -e "$DIR/$FIRMWARE" ] || continue



Bjørn
