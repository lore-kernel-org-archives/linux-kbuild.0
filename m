Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f52.google.com ([209.85.213.52]:57488 "EHLO
	mail-yw0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757701Ab2GKOA7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jul 2012 10:00:59 -0400
Received: by mail-yw0-f52.google.com with SMTP id p61so1427205yhp.11
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jul 2012 07:00:59 -0700 (PDT)
MIME-Version: 1.0
Reply-To: martin-eric.racine@iki.fi
In-Reply-To: <20120711134621.GT28778@vostochny.stro.at>
References: <CAPZXPQfE7M0Jzsns4zKrKu0x55_AWEUpzydm1dUOshhZo_ki=A@mail.gmail.com>
	<20120711134621.GT28778@vostochny.stro.at>
Date: Wed, 11 Jul 2012 17:00:58 +0300
Message-ID: <CAPZXPQcRsTX7iKo=qUa5-XgrviqiknoC3Qe40=2AKE5R3epY6A@mail.gmail.com>
Subject: Re: 'make deb-pkg' generates a linux-headers-(version) that skips
 some files
From: =?UTF-8?Q?Martin=2D=C3=89ric_Racine?= <martin-eric.racine@iki.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <maks@stro.at>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

2012/7/11 maximilian attems <maks@stro.at>:
> On Wed, Jul 11, 2012 at 04:14:08PM +0300, Martin-Éric Racine wrote:
>>
>> Compilation of the standalone modules failed, because the
>> linux-headers package produced by 'make deb-pkg' failed to include
>> (arch/x86/Makefile_32.cpu), which had to be copied by hand to complete
>> the build.
>
> It is already fixed in linux-next.

Excellent! Is there any particular reason not to merge this particular
fix into HEAD immediately?

Martin-Éric
