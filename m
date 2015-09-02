Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33953 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805AbbIBE6g (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Sep 2015 00:58:36 -0400
Received: by wicfx3 with SMTP id fx3so4396511wic.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Sep 2015 21:58:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhgpBNwHqivqiyV7b-39GSOtpyzDhCkeSqPV8LpZ3aasTQ@mail.gmail.com>
References: <1441115335-25165-1-git-send-email-riku.voipio@linaro.org>
	<CA+r1ZhgpBNwHqivqiyV7b-39GSOtpyzDhCkeSqPV8LpZ3aasTQ@mail.gmail.com>
Date: Wed, 2 Sep 2015 07:58:35 +0300
Message-ID: <CAAqcGHnrKU4DJanSJUJMdd6vz2_OR5X2Z51NmrzX1RpT1RQQXw@mail.gmail.com>
Subject: Re: [PATCH] package/Makefile: move source tar creation to a function
From: Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 1 September 2015 at 17:31, Jim Davis <jim.epost@gmail.com> wrote:
>> - Replace symlink to self with tar --transform

> While probably everyone -- or almost everyone -- uses gnu tar, that
> particular option isn't available in older versions of gnu tar
> (https://groups.google.com/forum/#!topic/uk.comp.os.linux/-7LDdMSRo5w).
> Perhaps something could be added to Documentation/Changes about the
> gnu tar version required?

Looking at the changelog, this was added to tar 1.16 which was
released in 2006. Nine years sounds like a reasonable timeframe to
expect a feature being available?

Riku
