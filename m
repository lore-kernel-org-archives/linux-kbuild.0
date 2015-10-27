Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37928 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbbJ0In2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 04:43:28 -0400
Received: by wicll6 with SMTP id ll6so149131801wic.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 01:43:27 -0700 (PDT)
Message-ID: <562F392C.6010509@dev.mellanox.co.il>
Date: Tue, 27 Oct 2015 10:43:24 +0200
From: Alaa Hleihel <alaa@dev.mellanox.co.il>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/package/Makefile: Restore the RPMOPTS variable
References: <1445040549-31011-1-git-send-email-jim.epost@gmail.com> <562E994A.2000104@suse.com>
In-Reply-To: <562E994A.2000104@suse.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, alaa.hl2@gmail.com

hi

On 10/26/2015 23:21, Michal Marek wrote:
> Dne 17.10.2015 v 02:09 Jim Davis napsal(a):
>> Restore the RPMOPTS variable to the rpm-pkg and binrpm-pkg targets
>> that commit 21a59991ce0c ("scripts/package/Makefile: rpmbuild is
>> needed for rpm targets") removed.
>>
>> Reported-by: Alaa Hleihel <alaa.hl2@gmail.com>
>> Signed-off-by: Jim Davis <jim.epost@gmail.com>
> If this is a regression fix, please add a Fixes: hash ("commit message")
> line to the signoff area.
>
> Out of curiosity, what options do you need to pass to rpmbuild?
>

A common usage will be to change the default _topdir (RPMOPTS="--define \"_topdir /tmp/build\"").

Regards,
Alaa
