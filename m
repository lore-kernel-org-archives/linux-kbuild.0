Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:34283 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbbINGdU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 02:33:20 -0400
Received: by wicfx3 with SMTP id fx3so125929598wic.1
        for <linux-kbuild@vger.kernel.org>; Sun, 13 Sep 2015 23:33:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <000701d0ee9a$ae397600$0aac6200$@net>
References: <000701d0ee9a$ae397600$0aac6200$@net>
Date: Mon, 14 Sep 2015 09:33:18 +0300
Message-ID: <CAAqcGHnxA4k__hmhEny=R1fT6yt5aBwVbk=1F6meuwiFYqcr7w@mail.gmail.com>
Subject: Re: [PATCH v5] deb-pkg: add source package
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Smythies <dsmythies@telus.net>
Cc: Michal Marek <mmarek@suse.com>, maximilian attems <maks@stro.at>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild <linux-kbuild@vger.kernel.org>, Chris J Arges <chris.j.arges@canonical.com>

On 14 September 2015 at 06:08, Doug Smythies <dsmythies@telus.net> wrote:
> However, I do not understand why I now get a .change
> file that I do not want.

Is there some problem the presence of this file causes, or is just
aesthetic issue? Some people need this file[1] for binary-only builds
as well, just just dropping it isn't really good idea.

> Nor do I want the 532 lines of "dpkg-genchanges"
> and ""Use of uninitialized value" warnings at the end
> of the compile.

That is something that should be fixed. can you paste the contents of
your debian/changelog after a bindeb-pkg run?

Riku


[1] https://lkml.org/lkml/2015/5/14/261
